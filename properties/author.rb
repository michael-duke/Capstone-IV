require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name, id: SecureRandom.hex(7))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.list_all(authors)
    if authors.empty?
      puts 'The Items list is empty, add some items...😀'
    else
      puts "Authors list, count(#{authors.count})👤 :\n\n"
      authors.each_with_index do |author, index|
        puts "#{index + 1}) Author: #{author.first_name}, #{author.last_name}"
      end
    end
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
