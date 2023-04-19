# require_relative './lib/person'
# require_relative './decorator/capitalize_decorator'
# require_relative './decorator/trimmer_decorator'

# person = Person.new(22, 'maximilianus')
# puts person.correct_name

# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name

# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

require_relative './lib/classroom'
require_relative './lib/student'

classroom = Classroom.new('Middle')
student = Student.new('middle',23,'Grace')
student2 = Student.new('high',24,'htet')


print classroom.students
print student.classroom

classroom.add_students(student)
classroom.add_students(student2)
print classroom.students
# print student.classroom
