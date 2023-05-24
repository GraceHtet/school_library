require_relative '../lib/student'
require_relative '../lib/classroom'

describe Student do
  context 'when initializing' do
    before(:each) do
      @student = Student.new(23, 20, name: 'Lily')
    end

    it 'id should not be nil' do
      expect(@student.id).not_to be_nil
    end

    it 'should have age' do
      expect(@student.age).to eq 20
    end

    it 'should have name' do
      expect(@student.name).to eq 'Lily'
    end

    it 'should have parent_permission' do
      expect(@student.parent_permission).to be_truthy
    end

    it 'should show hooky text' do
      hooky = '¯(ツ)/¯'
      expect(@student.play_hooky).to eq hooky
    end

    it 'should change to hash format' do
      hash = {
        age: 20,
        name: 'Lily',
        parent_permission: true,
        type: 'Student',
        id: 23
      }
      expect(@student.to_hash).to eql(hash)
    end
  end

  context 'when adding to a classroom' do
    student = Student.new(23, 20, name: 'Lily')
    class_one = Classroom.new('Computer Science')
    student.classroom = class_one
    it 'should add classroom' do
      expect(student.classroom).to eql(class_one)
    end
  end
end
