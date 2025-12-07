#!/usr/bin/env ruby

require 'yaml'
require 'open3'
require 'front_matter_parser'

if ARGV.length < 2
  puts 'Usage: import <url> <filename>'
  exit 1
end

url = ARGV[0]
filename = ARGV[1].end_with?('.cook') ? ARGV[1] : "recipes/#{ARGV[1]}.cook"

# Run `cook import "{url}"` and capture output
stdout, stderr, status = Open3.capture3("cook import \"#{url}\"")
if !status.success?
  warn "Error running cook import: #{stderr}"
  exit 1
end
cook_output = stdout

puts "Imported content from #{url}"
puts "Content found: "
puts cook_output

# Parse frontmatter from cook output
parser = FrontMatterParser::Parser.new(:md)
parsed = parser.call(cook_output) rescue nil

# Merge frontmatter
frontmatter = parsed ? parsed.front_matter : {}
frontmatter['source'] = url

# Write merged frontmatter and body to file
File.open(filename, 'w') do |f|
  f.puts '---'
  f.puts frontmatter.to_yaml.lines[1..-1].join # skip YAML '---' line
  f.puts '---'
  f.puts
  f.puts(parsed ? parsed.content : cook_output)
end

puts "Created #{filename} with merged frontmatter and imported content."
