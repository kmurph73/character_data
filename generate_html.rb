require 'character_data'
require 'haml'

# gem build character_data.gemspec
# gem install ./character_data-0.0.5.gem
# ruby generate_html.rb

class Scopin
  def link_people people
    people.map {|p| "<a href='##{p.full_id}'>#{p.name}</a>" }.join(', ')
  end
end

template = File.read('template.haml')
html = Haml::Engine.new(template).render(Scopin.new, {people: CharacterData::Person.all})
File.open('index.html', 'w') { |file| file.write(html) }
