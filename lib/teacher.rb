require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name: 'Unknown', parent_permission: true, id: Random.rand(1..1000))
    super(age, name: name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    super.merge(specialization: @specialization)
  end
end
