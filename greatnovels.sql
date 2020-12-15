drop database greatnovels; 
create database greatnovels;
create user 'novels'@'localhost' identified with mysql_native_password by 'novel$s';
grant all on greatnovels.* to 'novels'@'localhost';
use greatnovels;
create table authors (
	id INT auto_increment,
    nameFirst VARCHAR(255),
    nameLast VARCHAR(255),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id)
);
create table genres (
	id INT auto_increment,
    name VARCHAR(255),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id)
);
create table novels (
	id INT auto_increment,
    title VARCHAR(255),
    authorId INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id),
    foreign key (authorId) references authors (id)
);
create table novelsGenres (
    genreId INT,
    novelId INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(genreId, novelId),
    foreign key (genreId) references genres (id),
    foreign key (novelId) references novels (id)

);insert into authors (nameFirst, nameLast) values ("Bram", "Stoker");
insert into authors (nameFirst, nameLast) values ("Oscar", "Wilde");
insert into authors (nameFirst, nameLast) values ("Alice", "Walker");
insert into authors (nameFirst, nameLast) values ("Leo", "Tolstoy");
insert into authors (nameFirst, nameLast) values ("Charles", "Dickens");
insert into authors (nameFirst, nameLast) values ("Arthur", "Miller");
insert into authors (nameFirst, nameLast) values ("Alexandre", "Dumas");
insert into authors (nameFirst, nameLast) values ("Arthur Conan", "Doyle");
insert into authors (nameFirst, nameLast) values ("Robert Louis", "Stevenson");
insert into authors (nameFirst, nameLast) values ("Fyodor", "Dostoyevsky");
insert into authors (nameFirst, nameLast) values ("Agatha", "Christie");
insert into authors (nameFirst, nameLast) values ("Ray", "Bradbury");
insert into authors (nameFirst, nameLast) values ("George", "Orwell");
insert into authors (nameFirst, nameLast) values ("H.G.", "Wells");
insert into authors (nameFirst, nameLast) values ("Chinua", "Achebe");

INSERT INTO genres (name) VALUES ("Adventure");
INSERT INTO genres (name) VALUES ("African Literature");
INSERT INTO genres (name) VALUES ("Crime");
INSERT INTO genres (name) VALUES ("Drama");
INSERT INTO genres (name) VALUES ("Dystopia");
INSERT INTO genres (name) VALUES ("Fantasy");
INSERT INTO genres (name) VALUES ("Fiction");
INSERT INTO genres (name) VALUES ("French Literature");
INSERT INTO genres (name) VALUES ("Gothic");
INSERT INTO genres (name) VALUES ("Historical Fiction");
INSERT INTO genres (name) VALUES ("Horror");
INSERT INTO genres (name) VALUES ("Mystery");
INSERT INTO genres (name) VALUES ("Plays");
INSERT INTO genres (name) VALUES ("Russian Literature");
INSERT INTO genres (name) VALUES ("Science Fiction");
INSERT INTO genres (name) VALUES ("Thriller");
INSERT INTO genres (name) VALUES ("Time Travel");
INSERT INTO genres (name) VALUES ("War");

INSERT INTO novels (title, authorId) VALUES ("Dracula", 1);
INSERT INTO novels (title, authorId) VALUES ("The picture of dorian gray", 2);
INSERT INTO novels (title, authorId) VALUES ("The colour purple", 3);
INSERT INTO novels (title, authorId) VALUES ("War and peace", 4);
INSERT INTO novels (title, authorId) VALUES ("A tale of two cities", 5);
INSERT INTO novels (title, authorId) VALUES ("The crucible", 6);
INSERT INTO novels (title, authorId) VALUES ("The three musketeers", 7);
INSERT INTO novels (title, authorId) VALUES ("The hound of the baskervilles", 8);
INSERT INTO novels (title, authorId) VALUES ("The strange case of dr. jekyll and mr. hyde", 9);
INSERT INTO novels (title, authorId) VALUES ("Crime and punishment", 10);
INSERT INTO novels (title, authorId) VALUES ("Murder on the orient express", 11);
INSERT INTO novels (title, authorId) VALUES ("Fahrenheit 451", 12);
INSERT INTO novels (title, authorId) VALUES ("Animal farm ", 13);
INSERT INTO novels (title, authorId) VALUES ("The time machine", 14);
INSERT INTO novels (title, authorId) VALUES ("Things fall apart", 15);

INSERT INTO novelsGenres (novelId, genreId) 
  VALUES(1, 6), (1, 7), (1, 11),
        (2, 6), (2, 7), (2, 9), (2, 11),
        (3, 7), (3, 10),
        (4, 7), (4, 10), (4, 14), (4, 18),
        (5, 7), (5, 10),
        (6, 4), (6, 7), (6, 10), (6, 13),
        (7, 1), (7, 7), (7, 8), (7, 10),
        (8, 3), (8, 7), (8, 12), (8, 15),
        (9, 7), (9, 11), (9, 12), (9, 16),
        (10, 7), (10, 12), (10, 14),
        (11, 7), (11, 12),
        (12, 5), (12, 7), (12, 16),
        (13, 5), (13, 7), (13, 16),
        (14, 7), (14, 16), (14, 17),
        (15, 2), (15, 7), (15, 10);
