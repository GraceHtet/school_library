require_relative '../lib/classroom'
require_relative '../lib/student'

describe Classroom do
  context 'Adds classroom' do
    classroom = Classroom.new('Mathematics')
    student = Student.new(20, 22, name: 'Smith', parent_permission: true)
    it 'should be an instance of classroom' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'should add student to classroom' do
      classroom.add_students(student)
      expect(classroom.students).to include(student)
    end
  end
end
