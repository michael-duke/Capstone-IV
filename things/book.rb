require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super or @cover_state == 'bad'
  end
end
