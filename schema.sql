/* Database schema to keep the structure of entire database. */

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
  name VARCHAR(150) NOT NULL,
);

-- Books
CREATE TABLE books (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  publisher VARCHAR(150) NOT NULL,
  cover_state VARCHAR(150) NOT NULL,
  genre_id INT NULL REFERENCES genre(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES author(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES label(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Music Albums
CREATE TABLE music_albums (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT NULL REFERENCES genre(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES author(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES label(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Games

CREATE TABLE games (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  multiplayer VARCHAR(150) NOT NULL,
  last_played_at DATE NOT NULL,
  genre_id INT NULL REFERENCES genre(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES author(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES label(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
)