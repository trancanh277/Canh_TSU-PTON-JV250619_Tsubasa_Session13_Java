create database library_management;
use library_management;

create table books(
bookid int auto_increment primary key,
title varchar(100) not null,
author varchar(100) not null,
publishedYear YEAR NOT NULL,
category VARCHAR(50) NOT NULL

);
create table readers(
readerid int auto_increment primary key,
name varchar(50) not null,
birthDate date not null ,
address varchar(255),
phoneNumber varchar(11)
);
create table borrows(
borrowsid int auto_increment primary key,
borrowDate date not null,
returnDate date,
bookId int,
readerId int,
foreign key(bookId) REFERENCES books(bookId),
foreign key (readerId) references readers(readerId)
);
INSERT INTO books (title, author, publishedYear, category) VALUES
('The Call of the Wild', 'Jack London', 1903, 'Adventure'),
('The Phantom of the Opera', 'Gaston Leroux', 1910, 'Gothic Fiction'),
('Mrs. Dalloway', 'Virginia Woolf', 1925, 'Modernist'),
('The Sun Also Rises', 'Ernest Hemingway', 1926, 'Modernist'),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy'),
('The Little Prince', 'Antoine de Saint-Exupéry', 1943, 'Fable'),
('The Old Man and the Sea', 'Ernest Hemingway', 1952, 'Literary Fiction'),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 1967, 'Magic Realism'),
('The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', 1979, 'Science Fiction'),
('The Alchemist', 'Paulo Coelho', 1988, 'Adventure');

update books
set author = 'Nguyễn Văn A'
where bookid = 1;
SELECT * FROM books
WHERE title LIKE 'A%' OR title LIKE 'B%';

