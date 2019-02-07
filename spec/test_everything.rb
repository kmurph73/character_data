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

      expect(bojack.images.length).to eq(3)
      expect(bojack.images[0]).to match(/bojack1\.jpg$/)
    end
  end
end
