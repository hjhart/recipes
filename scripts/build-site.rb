#!/usr/bin/env ruby
# Build script to generate static site from Cooklang recipes

require 'json'
require 'fileutils'

# Configuration
RECIPES_DIR = 'recipes'
TEMPLATES_DIR = 'templates'
OUTPUT_DIR = 'docs'

# Clean and create output directories
FileUtils.rm_rf(OUTPUT_DIR)
FileUtils.mkdir_p(OUTPUT_DIR)

# Copy CSS
FileUtils.cp(File.join(TEMPLATES_DIR, 'styles.css'), File.join(OUTPUT_DIR, 'styles.css'))

# Copy local recipe images
Dir.glob(File.join(RECIPES_DIR, '*.{jpg,jpeg,png,webp}')).each do |img|
  FileUtils.cp(img, File.join(OUTPUT_DIR, File.basename(img)))
end

# Find all .cook files
recipe_files = Dir.glob(File.join(RECIPES_DIR, '*.cook'))

# Generate HTML for each recipe
recipes_data = []

recipe_files.each do |recipe_file|
  filename = File.basename(recipe_file, '.cook')
  output_file = File.join(OUTPUT_DIR, "#{filename}.html")
  template = File.join(TEMPLATES_DIR, 'recipe.html')
  
  puts "Generating #{filename}.html..."
  
  # Use cook report to generate HTML
  raw_output = `cook report --template #{template} #{recipe_file} 2>&1`
  # Extract only the HTML content (everything from <!DOCTYPE onwards, case-insensitive)
  doctype_index = raw_output =~ /<!DOCTYPE/i
  html_output = raw_output[doctype_index..] if doctype_index

  # Get recipe metadata for index page
  json_output = `cook recipe #{recipe_file} --format json`
  recipe_data = JSON.parse(json_output)

  metadata = recipe_data['metadata']['map']

  # Derive the display title (metadata may not have a title field)
  display_title = metadata['title'] || filename.split('-').map(&:capitalize).join(' ')

  # Inject the correct title (template uses __TITLE__ placeholder when metadata.title is missing)
  html_output = html_output.gsub('__TITLE__', display_title) if html_output

  File.write(output_file, html_output || '')
  
  # Use frontmatter image, or fall back to a local image file
  local_image = %w[jpg jpeg png webp].map { |ext| "#{filename}.#{ext}" }
                                     .find { |f| File.exist?(File.join(RECIPES_DIR, f)) }
  image = metadata['image'] || local_image

  recipes_data << {
    'filename' => filename,
    'title' => metadata['title'] || filename.split('-').map(&:capitalize).join(' '),
    'author' => metadata['author'],
    'image' => image,
    'ai_image' => metadata['ai_image'],
    'servings' => metadata['servings'],
    'total_time' => metadata['cook time'] || metadata['time required'],
    'tags' => (metadata['tags'] || '').split(',').map(&:strip)
  }
end

# Generate index page
puts "Generating index.html..."

# Sort recipes by title
recipes_data.sort_by! { |r| r['title'] }

# Read index template
index_template = File.read(File.join(TEMPLATES_DIR, 'index.html'))

# Simple template replacement (since we don't have Jinja2 in Ruby)
# We'll build the recipe cards HTML
recipe_cards = recipes_data.map do |recipe|
  ai_badge_html = recipe['ai_image'] ? '<span class="absolute top-2 right-2 text-xs bg-black/50 text-white px-2 py-0.5 rounded-full">✨ AI image</span>' : ''

  image_html = if recipe['image']
    <<~IMG
      <div class="h-48 bg-gray-100 overflow-hidden relative">
          <img src="#{recipe['image']}" alt="#{recipe['title']}" class="w-full h-full object-cover hover:scale-110 transition-transform duration-300">
          #{ai_badge_html}
      </div>
      <div class="p-5 flex-1">
    IMG
  else
    <<~PLACEHOLDER
      <div class="p-5 flex-1">
          <div class="flex items-center justify-center w-14 h-14 bg-gradient-to-br from-orange-400 to-pink-500 rounded-full mb-4">
              <span class="text-2xl">🍽️</span>
          </div>
    PLACEHOLDER
  end

  author_html = recipe['author'] ? "<p class=\"text-gray-500 text-sm italic mb-2\">by #{recipe['author']}</p>" : ""

  meta_parts = []
  meta_parts << "<span class=\"text-xs bg-orange-50 border border-orange-200 text-orange-700 px-2 py-1 rounded-full font-medium\">👥 #{recipe['servings']}</span>" if recipe['servings']
  meta_parts << "<span class=\"text-xs bg-orange-50 border border-orange-200 text-orange-700 px-2 py-1 rounded-full font-medium\">⏱️ #{recipe['total_time']}</span>" if recipe['total_time']
  meta_html = meta_parts.empty? ? "" : "<div class=\"flex flex-wrap gap-2 mb-3\">#{meta_parts.join}</div>"

  tags = recipe['tags'].reject(&:empty?)
  tags_html = tags.empty? ? "" : "<div class=\"flex flex-wrap gap-1.5\">#{tags.map { |tag| "<span class=\"text-xs bg-gradient-to-r from-yellow-100 to-orange-100 text-orange-700 px-2 py-1 rounded-full font-medium\">#{tag}</span>" }.join}</div>"

  search_text = [recipe['title'], recipe['author'], tags.join(' ')].compact.join(' ').downcase

  <<~HTML
    <a href="#{recipe['filename']}.html" data-search="#{search_text}" class="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-xl transition-all hover:scale-[1.02] recipe-card flex flex-col">
        #{image_html.strip}
            <h2 class="font-bold text-lg text-gray-800 mb-1">#{recipe['title']}</h2>
            #{author_html}
            #{meta_html}
            #{tags_html}
        </div>
    </a>
  HTML
end.join("\n")

# Replace the template variables
index_html = index_template.gsub(/{% for recipe_info in recipes %}.*{% endfor %}/m, recipe_cards)

# Write index.html
File.write(File.join(OUTPUT_DIR, 'index.html'), index_html)

puts "\n✅ Site generated successfully in #{OUTPUT_DIR}/"
puts "📝 Generated #{recipes_data.length} recipe pages"
puts "\nTo preview locally, run: cd #{OUTPUT_DIR} && python3 -m http.server 8000"
