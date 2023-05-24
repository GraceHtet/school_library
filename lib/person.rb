require_relative '../nameable'

class Person < Nameable
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rental, :type

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    @type = self.class.name
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_hash
    {
      age: age,
      name: name,
      parent_permission: @parent_permission,
      type: @type
    }
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
