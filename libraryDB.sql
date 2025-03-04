
-- Create a new database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS libraryDB;
USE libraryDB;

-- Create the authors table
CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Create the books table with a foreign key referencing authors
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  author_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  published_year INT,
  CONSTRAINT fk_author
    FOREIGN KEY (author_id)
    REFERENCES authors(author_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB;
