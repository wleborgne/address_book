require 'rails_helper'

RSpec.describe City, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'is expected to be a City' do
    city= City.new(name: 'Boulder', population: 13234,
      elevation: 5028, state: 'Colorado')
    expect(city).to be_a(City)
  end

  context 'is valid' do
    it 'without a population value' do
      city= City.new(name: 'Boulder', population: nil,
        elevation: 5028, state: 'Colorado')
      expect(city.valid?).to be_truthy
    end

    it 'without an elevation value' do
      city= City.new(name: 'Boulder', population: 13234, state: 'Colorado')
      expect(city.valid?).to be_truthy
    end
  end

  context 'is invalid' do
    it 'without a name' do
      city = City.new(name: nil, population: 13234,
        elevation: 5028, state: 'Colorado')
      expect(city.valid?).to be_falsey
    end

    it 'without a state' do
      city = City.new(name: 'Boulder', population: 13234,
        elevation: 5028, state: nil)
      expect(city.valid?).to be_falsey
    end

    it 'with a negative population value' do
      city = City.new(name: 'Boulder', population: -1,
        elevation: 5028, state: 'Colorado')
      expect(city.valid?).to be_falsey
    end

    it 'with a non-numeric population value' do
      city = City.new(name: 'Boulder', population: 'ten',
        elevation: 5028, state: 'Colorado')
      expect(city.valid?).to be_falsey
    end

    it 'with a non-numeric elevation value' do
      city = City.new(name: 'Boulder', population: 13234,
        elevation: 'ten', state: 'Colorado')
      expect(city.valid?).to be_falsey
    end
    
    it 'is invalid for cities in CO with elevation less than 3315' do
      city = City.new(name: 'Invalid', population: 1,
        elevation: 1, state: 'CO')
      expected_error = 'Elevation is too low. Lowest point in CO is 3315 feet.'
      expect(city.valid?).to be_falsey
      expect(city.errors.full_messages[0]).to eq(expected_error)
    end
  end
end
