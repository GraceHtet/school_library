require_relative '../lib/book'
require_relative '../lib/person'
require_relative '../lib/rental'

describe Person do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(nil, 17, name: 'Milli')
    end

    it 'id should not be nil' do
      expect(@person.id).not_to be_nil
    end

    it 'should have age' do
      expect(@person.age).to eq 17
    end

    it 'should have name' do
      expect(@person.name).to eq 'Milli'
    end

    it 'should have parent_permission' do
      expect(@person.parent_permission).to be_truthy
    end

    it 'should have empty rental' do
      expect(@person.rental).to be_empty
    end
  end

  context 'when testing the method' do
    person = Person.new(nil, 17, name: 'Milli')

    it 'Should return the correct name' do
      expect(person.correct_name).to eq 'Milli'
    end

    it 'should change to hash format' do
      hash = {
        age: 17,
        name: 'Milli',
        parent_permission: true,
        type: 'Person'
      }
      expect(person.to_hash).to eql(hash)
    end

    context 'testing whether or not can use service' do
      it 'should be able to use service' do
        expect(person.can_use_services?).to be_truthy
      end
    end
  end

  context 'when adding a rental' do
    book = Book.new('CS', 'Grace')
    person = Person.new(nil, 17, name: 'Milli', parent_permission: false)
    rental = Rental.new('2023-2-22', book, person)
    person.add_rental(book, '2023-2-22')

    it 'should have rental data' do
      expect(person.rental).not_to be_empty
    end

    it 'should have correct rental' do
      expect(person.rental[0]).to eql(rental)
    end
  end
end
