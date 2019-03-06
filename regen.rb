require 'find'
require 'pry'

system "gem build character_data.gemspec"

highest_gem_filename = Find.find('.').select do |path|
  path.match?(/\.gem$/)
end.map do |path|
  Gem::Version.new(path.match(/character_data-(.+)\.gem$/)[1])
end.sort[-1].then {|v| "character_data-#{v.to_s}.gem" }

system "gem install ./#{highest_gem_filename}"
system "ruby generate_html.rb"

'asdf'

# gem build character_data.gemspec
# gem install ./character_data-0.0.9.gem
# ruby generate_html.rb
