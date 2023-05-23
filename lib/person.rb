require_relative '../nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental, :type

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    @type = self.class.name
  end

  def can_use_services?
    return true if of_age || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(person, self, date)
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
