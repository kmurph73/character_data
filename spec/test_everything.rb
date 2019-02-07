require 'spec_helper'
require 'character_data'

RSpec.describe CharacterData::Person do
  describe 'self.all' do
    it 'gets all people' do
      people = CharacterData::Person.all

      expect(people.length).to eq(9)
      bojack = people[0]

      expect(bojack.name).to eq('Bojack Horseman')
      expect(bojack.born).to eq(1964)
      expect(bojack.email).to eq('bojack@bojack_horseman.com')

      expect(bojack.images.length).to eq(3)
      bojack_poolside = bojack.images[0]

      expect(bojack_poolside.filename).to eq('bojack1.jpg')
      file = bojack_poolside.file
      expect(file.class).to eq(File)
    end
  end
end
