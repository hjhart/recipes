#!/usr/bin/env ruby
# Batch import recipes from Notion export to .cook files

require 'fileutils'
require 'json'
require 'shellwords'

NOTION_DIR  = File.join(__dir__, '..', 'notion-export', 'Recipes')
RECIPES_DIR = File.join(__dir__, '..', 'recipes')
README_PATH = File.join(__dir__, '..', 'README.md')

# Load .env for OpenAI key
env_file = File.join(__dir__, '..', '.env')
File.readlines(env_file).each do |line|
  line = line.strip
  next if line.empty? || line.start_with?('#')
  key, value = line.split('=', 2)
  ENV[key] = value.to_s.strip
end

# Recipes to import: [Notion title, output slug]
RECIPES = [
  ["Chipotle's Queso Blanco Recipe",                              'chipotles-queso-blanco-recipe'],
  ["Erin's Breakfast Casserole",                                  'erins-breakfast-casserole'],
  ["Flour Bakery's Egg Sandwich",                                 'flour-bakerys-egg-sandwich'],
  ['Jalapeños & Cheddar Biscuits',                                'jalapenos-and-cheddar-biscuits'],
  ["Jim Hart's Salmon",                                           'jim-harts-salmon'],
  ["John's breakfast casserole",                                  'johns-breakfast-casserole'],
  ['All-American Beef Stew Recipe',                               'all-american-beef-stew-recipe'],
  ['Cheesy Broccoli Orzo',                                        'cheesy-broccoli-orzo'],
  ['Cheesy Saturday Bread',                                       'cheesy-saturday-bread'],
  ['Cheesy White Bean-Tomato Bake',                               'cheesy-white-bean-tomato-bake'],
  ['Chicken Alfredo Bake',                                        'chicken-alfredo-bake'],
  ['Chicken and broccoli baked ziti',                             'chicken-and-broccoli-baked-ziti'],
  ['Chicken and dumplings',                                       'chicken-and-dumplings'],
  ['Chicken and rice soup',                                       'chicken-and-rice-soup'],
  ['Chicken Bake',                                                'chicken-bake'],
  ['Chicken Chile Verde Instant Pot',                             'chicken-chile-verde-instant-pot'],
  ['Chicken Pot Pie with Puff Pastry',                            'chicken-pot-pie-with-puff-pastry'],
  ['Chicken Ranch Salad',                                         'chicken-ranch-salad'],
  ['Chilaquiles Breakfast Casserole',                             'chilaquiles-breakfast-casserole'],
  ['Chilaquiles Verdes',                                          'chilaquiles-verdes'],
  ['Chile Verde With Pork Recipe',                                'chile-verde-with-pork-recipe'],
  ["Chipotle's Queso Blanco Recipe",                              'chipotles-queso-blanco-recipe'],
  ['Chorizo and Sweet Potato Quesadillas for Two',                'chorizo-and-sweet-potato-quesadillas-for-two'],
  ['Cilantro Lime Pasta Salad',                                   'cilantro-lime-pasta-salad'],
  ['Cilantro Lime Rice',                                          'cilantro-lime-rice'],
  ['Classic Sage and Sausage Stuffing',                           'classic-sage-and-sausage-stuffing'],
  ['Cold Cure Soup',                                              'cold-cure-soup'],
  ['Cold Rice Salad',                                             'cold-rice-salad'],
  ['Cooks illustrated chicken salad',                             'cooks-illustrated-chicken-salad'],
  ['Corn and Avocado Salad',                                      'corn-and-avocado-salad'],
  ['Corn and Ramen Noodle Bowl Recipe',                           'corn-and-ramen-noodle-bowl-recipe'],
  ['Creamy Chicken Soup',                                         'creamy-chicken-soup'],
  ['Creamy Corn pasta with basil',                                'creamy-corn-pasta-with-basil'],
  ['Creamy Macaroni Salad',                                       'creamy-macaroni-salad'],
  ['Creamy One-Pot Orzo With Corn and Bacon',                     'creamy-one-pot-orzo-with-corn-and-bacon'],
  ['Creamy Peanut Ramen',                                         'creamy-peanut-ramen'],
  ['Creamy Red Curry Pasta',                                      'creamy-red-curry-pasta'],
  ['Creamy Shells and Beef',                                      'creamy-shells-and-beef'],
  ['Creamy Tortellini, spinach, and chicken soup',                'creamy-tortellini-spinach-and-chicken-soup'],
  ['Crispy oven fried bacon',                                     'crispy-oven-fried-bacon'],
  ['Crispy Rice Salad',                                           'crispy-rice-salad'],
  ['Crock Pot Loaded Baked Potato Soup',                          'crock-pot-loaded-baked-potato-soup'],
  ['Cuba Libre',                                                  'cuba-libre'],
  ['Cucumber Salad With Soy, Ginger and Garlic',                  'cucumber-salad-with-soy-ginger-and-garlic'],
  ['Cucumber Sesame Salad',                                       'cucumber-sesame-salad'],
  ['Deviled Egg Salad',                                           'deviled-egg-salad'],
  ['Easy Blackberry Cobbler',                                     'easy-blackberry-cobbler'],
  ['Easy Crab Cakes',                                             'easy-crab-cakes'],
  ['Easy meatloaf',                                               'easy-meatloaf'],
  ['Easy One-Pot Chicken Tinga (Spicy Mexican Shredded Chicken)', 'easy-one-pot-chicken-tinga'],
  ['Egg and Onion',                                               'egg-and-onion'],
  ['Egg salad',                                                   'egg-salad'],
  ["Erin's Breakfast Casserole",                                  'erins-breakfast-casserole'],
  ['Everything Sausage Rolls',                                    'everything-sausage-rolls'],
  ['Extra Tangy Tartar Sauce Recipe',                             'extra-tangy-tartar-sauce-recipe'],
  ['Feta pasta with Cherry Tomatoes',                             'feta-pasta-with-cherry-tomatoes'],
  ["Flour Bakery's Egg Sandwich",                                 'flour-bakerys-egg-sandwich'],
  ['Fool-proof pan pizza',                                        'foolproof-pan-pizza'],
  ['French Onion Meatballs',                                      'french-onion-meatballs'],
  ['Garlic butter pesto caprese croissants',                      'garlic-butter-pesto-caprese-croissants'],
  ['Garlic herb pull-apart bread',                                'garlic-herb-pull-apart-bread'],
  ['Gochuchang Mac & Cheese',                                     'gochuchang-mac-and-cheese'],
  ['Gochujang Buttered Noodles',                                  'gochujang-buttered-noodles'],
  ['Gochujang Garlic Bread',                                      'gochujang-garlic-bread'],
  ['Gooey Cheeseburger Dip Recipe',                               'gooey-cheeseburger-dip-recipe'],
  ["Great Grandmas Banana Bread",                                 'great-grandmas-banana-bread'],
  ['Green Chicken Enchilada Casserole',                           'green-chicken-enchilada-casserole'],
  ['Green Chile Rice Bake',                                       'green-chile-rice-bake'],
  ['Grilled Chicken for Tacos, Burritos, or Salads',             'grilled-chicken-for-tacos-burritos-or-salads'],
  ['Grilled Corn and Avocado Salad With Feta Dressing',          'grilled-corn-and-avocado-salad-with-feta-dressing'],
  ['Guinness Beef Stew',                                          'guinness-beef-stew'],
  ['Half a box of Kraft',                                         'half-a-box-of-kraft'],
  ['Ham And Cheese Sliders',                                      'ham-and-cheese-sliders'],
  ['Hard boiled eggs',                                            'hard-boiled-eggs'],
  ['Harissa Aioli',                                               'harissa-aioli'],
  ['Honey Chili Lime Chicken',                                    'honey-chili-lime-chicken'],
  ['Instant Pot Chicken Juk',                                     'instant-pot-chicken-juk'],
  ['Instant Pot Hard boiled eggs',                                'instant-pot-hard-boiled-eggs'],
  ['Italian wonderpot',                                           'italian-wonderpot'],
  ["Jalapeños & Cheddar Biscuits",                                'jalapenos-and-cheddar-biscuits'],
  ['Japanese Beef Skewers (Kushiyaki)',                           'japanese-beef-skewers-kushiyaki'],
  ["Jim Hart's Salmon",                                           'jim-harts-salmon'],
  ["John's breakfast casserole",                                  'johns-breakfast-casserole'],
  ['Jollof rice',                                                 'jollof-rice'],
]

