class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rents << self 

    @book = book
    book.rents << self
  end

  def to_hash
    {
      'date' => @date,
      'book' => @book.to_hash,
      'person' => @person.to_hash
    }
  end
end
