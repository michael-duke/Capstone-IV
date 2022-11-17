require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :label, :genre, :author

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def self.list_all(music_albums)
    if music_albums.empty?
      puts 'The music album list is empty, add some albums...😀'
    else
      puts "Music Albums list, count(#{music_albums.count}) \u{1F3B9} :\n\n"
      music_albums.each_with_index do |music, index|
        puts "#{index + 1}) Title: '#{music.label.title}', Genre: #{music.genre.name}"
      end
    end
  end

  def can_be_archived?
    super && @on_spotify
  end
end
