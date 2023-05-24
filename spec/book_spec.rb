require_relative '../lib/book'
require_relative '../lib/person'
require_relative '../lib/rental'

describe Book do
  context 'when initializing' do
    before(:each) do
      @book = Book.new('CS', 'Grace')
    end

    it 'should have title' do
      expect(@book.title).to eq 'CS'
    end

    it 'should have author' do
      expect(@book.author).to eq 'Grace'
    end

    it 'should have empty rental' do
      expect(@book.rental).to be_empty
    end

    it 'should change to hash format' do
      hash = {
        title: 'CS',
        author: 'Grace'
      }
      expect(@book.to_hash).to eql(hash)
    end
  end

  context 'when adding a rental' do
    book = Book.new('CS', 'Grace')
    person = Person.new(nil, 23, name: 'Milli', parent_permission: true)
    rental = Rental.new('2023-2-22', book, person)
    book.add_rental(person, '2023-2-22')

    it 'should have rental data' do
      expect(book.rental).not_to be_empty
    end

    it 'should have correct rental' do
      expect(book.rental[0]).to eql(rental)
    end
  end
end
