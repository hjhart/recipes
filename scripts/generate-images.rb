#!/usr/bin/env ruby
# Generate AI images for recipes missing photos using DALL-E 3

require 'json'
require 'shellwords'

# Load .env
env_file = File.join(__dir__, '..', '.env')
File.readlines(env_file).each do |line|
  line = line.strip
  next if line.empty? || line.start_with?('#')
  key, value = line.split('=', 2)
  ENV[key] = value.to_s.strip.delete_prefix('"').delete_suffix('"')
end

API_KEY = ENV['OPENAI_API_KEY'] or abort 'OPENAI_API_KEY not set in .env'
RECIPES_DIR = File.join(__dir__, '..', 'recipes')

# Recipes to generate images for (slug => prompt description)
TARGETS = {
  'bacon-scallion-and-caramelized-onion-dip' =>
    'creamy bacon and caramelized onion dip in a bowl, topped with crispy bacon bits and sliced scallions, served with chips, rustic wooden table, overhead shot',
  'bar-del-corso-gin-and-tonic' =>
    'elegant gin and tonic cocktail in a highball glass with ice, lime wedge and fresh herbs, moody bar lighting, close-up shot',
  'basic-challah' =>
    'golden braided challah bread loaf, freshly baked, glistening with egg wash, on a wooden cutting board, natural window light',
  'bean-and-sausage-soup-with-pesto' =>
    'hearty bean and sausage soup in a rustic bowl, swirled with bright green pesto, steam rising, crusty bread alongside, overhead shot',
  'berry-crush-geraldines-cocktail' =>
    'vibrant berry crush cocktail in a coupe glass, deep purple-red color, garnished with fresh berries and mint, elegant bar setting',
  'boat-breakfast-burritos' =>
    'breakfast burritos wrapped in foil and held outdoors, morning light, casual camping or boating setting, cross-section showing eggs and filling',
}

def generate_image(prompt)
  body = JSON.generate({
    model: 'dall-e-3',
    prompt: "Professional food photography. #{prompt}. Appetizing, high quality, natural lighting.",
    n: 1,
    size: '1024x1024',
    quality: 'standard'
  })

  response = `curl -s https://api.openai.com/v1/images/generations \
    -H "Authorization: Bearer #{API_KEY}" \
    -H "Content-Type: application/json" \
    -d #{Shellwords.escape(body)}`

  data = JSON.parse(response)
  raise "API error: #{data.dig('error', 'message')}" if data['error']

  data.dig('data', 0, 'url')
end

def download_image(url, dest_path)
  system('curl', '-sL', url, '-o', dest_path)
end

def add_ai_image_frontmatter(slug)
  cook_file = File.join(RECIPES_DIR, "#{slug}.cook")
  return unless File.exist?(cook_file)

  content = File.read(cook_file)
  # Insert ai_image: true into existing frontmatter
  if content.start_with?('---')
    content = content.sub(/^---\n/, "---\nai_image: true\n")
    File.write(cook_file, content)
  end
end

TARGETS.each do |slug, prompt|
  image_path = File.join(RECIPES_DIR, "#{slug}.jpg")

  if File.exist?(image_path)
    puts "⏭️  #{slug} already has an image, skipping"
    next
  end

  print "🎨 Generating image for #{slug}... "
  $stdout.flush

  begin
    image_url = generate_image(prompt)
    download_image(image_url, image_path)
    add_ai_image_frontmatter(slug)
    puts "✅ saved to #{File.basename(image_path)}"
  rescue => e
    puts "❌ failed: #{e.message}"
  end
end

puts "\nDone! Run ./scripts/build-site.rb to rebuild the site."
