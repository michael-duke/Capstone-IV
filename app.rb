require_relative './properties/label'
require_relative './properties/genre'
require_relative './properties/author'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './things/game.rb'

class App
  attr_reader :books, :labels

  def initialize
    @books = ReadData.read_books
    @games = ReadData.read_games
    @music_albums = []
    @labels = ReadData.read_labels
    @genres = []
    @authors = ReadData.read_authors
  end

  def quit_app
    SaveData.save_books(@books)
    SaveData.save_games(@games)
    SaveData.save_labels(@labels)
    SaveData.save_authors(@authors)
    
    puts 'Thank you for using this app! Now exiting...😊'
    exit
  end

  def add_book
    label = add_label('Book')
    author = add_author
    genre = add_genre('Book\'s')
    # Books props
    print 'What\'s the cover state of the book? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Who is the publisher? '
    publisher = gets.chomp
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp
    book = Book.new(publisher, cover_state, published_date)
    label.add_item(book)
    genre.add_item(book)
    author.add_item(book)

    @books << book
    @labels << label
    @genres << genre
    @authors << author
    puts "\nThe book '#{label.title}' by #{author.first_name} #{author.last_name} was created successfully! 👍"
  end

  def add_label(item_type)
    # Label props
    print "Title of the #{item_type}: "
    title = gets.chomp
    print "Color of the #{item_type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_genre(item_type)
    # Genre prop
    print "#{item_type} genre: "
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def add_author
    # Author props
    print 'Author\'s first name: '
    first_name = gets.chomp
    print 'Author\'s last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def add_game
    label = add_label('Game')
    author = add_author
    genre = add_genre('Game\'s')
    # Games props
    print 'What\'s the last played date? [year/month/day] (e.g 1937/11/12): '
    last_played_at = gets.chomp
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp
    multiplayer = multiplayer?
    game = Game.new(published_date, last_played_at, multiplayer: multiplayer)
    label.add_item(game)
    genre.add_item(game)
    author.add_item(game)

    @games << game
    @labels << label
    @genres << genre
    @authors << author
  end

  def multiplayer?
    print 'Is it a Multiplayer Game? [Y/N]:'
    multiplayer = gets.chomp.downcase

    case multiplayer
    when 'n'
      false
    when 'y'
      true
    else
      puts 'Incorrect choice, kindly enter \'y\', \'Y\' or \'n\', \'N\' 😀'
      multiplayer?
    end
  end


  def list_all_books
    if @books.empty?
      puts 'The Books list is empty, add some books...😀'
    else
      puts "Books list, count(#{@books.count})📚 :\n\n"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.label.title}'",
             "   Author: #{book.author.first_name}, #{book.author.last_name} ",
             "   Publisher: #{book.publisher}",
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
  def list_all_games
    if @games.empty?
      puts 'The Games list is empty, add some games...😀'
    else
      puts "Games list, count(#{@games.count})🎮 :\n\n"
      @games.each_with_index do |game, index|
        puts "#{index + 1}) Title: '#{game.label.title}'",
             "   Author: #{game.author.first_name} #{game.author.last_name} ",
             "   Last Played: #{game.last_played_at}",
             "   Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"

      end
    end
  end

  

end
