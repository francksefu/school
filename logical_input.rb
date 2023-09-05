class Logical
  def initialize (app)
    @app = app
    @book_table = []
    @person_table = []
    @rental_table = []
  end

  def list_books()
    if @book_table.empty?
      puts 'No book'
    else
      @app.list_all_books(@book_table)
    end
  end
  
  def create_person()
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number] '
    num = gets.chomp
    return unless %w[1 2].include?(num)
  
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
  
    case num
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      perm = %w[y Y].include?(permission)
      student = @app.create_people(age, name, perm, 1, '')
      @person_table.push(student)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      teacher = @app.create_people(age, name, '', 2, specialization)
      @person_table.push(teacher)
    end
  
    puts 'Person created successfully'
  end
  
  def list_people()
    if @person_table.empty?
      puts 'No people'
    else
      @app.list_all_people(@person_table)
    end
  end
  
  
  def create_book()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_table << @app.create_book(title, author)
    puts 'Book created successfully'
  end
  
  def list_rental()
    print 'ID of person: '
    index = gets.chomp.to_i
    @app.list_rental(@rental_table, index)
  end
  
  def create_rental()
    puts 'Select a book from the following list by number'
    index_b = 0
    return unless @book_table != 0

    @book_table.each_with_index do |i, idx|
      puts "#{idx}) Title : \"#{i.title}\", Author : #{i.author}"
    end
    index = gets.chomp
    index_b = index.to_i
    index_p = 0
    puts 'Select a person from the following list by number (not id)'
    return unless @person_table != 0

    @person_table.each_with_index do |i, idx|
      stud = '[Student]'
      stud = '[Teacher]' if defined?(i.specialization)
      puts("#{idx})  #{stud} Name: #{i.name}, ID : #{i.id} ,Age : #{i.age}")
    end
    index = gets.chomp
    index_p = index.to_i
    print 'Date : '
    day = gets.chomp
    @rental_table << @app.create_rental(day, @book_table[index_b], @person_table[index_p])
    puts 'Rentals created successfully'
  end
  
end