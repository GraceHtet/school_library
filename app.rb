require_relative './lib/book'
require_relative './lib/student'
require_relative './lib/teacher'
require_relative './lib/rental'
require_relative 'storage'

STORAGE = Storage.new

class Option
  def initialize
    @books = STORAGE.load_data('./data/book.json') || []
    @person = STORAGE.load_data('./data/person.json') || []
    @rents = STORAGE.load_data('./data/person.json') || []
  end

  def list_books
    puts "There is no book yet! Please create a new book first. \n" if @books.empty?

    @books.each do |book|
      puts "Title: #{book[:title]}, Author: #{book[:author]}"
    end
  end

  def list_people
    puts "There is no person yet! Please create a new person first \n" if @person.empty?
    @person.each do |each|
      puts " [#{each[:type]}] Name: #{each[:name]}, ID: #{each[:id]}, Age: #{each[:age]}"
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    type = gets.chomp.to_i

    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option :('
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent Permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'

    student = Student.new(age, name: name, parent_permission: permission).hash_format
    STORAGE.store_data(student, @person, './data/person.json')
    puts 'Student created successfully!'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name: name).hash_format
    STORAGE.store_data(teacher, @person, './data/person.json')
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author).hash_format
    STORAGE.store_data(book, @books, './data/book.json')
    puts 'Book created'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book[:title]}, Author: #{book[:author]}"
    end
    book_num = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |each, i|
      puts "#{i}) [#{each[:type]}] Name: #{each[:name]}, ID: #{each[:id]}, Age: #{each[:age]}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_i

    rents = Rental.new(date, @person[person_num], @books[book_num])
    puts 'Rental created successfully '
  end

  def list_all_person_rentals
    puts 'List all rents for a given person id'
    person_id = gets.chomp.to_i
    list_rentals(person_id)
  end

  def list_rentals(person_id)
    person = @person.find { |p| p[:id] == person_id }

    if person
      puts 'Rental:'
      person.rents.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'No rental found for this person id'
    end
  end

  def exit_program
    puts 'Thanks for using this app'
  end
end
