require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'

describe Rental do
  context 'should create rental for a person or book' do
    person = Person.new(20, 22, name: 'Smith', parent_permission: true)
    book = Book.new('Mathematics', 'Longhorn')
    rental = Rental.new('2023/04/10', book, person)

    it 'Should create book rental' do
      expect(book.rental).to include(rental)
    end

    it 'Should create person rental' do
      expect(person.rental).to include(rental)
    end
  end
end