# Notion metadata keys to skip (not included in .cook frontmatter)
SKIP_KEYS = %w[Created\ time Number\ of\ times\ cooked Most\ recently\ cooked Meal\ Calendar].freeze

def normalize(str)
  s = str.dup.force_encoding('UTF-8')
  # Normalize unicode apostrophes/quotes to plain apostrophe
  s = s.gsub(/[\u2018\u2019\u201a\u201b\u2032\u2035]/, "'")
  # Decompose accented chars and drop combining marks
  begin
    s = s.unicode_normalize(:nfkd).gsub(/\p{Mn}/, '')
  rescue
    s = s.encode('ASCII', invalid: :replace, undef: :replace, replace: '')
  end
  s.downcase.gsub(/[^a-z0-9 ]/, '').gsub(/\s+/, ' ').strip
end

def find_notion_file(title)
  norm_title = normalize(title)
  Dir.entries(NOTION_DIR).each do |entry|
    next unless entry.end_with?('.md')
    name = File.basename(entry, '.md').sub(/ [0-9a-f]{32}$/, '').strip
    return File.join(NOTION_DIR, entry) if normalize(name) == norm_title
  end
  # Fallback: starts-with for truncated long filenames
  Dir.entries(NOTION_DIR).find do |entry|
    next unless entry.end_with?('.md')
    normalize(entry).start_with?(norm_title[0..30])
  end&.then { |f| File.join(NOTION_DIR, f) }
