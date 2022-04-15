DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS songs;

CREATE TABLE members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  instruments TEXT NOT NULL,
  img TEXT NOT NULL,
  trivia TEXT NULL
);

CREATE TABLE albums (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT UNIQUE NOT NULL,
  year_published INTEGER NOT NULL,
  img TEXT NOT NULL
);

CREATE TABLE songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  album_id INTEGER NOT NULL,
  title TIMESTAMP NOT NULL,
  duration TEXT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums (id)
);

INSERT INTO members 
    (first_name, last_name, instruments, img, trivia)
VALUES
    ("Arleta", "Marleta", "gitara", "/static/img/arleta.png", "Nie lubię słodyczy"),
    ("Marek", "Tralek", "perkusja", "/static/img/marek.png", "Nigdy niczego nie złamałem"),
    ("Karol", "Barol", "wokal", "/static/img/karol.png", "Pochodzę z Hiszpanii (nikt nie wierzy)");

INSERT INTO albums 
    (title, year_published, img)
VALUES
    ("Nie ma letko", 2021, "/static/img/album1.png"),
    ("Kiedyś to było", 2020, "/static/img/album2.jpg");