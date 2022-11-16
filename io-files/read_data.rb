class ReadData
  def self.read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
    data.each do |book_item|
      book = Book.new(book_item['publisher'], book_item['cover_state'], book_item['publish_date'], book_item['id'])
      label = Label.new(book_item['label']['title'], book_item['label']['color'], id: book_item['label']['id'])
      genre = Genre.new(book_item['genre']['name'], id: book_item['genre']['id'])
      author = Author.new(book_item['author']['first_name'], book_item['author']['last_name'],
                          id: book_item['author']['id'])
      book.label = label
      book.genre = genre
      book.author = author
      books << book
    end
    file.close
    books
  end

  def self.read_labels
    labels = []
    return labels unless File.exist?('./data/labels.json')

    file = File.open('./data/labels.json')
    data = JSON.parse(file.read)
    data.each do |label|
      label = Label.new(label['title'], label['color'], id: label['id'])
      labels << label
    end
    file.close
    labels
  end

  def self.read_games
    games = []
    return games unless File.exist?('./data/games.json')

    file = File.open('./data/games.json')
    data = JSON.parse(file.read)
    data.each do |game_item|
      game = Game.new(game_item['publish_date'], game_item['id'], game_item['last_played_at'],
                      multiplayer: game_item['multiplayer'])
      label = Label.new(game_item['label']['title'], game_item['label']['color'], id: game_item['label']['id'])
      genre = Genre.new(game_item['genre']['name'], id: game_item['genre']['id'])
      author = Author.new(game_item['author']['first_name'], game_item['author']['last_name'],
                          id: game_item['author']['id'])
      game.label = label
      game.genre = genre
      game.author = author
      games << game
    end
    file.close
    games
  end

  def self.read_authors
    authors = []
    return authors unless File.exist?('./data/authors.json')

    file = File.open('./data/authors.json')
    data = JSON.parse(file.read)
    data.each do |author|
      author = Author.new(author['first_name'], author['last_name'], id: author['id'])
      authors << author
    end
    file.close
    authors
  end

  def self.read_music_albums
    music_albums = []
    return music_albums unless File.exist?('./data/music_albums.json')

    file = File.open('./data/music_albums.json')
    data = JSON.parse(file.read)
    data.each do |music_item|
      music = MusicAlbum.new(music_item['on_spotify'], music_item['publish_date'], music_item['id'])
      label = Label.new(music_item['label']['title'], music_item['label']['color'], id: music_item['label']['id'])
      genre = Genre.new(music_item['genre']['name'], id: music_item['genre']['id'])
      author = Author.new(music_item['author']['first_name'], music_item['author']['last_name'],
                          id: music_item['author']['id'])
      music.label = label
      music.genre = genre
      music.author = author
      music_albums << music
    end
    file.close
    music_albums
  end

  def self.read_genres
    genres = []
    return genres unless File.exist?('./data/genres.json')

    file = File.open('./data/genres.json')
    data = JSON.parse(file.read)
    data.each do |genre|
      genre = Genre.new(genre['name'], id: genre['id'])
      genres << genre
    end
    file.close
    genres
  end
end
