require_relative './lib/book'
require_relative './lib/student'
require_relative './lib/teacher'
require_relative './lib/rental'

class Option
  attr_reader :books, :person, :rents

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

  def create_person(type, age, name, permission: true, specialization: '')
    if type == 1
      people = Student.new(age, name, parent_permission: permission)
    elsif type == 2
      people = Teacher.new(specialization, age, name)
    end
    @person << people
    puts "Created a Person successfully. \n"\
  end

  def create_book(title, author)
    @books << Book.new(title, author)
    print 'Book created'
  end

  def create_rental(date, person_num, book_num)
    @rents << Rental.new(date, @person[person_num], @books[book_num])
    print "Rental created successfully \n"
  end

  def list_rentals(selected)
    selected.each do |select|
      puts "Date: #{select.date}, Book: \"#{select.book.title}\" by #{select.book.author}"
    end
  end

  def exit_program
    puts 'Thanks for using this app'
  end
end
