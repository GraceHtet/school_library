require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true, id: Random.rand(1..1000))
    super(age, name: name, id: id)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom=(label)
    @classroom = label
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def hash_format
    hash = super
    hash[:parent_permission] = @parent_permission
    hash[:classroom] = @classroom
    hash[:type] = self.class.name
    hash
  end
end
