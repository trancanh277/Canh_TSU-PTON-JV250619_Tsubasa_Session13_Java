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
borrowDate date not null check (borrowDate <= curdate()),
returnDate date,
bookId int,
readerId int,
foreign key(bookId) REFERENCES books(bookId),
foreign key (readerId) references readers(readerId)
);
