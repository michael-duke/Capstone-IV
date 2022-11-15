require_relative './properties/label'
require_relative './things/book'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def quit_app
    puts 'Thank you for using this app! Now exiting...😊'
    exit
  end

  def add_book
    # Label props
    print 'Title of the Book: '
    title = gets.chomp
    print 'Color of the Book: '
    color = gets.chomp
    # Author props
    # print 'Author\'s first name: '
    # first_name = gets.chomp
    # print 'Author\'s last name: '
    # last_name = gets.chomp
    # Genre prop
    # print 'Book\'s genre: '
    # genre_name = gets.chomp
    # Books props
    print 'What\'s the cover state of the book? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Who is the publisher? '
    publisher = gets.chomp
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp

    book = Book.new(publisher, cover_state, published_date)
    label = Label.new(title, color)
    label.add_item(book)
    @books << book
    @labels << label
  end

  def list_all_books
    if @books.empty?
      puts 'The book list is empty, add some books...😀'
    else
      puts "Books list, count(#{@books.count})📚 :\n\n"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.label.title}', Publisher: #{book.publisher}",
             "   Cover State: #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'The label list is empty, add some items...😀'
    else
      puts "Labels list, count(#{@labels.count})🏷️ :\n\n"
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color}"
      end
    end
  end
end
