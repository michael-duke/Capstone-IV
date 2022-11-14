/* Database schema to keep the structure of entire database. */

-- Labels
CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  color VARCHAR(150) NOT NULL
);

-- Genres

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

