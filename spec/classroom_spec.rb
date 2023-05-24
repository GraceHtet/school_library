require_relative '../lib/classroom'
require_relative '../lib/student'

describe Classroom do
  context 'Adds classroom' do
    classroom = Classroom.new('Mathematics')

    it 'should be an instance of classroom' do
      expect(classroom).to be_an_instance_of(Classroom)
    end
  end

  context 'when adding a student to a classroom' do
    classroom = Classroom.new('Mathematics')
    student = Student.new(20, 22, name: 'Smith', parent_permission: true)

    classroom.add_students(student)

    it 'should have student in the classroom' do
      expect(classroom.students).to include(student)
    end

    it "should add to student's classroom list" do
      expect(student.classroom).to be(classroom)
    end
  end
end
