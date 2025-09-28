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

insert into readers(name, birthdate, address, phonenumber) values
('Nguyễn Văn A', '1992-05-15', 'Hà Nội', '0123456789'),
('Trần Thị B', '1985-08-20', 'TP Hồ Chí Minh', '0987654321'),
('Lê Văn C', '1970-12-10', 'Đà Nẵng', '0112233445'),
('Phạm Thị D', '1995-03-30', 'Cần Thơ', '0198765432'),
('Nguyễn Văn E', '1980-07-22', 'Hải Phòng', '0123987654'),
('Trần Văn F', '1965-11-05', 'Nha Trang', '0156789012'),
('Lê Thị G', '1998-01-25', 'Biên Hòa', '0167890123'),
('Phạm Văn H', '1982-09-15', 'Vũng Tàu', '0178901234'),
('Nguyễn Thị I', '1973-04-18', 'Thủ Dầu Một', '0189012345'),
('Trần Văn J', '1990-06-12', 'Đà Lạt', '0190123456');

SET SQL_SAFE_UPDATES = 0;
update readers
set name = concat(name,'genz')
where year(birthdate) between 1990 and 2000;

select* from readers
where birthDate > '1975-01-01';

insert into borrows (borrowdate, returndate, bookid, readerid) values
('2023-05-01', NULL, 1, 1),
('2023-05-02', NULL, 2, 2),
('2023-05-03', '2023-05-10', 3, 3),
('2023-05-04', NULL, 4, 4),
('2023-05-05', '2023-05-15', 5, 5),
('2023-05-06', NULL, 6, 6),
('2023-05-07', '2023-05-20', 7, 7),
('2023-05-08', NULL, 8, 8),
('2023-05-09', '2023-05-25', 9, 9),
('2023-05-10', NULL, 10, 10);

update borrows
set returndate = curdate()
where borrowsid = 2;

SELECT * FROM borrows
WHERE bookId = 2 AND returnDate IS NOT NULL;

delete from readers
where readerid = 1 and not exists
(select * from borrows where readerid = 1);

delete from borrows
where readerid =1;
delete from readers
where readerid =1;

delete from books
where bookid =1 and not exists(select* from  borrows where bookid = 1 );

delete from borrows
where bookid =1;
delete from books
where bookid =1;

delete from borrows
where borrowsid =1;
