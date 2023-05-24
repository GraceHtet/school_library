require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'

describe Rental do
  person = Person.new(20, 22, name: 'Smith', parent_permission: true)
  book = Book.new('Mathematics', 'Longhorn')
  rental = Rental.new('2023/04/10', book, person)

  context 'should create rental for a person or book' do
    
    it 'Should create book rental' do
      expect(book.rental).to include(rental)
    end

    it 'Should create person rental' do
      expect(person.rental).to include(rental)
    end
  end

  context 'Should create hash object' do
    hash = {
      'date' => '2023/04/10',
      'book' => book.to_hash,
      'person' => person.to_hash
    }

    it 'should change to hash' do
      expect(rental.to_hash).to eql(hash)
    end
  end
end
