require_relative './lib/book'
require_relative './lib/student'
require_relative './lib/teacher'
require_relative './lib/rental'

class Option
  def initialize
    @books = []
    @person = []
    @rents = []
  end

  def list_books
    puts "There is no book yet! Please create a new book first. \n" if @books.empty?

    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts "There is no person yet! Please create a new person first \n" if @person.empty?
    @person.each do |each|
      puts " [#{each.class}] Name: #{each.name}, ID: #{each.id}, Age: #{each.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    type = gets.chomp.to_i

    if [1, 2].include?(type)
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp

      if type == 1
        print 'Has parent Permission? [Y/N]: '
        permission = gets.chomp.downcase == 'y'
        people = Student.new(age, name, parent_permission: permission)
      elsif type == 2
        print 'Specialization: '
        people = Teacher.new(gets.chomp, age, name)
      end
      @person << people
      puts "Created a Person successfully. \n"
    else
      puts "Invalid type \n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    print 'Book created'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    book_num = gets.chomp.to_i.to_i

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |each, i|
      puts "#{i}) [#{each.class}] Name: #{each.name}, ID: #{each.id}, Age: #{each.age}"
    end
    person_num = gets.chomp.to_i.to_i

    print 'Date: '
    date = gets.chomp.to_i

    @rents << Rental.new(date, @person[person_num], @books[book_num])
    print "Rental created successfully \n"
  end

  def list_rentals
    puts 'List all rents for a given person id'
    person_id = gets.chomp.to_i.to_i
    selected = @rents.select { |r| r.person.id == person_id }

    puts "No rental found for this person id \n" if selected.empty?

    puts 'Rental: '
    selected.each do |select|
      puts "Date: #{select.date}, Book: \"#{select.book.title}\" by #{select.book.author}"
    end
  end

  def exit_program
    puts "Thanks for using this app"
  end
end
