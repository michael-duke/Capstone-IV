/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS music_albums;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS authors;
-- Authors
CREATE TABLE authors (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(150) NOT NULL,
  last_name VARCHAR(150) NOT NULL
);

-- Labels
CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  color VARCHAR(150) NOT NULL
);

-- Genres
CREATE TABLE genres (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(150) NOT NULL
);

-- Books
CREATE TABLE books (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  publisher VARCHAR(150) NOT NULL,
  cover_state VARCHAR(150) NOT NULL,
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Music Albums
CREATE TABLE music_albums (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Games
CREATE TABLE games (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  multiplayer VARCHAR(150) NOT NULL,
  last_played_at DATE NOT NULL,
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Create index to enhance performance
CREATE INDEX music_album_genre_id ON music_albums(genre_id);
CREATE INDEX game_author_id ON games(author_id);
CREATE INDEX book_label_id ON books(label_id);