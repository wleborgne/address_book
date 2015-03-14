require 'rails_helper'

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) { { first_name: 'John', last_name: 'Doe',
    email: 'John.Doe@foo.com', address_line_one: '123 Any Street',
    city: 'Wallington', state: 'NJ', zip_code: '07057' } }

  it 'is expected to be a person' do
    person = Person.new(valid_attributes)
    expect(person).to be_a(Person)
  end

  context 'is valid' do
    it 'if address line one is empty' do
      valid = Hash.new.merge(valid_attributes)
      valid[:address_line_one] = ''
      person = Person.new(valid)
      expect(person.valid?).to be_truthy
    end
    
    it 'if city is empty' do
        valid = Hash.new.merge(valid_attributes)
        valid[:city] = ''
        person = Person.new(valid)
        expect(person.valid?).to be_truthy
    end
  end

  context 'is invalid' do
    it 'without a first name' do
      invalid = Hash.new.merge(valid_attributes)
      invalid[:first_name] = nil
      person = Person.new(invalid)
      expect(person.valid?).to be_falsey
    end

    it 'without a last name' do
      invalid = Hash.new.merge(valid_attributes)
      invalid[:last_name] = nil
      person = Person.new(invalid)
      expect(person.valid?).to be_falsey
    end
    
    it 'if email is blank' do
      invalid = Hash.new.merge(valid_attributes)
      invalid[:email] = ''
      person = Person.new(invalid)
      expect(person.valid?).to be_falsey
    end
    
    it 'if email does not contain \'@\' character' do
      invalid = Hash.new.merge(valid_attributes)
      invalid[:email] = 'bad_email'
      person = Person.new(invalid)
      expect(person.valid?).to be_falsey
    end
  end
end
