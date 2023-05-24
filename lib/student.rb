require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_hash
    super.merge(id: id)
  end
end
