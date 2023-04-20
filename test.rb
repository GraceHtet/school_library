require_relative './lib/book'
require_relative './lib/rental'
require_relative './lib/person'
require_relative './lib/teacher'
require_relative './lib/student'
require_relative './lib/classroom'

mid_class = Classroom.new('Middle')
# high_class = Classroom.new('High')

lily = Person.new(12, 'Lily', parent_permission: false)
# fio = Person.new(11, 'Fio', parent_permission: false)
# flora = Person.new(19, 'Flora')
# grace = Person.new(23, 'Grace')

student_lily = Student.new(mid_class, lily.age, lily.name, parent_permission: false)
student_lily.add_classroom = mid_class

# student_fio = Student.new(mid_class)
# student_fio.add_classroom = mid_class

# student_flora = Student.new(high_class)
# teacher_grace = Teacher.new('Math')
fantasy1 = Book.new('The curse child', 'J.K.Rowling')
fantasy2 = Book.new('Twilight saga', 'Stephenie Meyer')
# fantasy3 = Book.new('The Diary of Anne Frank', 'Anne Frank')
# Rental.new('2023-02-22', teacher_grace, fantasy3)
lily.add_rental(fantasy1, '2023-01-11')
lily.add_rental(fantasy2, '2023-01-11')
# Rental.new('2023-01-11', student_lily, fantasy1)
# Rental.new('2023-01-11', student_lily, fantasy2)
# Rental.new('2023-01-11', student_fio, fantasy1)
# Rental.new('2023-03-12', student_flora, fantasy2)

puts mid_class.students
puts lily.rents
puts fantasy1.rents
# puts fantasy1.rents
