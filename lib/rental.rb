class Rental
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rents << self

    @book = book
    book.rents << self
  end
end
