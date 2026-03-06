#!/usr/bin/env ruby
# One-time migration: backfill `date added` in .cook files from Notion "Created time"
#
# Usage:
#   ruby scripts/backfill-dates.rb          # dry run (shows what would change)
#   ruby scripts/backfill-dates.rb --apply  # actually update files

require 'date'

dry_run = !ARGV.include?('--apply')
puts dry_run ? "DRY RUN — pass --apply to write changes\n\n" : "APPLYING changes\n\n"

NOTION_DIR = File.expand_path('../notion-export/Recipes', __dir__)
RECIPES_DIR = File.expand_path('../recipes', __dir__)

# Build index: normalized_title => { path:, created_time: }
notion_index = {}
Dir.glob("#{NOTION_DIR}/*.md").each do |path|
  basename = File.basename(path, '.md')
  # Strip trailing " <32-hex-uuid>"
  if basename =~ /^(.*) [0-9a-f]{32}$/
    title = $1.downcase.gsub(/\s+/, ' ').strip
    notion_index[title] = path
  end
end

puts "Indexed #{notion_index.size} Notion files\n\n"

updated = 0
skipped_no_match = []
skipped_no_created_time = []
skipped_no_date_added = []

Dir.glob("#{RECIPES_DIR}/*.cook").sort.each do |cook_path|
  content = File.read(cook_path)

  # Extract title from frontmatter
  title_match = content.match(/^title:\s*(.+)$/)
  next unless title_match
  title = title_match[1].strip.downcase.gsub(/\s+/, ' ')

  # Find matching Notion file
  notion_path = notion_index[title]
  unless notion_path
    skipped_no_match << "#{File.basename(cook_path)} (title: #{title_match[1].strip})"
    next
  end

  # Extract Created time from Notion file
  notion_content = File.read(notion_path)
  ct_match = notion_content.match(/^Created time:\s*(.+)$/)
  unless ct_match
    skipped_no_created_time << File.basename(cook_path)
    next
  end

  # Parse "September 14, 2023 10:37 AM" — just need the date part
  date_str = ct_match[1].strip
  begin
    date = Date.strptime(date_str, "%B %d, %Y")
  rescue Date::Error
    skipped_no_created_time << "#{File.basename(cook_path)} (bad date: #{date_str})"
    next
  end
  new_date = date.strftime('%Y-%m-%d')

  # Find existing date added line
  unless content.match?(/^date added:\s*.+$/)
    skipped_no_date_added << File.basename(cook_path)
    next
  end

  old_date_match = content.match(/^date added:\s*(.+)$/)
  old_date = old_date_match ? old_date_match[1].strip : '(none)'

  if old_date == new_date
    puts "UNCHANGED #{File.basename(cook_path)}: #{new_date}"
    next
  end

  puts "UPDATE    #{File.basename(cook_path)}: #{old_date} -> #{new_date}"

  unless dry_run
    new_content = content.sub(/^date added:\s*.+$/, "date added: #{new_date}")
    File.write(cook_path, new_content)
  end

  updated += 1
end

puts "\n--- Summary ---"
puts "Would update: #{updated}" if dry_run
puts "Updated:      #{updated}" unless dry_run
puts "No Notion match (skipped): #{skipped_no_match.size}"
puts "No Created time (skipped): #{skipped_no_created_time.size}"
puts "No 'date added' field (skipped): #{skipped_no_date_added.size}"

unless skipped_no_match.empty?
  puts "\nUnmatched cook files:"
  skipped_no_match.each { |s| puts "  - #{s}" }
end

unless skipped_no_created_time.empty?
  puts "\nMissing Created time:"
  skipped_no_created_time.each { |s| puts "  - #{s}" }
end

unless skipped_no_date_added.empty?
  puts "\nMissing 'date added' field:"
  skipped_no_date_added.each { |s| puts "  - #{s}" }
end
