require './app'
require './logical_input' 

def command
  puts 'Please  choose an option by enterin a number : '
  puts ''
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental '
  puts '6- List all rentals for a given person id'
  puts '7- Exits'
end

def main
  #book_table = []
  #person_table = []
  #rental_table = []
  app = App.new
  logical = Logical.new(app)
  inp = 20
  puts 'Welcome to schoom Library App!'
  puts ''

  while inp != '7'
    command
    inp = gets.chomp

    case inp
    when '1'
      logical.list_books()
    when '2'
      logical.list_people()
    when '3'
      logical.create_person()
    when '4'
      logical.create_book()
    when '6'
      logical.list_rental()
    when '5'
      logical.create_rental()
    end
  end

  puts 'Thank you for using this app!'
end

main
