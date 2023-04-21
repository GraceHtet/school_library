require_relative 'app'

OPTION = Option.new

def select_option
  puts "\n Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"

  gets.chomp.to_i
end

def choices(num)
  case num
  when 1
    OPTION.list_books
  when 2
    OPTION.list_people
  when 3
    OPTION.create_person
  when 4
    OPTION.create_book
  when 5
    OPTION.create_rental
  when 6
    OPTION.list_rentals
  else
    puts "Please type the option between 1-7 \n"
  end
end

def main
  num = select_option
  return puts "Thanks for using this app \n" if num == 7

  choices(num)
  main
end

print "Welcome to school library app!!! \n"

main
