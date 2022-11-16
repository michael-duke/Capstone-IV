require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label, :genre, :author

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_all(books)
    if books.empty?
      puts 'The Books list is empty, add some books...😀'
    else
      puts "Books list, count(#{books.count})📚 :\n\n"
      books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.label.title}'",
             "   Author: #{book.author.first_name}, #{book.author.last_name} ",
             "   Publisher: #{book.publisher}",
             "   Cover State: #{book.cover_state}"
      end
    end
  end

  private

  def can_be_archived?
    super or @cover_state == 'bad'
  end
end