end

def parse_notion_md(path)
  lines = File.readlines(path, chomp: true)

  title = nil
  source = nil
  tags = nil
  cook_time = nil
  servings = nil
  local_image = nil
  remote_image_url = nil
  body_lines = []

  # Parse title from first line
  if lines[0]&.start_with?('# ')
    title = lines[0].sub(/^# /, '').strip
    lines = lines[1..]
  end

  # Skip blank lines after title
  lines = lines.drop_while { |l| l.strip.empty? }

  # Parse metadata block — lines that look like "Key: value"
  metadata_done = false
  remaining = []
  lines.each do |line|
    if !metadata_done
      if line =~ /^(Created time|Number of times cooked|Most recently cooked|Meal Calendar):/
        next
      elsif line =~ /^URL:\s*(.+)$/
        source = $1.strip
      elsif line =~ /^Tags?:\s*(.+)$/
        tags = $1.strip.split(/,\s*/).map { |t| t.strip.downcase }.join(', ')
      elsif line =~ /^Time:\s*(.+)$/
        cook_time = $1.strip
      elsif line =~ /^Servings?:\s*(.+)$/i
        servings = $1.strip
      elsif line.strip.empty?
        next
      else
        metadata_done = true
        remaining << line
      end
    else
      remaining << line
    end
  end

  # Process remaining lines: find image refs, collect body
  remaining.each do |line|
    if line =~ /^!\[.*?\]\((.+?)\)$/
      img = $1.strip
      if img.start_with?('http')
        remote_image_url = img
      else
        # Decode URL encoding and resolve path
        decoded = img.gsub(/%([0-9A-Fa-f]{2})/) { $1.hex.chr(Encoding::UTF_8) }
        local_image = File.join(NOTION_DIR, decoded)
      end
    else
      body_lines << line
    end
  end

  # Try to extract servings from body if not in metadata
  if servings.nil?
    body_lines.each do |l|
      if l =~ /serv(?:ings?|es)\s*:?\s*(\d+[-–]?\d*)/i
        servings = $1.strip
        break
      end
    end
  end

  # Strip leading/trailing blank lines from body
  body = body_lines.join("\n").strip

  {
    title: title,
    source: source,
    tags: tags,
    cook_time: cook_time,
    servings: servings,
    local_image: local_image,
    remote_image_url: remote_image_url,
    body: body
  }
end

def build_cook_file(data, slug, ai_image: false)
  fm = ["---"]
  fm << "title: #{data[:title]}" if data[:title]
  fm << "source: #{data[:source]}" if data[:source]
  fm << "tags: #{data[:tags]}" if data[:tags]
  fm << "cook time: #{data[:cook_time]}" if data[:cook_time]
  fm << "servings: #{data[:servings]}" if data[:servings]
  fm << "ai_image: true" if ai_image
  fm << "---"
  fm.join("\n") + "\n\n" + data[:body] + "\n"
end

def generate_ai_image(slug, title)
  prompt = "Professional food photography of #{title}. Appetizing, high quality, natural lighting."
  body = JSON.generate({
    model: 'dall-e-3',
    prompt: prompt,
    n: 1,
    size: '1024x1024',
    quality: 'standard'
  })
  response = `curl -s https://api.openai.com/v1/images/generations \
    -H "Authorization: Bearer #{ENV['OPENAI_API_KEY']}" \
    -H "Content-Type: application/json" \
    -d #{Shellwords.escape(body)}`
  data = JSON.parse(response)
  raise "API error: #{data.dig('error', 'message')}" if data['error']
  url = data.dig('data', 0, 'url')
  dest = File.join(RECIPES_DIR, "#{slug}.jpg")
  system('curl', '-sL', url, '-o', dest)
  dest
end

imported = []
skipped = []
failed = []

RECIPES.each do |notion_title, slug|
  cook_path = File.join(RECIPES_DIR, "#{slug}.cook")

  if File.exist?(cook_path)
    skipped << slug
    next
  end

  notion_file = find_notion_file(notion_title)
  unless notion_file
    puts "⚠️  No Notion file found for: #{notion_title}"
    failed << slug
    next
  end

  print "📥 #{slug}... "
  $stdout.flush

  begin
    data = parse_notion_md(notion_file)
    data[:title] ||= notion_title

    ai_image = false
    image_ext = nil

    # Find image
    if data[:local_image] && File.exist?(data[:local_image])
      ext = File.extname(data[:local_image])
      dest = File.join(RECIPES_DIR, "#{slug}#{ext}")
      FileUtils.cp(data[:local_image], dest)
      image_ext = ext
      print "🖼️  (local) "
    elsif data[:remote_image_url]
      dest = File.join(RECIPES_DIR, "#{slug}.jpg")
      system('curl', '-sL', data[:remote_image_url], '-o', dest, err: '/dev/null')
      image_ext = '.jpg'
      print "🌐 (remote) "
    else
      print "🎨 (AI) "
      $stdout.flush
      generate_ai_image(slug, data[:title])
      ai_image = true
    end

    cook_content = build_cook_file(data, slug, ai_image: ai_image)
    File.write(cook_path, cook_content)
    imported << slug
    puts "✅"
  rescue => e
    puts "❌ #{e.message}"
    failed << slug
  end
end

puts "\n--- Summary ---"
puts "✅ Imported: #{imported.length}"
puts "⏭️  Skipped (already exist): #{skipped.length}"
puts "❌ Failed: #{failed.length}"
puts failed.map { |s| "   - #{s}" }.join("\n") if failed.any?

# Update README checklist
if imported.any?
  readme = File.read(README_PATH)
  imported.each do |slug|
    # Find the matching recipe title from RECIPES list
    notion_title = RECIPES.find { |_, s| s == slug }&.first
    next unless notion_title
    # Try to match the README line case-insensitively
    readme = readme.gsub(/^- \[ \] (#{Regexp.escape(notion_title)})\s*$/i) { "- [x] #{$1}" }
  end
  File.write(README_PATH, readme)
  puts "\n📝 Updated README checklist"
end

puts "\nRun ./scripts/build-site.rb to rebuild the site."
