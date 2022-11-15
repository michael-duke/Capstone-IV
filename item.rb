require 'securerandom'

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

  def genre=(genre)
    @genre = genre
    genre.items << self
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - publish_date.to_i > 10
  end
end
