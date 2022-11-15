require 'securerandom'

class Genre
  def initialize(name)
    @id = SecureRandom.hex(5)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
