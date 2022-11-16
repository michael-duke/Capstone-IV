require 'date'
require_relative '../item.rb'


class Game < Item
  attr_accessor :multiplayer, :last_played_at, :label, :author, :genre

  def initialize(*args, last_played_at, multiplayer: false)
    super(*args)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    super and (Date.today.year - Date.parse(@last_played_at).year > 2)
  end
end
