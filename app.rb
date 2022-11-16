require_relative './properties/label'
require_relative './properties/genre'
require_relative './properties/author'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './things/game'
require_relative './things/music_album'
require_relative './helper'

class App
  include Helper
  attr_reader :books, :labels, :music_albums, :genres

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

  def list_all_books
    Book.list_all(@books)
  end

  def list_all_labels
    Label.list_all(@labels)
  end

  def list_all_games
    Game.list_all(@games)
  end

  def list_all_music_albums
    MusicAlbum.list_all(@music_albums)
  end

  def list_all_authors
    Author.list_all(@authors)
  end

  def add_music_album
    on_spotify = on_spotify?
    print 'What\'s the publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp
    music = MusicAlbum.new(on_spotify, published_date)
    label = add_label('Music Album')
    genre = add_genre('Music Album')
    musician = add_author
    puts "\n \n Music Album created successfully \n \n"
    @music_albums << music
    @labels << label
    @genres << genre
    @authors << musician

    label.add_item(music)
    genre.add_item(music)
    musician.add_item(music)
  end

  def list_all_genres
    Genre.list_all(@genres)
  end
end
