require 'securerandom'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: SecureRandom.hex(7))
    @id = id
    @name = name
    @items = []
  end

  def self.list_all(genres)
    if genres.empty?
      puts 'The genre list is empty, add some genres...😀'
    else
      puts "Genres list, count(#{genres.count}) :\n\n"
      genres.each_with_index do |genre, index|
        puts "#{index + 1}) Name: '#{genre.name}'"
      end
    end
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
