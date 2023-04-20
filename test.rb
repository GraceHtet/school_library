require_relative './lib/book'
require_relative './lib/rental'
require_relative './lib/person'
require_relative './lib/teacher'
require_relative './lib/student'
require_relative './lib/classroom'

mid_class = Classroom.new('Middle')
high_class = Classroom.new('High')
student_lily = Student.new(mid_class, 12, 'Lily', parent_permission: false)
student_lily.add_classroom = mid_class

student_fio = Student.new(mid_class, 11, 'Fio', parent_permission: false)
student_fio.add_classroom = mid_class

student_flora = Student.new(high_class, 19, 'Flora')
teacher_grace = Teacher.new('Math', 23, 'Grace')
fantasy1 = Book.new('The curse child', 'J.K.Rowling')
fantasy2 = Book.new('Twilight saga', 'Stephenie Meyer')
fantasy3 = Book.new('The Diary of Anne Frank', 'Anne Frank')
Rental.new('2023-02-22', teacher_grace, fantasy3)
Rental.new('2023-01-11', student_lily, fantasy1)
Rental.new('2023-01-11', student_fio, fantasy1)
Rental.new('2023-03-12', student_flora, fantasy2)

puts mid_class.students
puts fantasy1.rents
