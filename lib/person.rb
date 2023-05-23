require_relative '../nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rents

  def initialize(age, name: 'Unknown', parent_permission: true, id: Random.rand(1..1000) )
    super()
    @id= id 
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rents = []
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def hash_format
    {
      :id => @id,
      :name => @name,
      :age => @age
    }
  end

  private :of_age?
end
