require 'character_data'
require 'haml'

# gem build character_data.gemspec
# gem install ./character_data-0.0.5.gem
# ruby generate_html.rb

template = File.read('template.haml')
html = Haml::Engine.new(template).render(Object.new, {people: CharacterData::Person.all})
File.open('index.html', 'w') { |file| file.write(html) }
