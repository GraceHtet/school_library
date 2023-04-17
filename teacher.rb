require_relative 'person'

class Teacher < Person
  def initialize(speciailzation, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = speciailzation
  end

  def can_use_services?
    true
  end
end
