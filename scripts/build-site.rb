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
  File.write(output_file, html_output || '')
  
  # Get recipe metadata for index page
  json_output = `cook recipe #{recipe_file} --format json`
  recipe_data = JSON.parse(json_output)
  
  metadata = recipe_data['metadata']['map']
  
  # Use frontmatter image, or fall back to a local image file
  local_image = %w[jpg jpeg png webp].map { |ext| "#{filename}.#{ext}" }
                                     .find { |f| File.exist?(File.join(RECIPES_DIR, f)) }
  image = metadata['image'] || local_image

  recipes_data << {
    'filename' => filename,
    'title' => metadata['title'] || filename.split('-').map(&:capitalize).join(' '),
    'author' => metadata['author'],
    'image' => image,
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
  image_html = if recipe['image']
    <<~IMG
      <div class="card-image-container">
          <img src="#{recipe['image']}" alt="#{recipe['title']}" class="card-image">
      </div>
    IMG
  else
    <<~PLACEHOLDER
      <div class="card-placeholder">
          <span class="placeholder-icon">🍽️</span>
      </div>
    PLACEHOLDER
  end
  
  author_html = recipe['author'] ? "<p class=\"card-author\">by #{recipe['author']}</p>" : ""
  
  meta_parts = []
  meta_parts << "👥 #{recipe['servings']} servings" if recipe['servings']
  meta_parts << "⏱️ #{recipe['total_time']}" if recipe['total_time']
  meta_html = meta_parts.empty? ? "" : "<div class=\"card-meta\">#{meta_parts.map { |part| "<span class=\"meta-badge\">#{part}</span>" }.join}</div>"
  
  tags = recipe['tags'].reject(&:empty?)
  tags_html = tags.empty? ? "" : "<div class=\"card-tags\">#{tags.map { |tag| "<span class=\"tag-badge\">#{tag}</span>" }.join}</div>"
  
  <<~HTML
    <article class="recipe-collection-card">
        <a href="#{recipe['filename']}.html" class="card-link">
            #{image_html.strip}
            <div class="card-content">
                <h2 class="card-title">#{recipe['title']}</h2>
                #{author_html}
                #{meta_html}
                #{tags_html}
            </div>
        </a>
    </article>
  HTML
end.join("\n")

# Replace the template variables
index_html = index_template.gsub(/{% for recipe_info in recipes %}.*?{% endfor %}/m, recipe_cards)

# Write index.html
File.write(File.join(OUTPUT_DIR, 'index.html'), index_html)

puts "\n✅ Site generated successfully in #{OUTPUT_DIR}/"
puts "📝 Generated #{recipes_data.length} recipe pages"
puts "\nTo preview locally, run: cd #{OUTPUT_DIR} && python3 -m http.server 8000"
