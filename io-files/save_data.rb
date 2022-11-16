require 'json'
require 'fileutils'

class SaveData
  def self.check_file_exists(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/labels.json') if !File.exist?('./data/labels.json') && filename == 'labels'
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/genres.json') if !File.exist?('./data/genres.json') && filename == 'genres'
    FileUtils.touch('./data/games.json') if !File.exist?('./data/games.json') && filename == 'games'
    FileUtils.touch('./data/authors.json') if !File.exist?('./data/authors.json') && filename == 'authors'
  end

  def self.save_books(books)
    books_array = []
    books.each do |book|
      books_array << make_book_json(book)
    end
    return if books_array.empty?

    check_file_exists('books')
    File.write('./data/books.json', JSON.pretty_generate(books_array))
  end

  def self.make_book_json(book)
    {
      publish_date: book.publish_date,
      cover_state: book.cover_state,
      publisher: book.publisher,
      id: book.id,
      label: {
        title: book.label.title,
        color: book.label.color,
        id: book.label.id
      },
      author: {
        first_name: book.author.first_name,
        last_name: book.author.last_name,
        id: book.author.id
      },
      genre: {
        name: book.genre.name,
        id: book.genre.id
      }
    }
  end

  def self.save_labels(labels)
    labels_array = []
    labels.each do |label|
      labels_array << {
        title: label.title,
        color: label.color,
        id: label.id
      }
    end
    return if labels_array.empty?

    check_file_exists('labels')
    File.write('./data/labels.json', JSON.pretty_generate(labels_array))
  end

  def self.save_games(games)
    games_array = []
    games.each do |game|
      games_array << make_game_json(game)
    end
    return if games_array.empty?

    check_file_exists('games')
    File.write('./data/games.json', JSON.pretty_generate(games_array))
  end

  def self.make_game_json(game)
    {
      id: game.id,
      label: {
        title: game.label.title,
        color: game.label.color,
        id: game.label.id
      },
      author: {
        first_name: game.author.first_name,
        last_name: game.author.last_name,
        id: game.author.id
      },
      genre: {
        name: game.genre.name,
        id: game.genre.id
      }, 
      publish_date: game.publish_date,
      last_played_at: game.last_played_at,
      multiplayer: game.multiplayer
    }
  end

  def self.save_authors(authors)
    authors_array = []
    authors.each do |author|
      authors_array << {
        first_name: author.first_name,
        last_name: author.last_name,
        id: author.id
      }
    end
    return if authors_array.empty?

    check_file_exists('authors')
    File.write('./data/authors.json', JSON.pretty_generate(authors_array))
  end

end
