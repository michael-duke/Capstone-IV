require_relative './properties/label'
require_relative './properties/genre'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './things/music_album'

class App
  attr_reader :books, :labels, :music_albums, :genres

  def initialize
    @books = ReadData.read_books
    @games = []
    @music_albums = []
    @labels = ReadData.read_labels
    @genres = []
    @authors = []
  end

  def quit_app
    SaveData.save_books(@books)
    SaveData.save_labels(@labels)
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
    print 'Book\'s genre: '
    genre_name = gets.chomp
    # Books props
    print 'What\'s the cover state of the book? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Who is the publisher? '
    publisher = gets.chomp
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp

    book = Book.new(publisher, cover_state, published_date)
    label = Label.new(title, color)
    genre = Genre.new(genre_name)
    label.add_item(book)
    genre.add_item(book)

    @books << book
    @labels << label
    @genres << genre
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

  def add_music_album
    if on_spotify?
      on_spotify = true
    else
      on_spotify = false
    end
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp
    print 'What\'s the label title of the music? '
    label_title = gets.chomp
    print 'What\'s the label color / studio of the music? '
    color = gets.chomp
    print 'What\'s the genre of the music? '
    genre_name = gets.chomp
    puts "\n \n Music Album created successfully \n \n"
    save_music_album(on_spotify, published_date, label_title, color, genre_name)
  end

  def on_spotify?
    print 'Is the Music Album on Spotify? [Y/N]: '
    is_spotify = gets.chomp.downcase
    case is_spotify
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Selection. Please enter \'y\', \'Y\' or \'n\', \'N\'!'
      on_spotify?
    end
  end

  def save_music_album(on_spotify, published_date, label_title, color, genre_name)
    music = MusicAlbum.new(on_spotify, published_date)
    label = Label.new(label_title, color)
    genre = Genre.new(genre_name)

    @music_albums << music
    @labels << label
    @genres << genre

    label.add_item(music)
    genre.add_item(music)
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'The music album list is empty, add some albums...😀'
    else
      puts "Music Albums list, count(#{@music_albums.count}) \u{1F3B9} :\n\n"
      @music_albums.each_with_index do |music, index|
        puts "#{index + 1}) Title: '#{music.label.title}', Genre: #{music.genre.name}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'The genre list is empty, add some genres...😀'
    else
      puts "Genres list, count(#{@genres.count}) :\n\n"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}) Name: '#{genre.name}'"
      end
    end
  end
end
