OPTIONS = {
  1 => { label: 'List all books', action: :list_books },
  2 => { label: 'List all people', action: :list_people },
  3 => { label: 'Create a person', action: :create_person_prompt },
  4 => { label: 'Create a book', action: :create_book },
  5 => { label: 'Create a rental', action: :create_rental },
  6 => { label: 'List all rentals for a given person id', action: :list_all_person_rentals },
  7 => { label: 'exit', action: :exit_program }
}.freeze

class Menu
  def initialize(app)
    @app = app
  end

  def display
    puts "\nPlease choose an option by entering a number:"
    OPTIONS.each { |number, option| puts "#{number} - #{option[:label]}" }
  end

  def handle_selection(selection)
    handlers = OPTIONS[selection]
    if handlers
      @app.send(handlers[:action])
    else
      puts 'Invalid options ):'
    end
  end

  def menu_list
    loop do
      display
      option = gets.chomp.to_i
      handle_selection(option)
      break if option == OPTIONS.size
    end
  end
end
