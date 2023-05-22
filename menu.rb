require_relative 'app'

class Menu
  def initialize
    @options = Option.new
  end

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
    option_list = %w[list_books list_people create_person create_book create_rental list_rental]
    chosen = option_list[num - 1]
    @options.send(chosen.to_s)
  end
end
