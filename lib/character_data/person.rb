require 'pathname'
require 'yaml'
require 'find'

module CharacterData
  LIB = Pathname.new(__FILE__).realpath.parent.parent.freeze
  DATA_DIR = LIB.join('data').freeze
  IMG_DIR = DATA_DIR.join('images').freeze

  class Person
    attr_accessor :name, :bio, :id, :born, :species, :show_id, :job, :sex, :age, :full_name

    def email
      "#{id}@#{show_id}.com"
    end

    def avatar
      images[0]
    end

    def non_avatar_images
      images[1..-1]
    end

    def images
      @images ||= Person.all_images.select do |img|
        img.filename.match?(/^#{Regexp.quote(self.id)}\d/)
      end
    end

    def self.all_images
      @images ||= Find.find(IMG_DIR).select do |f|
        f.match?(/\.(webp|jpeg|jpg|png)$/)
      end.map do |f|
        CharacterData::Image.new(realpath: f)
      end
    end

    def self.all
      @people ||= begin
        yaml = JSON.parse(File.read(DATA_DIR.join('characters.json')))
        chars = yaml['characters'].map do |show, people|
          people.map do |person_id, person_data|
            person = Person.new
            person.id = person_id

            person_data.each do |key, val|
              person.show_id = show
              person.send("#{key}=", val)
            end

            person
          end
        end.flatten
      end
    end
  end
end
