OPTIONS = {
  1 => { label: 'List all books', action: :list_books },
  2 => { label: 'List all people', action: :list_people },
  3 => { label: 'Create a person', action: :create_person },
  4 => { label: 'Create a book', action: :create_book },
  5 => { label: 'Create a rental', action: :create_rental },
  6 => { label: 'List all rentals for a given person id', action: :list_rentals },
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
      if (3..6).include?(selection)
        choose_option(selection)
      else
        @app.send(handlers[:action])
      end
    else
      puts 'Invalid options ):'
    end
  end

  def choose_option(option)
    case option
    when 3
      option_three
    when 4
      option_four
    when 5
      option_five
    when 6
      option_six
    end
  end

  def option_three
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    type = gets.chomp.to_i

    if [1, 2].include?(type)
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp

      case type
      when 1
        print 'Has parent Permission? [Y/N]: '
        permission = gets.chomp.downcase == 'y'
        @app.create_person(type, name, age, permission: permission)
      when 2
        print 'Specialization: '
        specialization = gets.chomp
        @app.create_person(type, name, age, specialization: specialization)
      end
    else
      puts 'Type a valid option'
    end
  end

  def option_four
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def option_five
    puts 'Select a book from the following list by number: '
    @app.books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    book_num = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @app.person.each_with_index do |each, i|
      puts "#{i}) [#{each.class}] Name: #{each.name}, ID: #{each.id}, Age: #{each.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_i

    @app.create_rental(date, person_num, book_num)
  end

  def option_six
    puts 'List all rents for a given person id'
    person_id = gets.chomp.to_i
    selected = @app.rents.select { |r| r.person.id == person_id }

    return puts "No rental found for this person id \n" if selected.empty?

    puts 'Rental: '
    @app.list_rentals(selected)
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
