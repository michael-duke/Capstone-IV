require 'securerandom'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: SecureRandom.hex(7))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
