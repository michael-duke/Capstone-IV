require 'json'
require 'fileutils'

class SaveData
  def self.check_file_exists(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/labels.json') if !File.exist?('./data/labels.json') && filename == 'labels'
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/genres.json') if !File.exist?('./data/genres.json') && filename == 'genres'
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
      # author: {
      #   first_name: book.author.first_name,
      #   last_name: book.author.last_name,
      #   id: book.author.id
      # },
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
end
