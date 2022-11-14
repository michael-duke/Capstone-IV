require 'securerandom'
require 'date'

class Item
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, id: SecureRandom.hex(7), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items << self
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
