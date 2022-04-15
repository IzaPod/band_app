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
  id INTEGER PRIMARY KEY,
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
    (id, title, year_published, img)
VALUES
    (1, "Nie ma letko", 2021, "/static/img/album1.png"),
    (0, "Kiedyś to było", 2020, "/static/img/album2.jpg");

INSERT INTO songs 
    (album_id, title, duration)
VALUES
    (0, "Intro", "3:05"),
    (0, "No ja nie wiem", "5:34"),
    (0, "Taka ta melodia", "3:33"),
    (0, "Tęskno za ludźmi", "2:10"),
    (0, "Rify na klify", "15:45"),
    (0, "Na koniec", "21:37");

INSERT INTO songs 
    (album_id, title, duration)
VALUES
    (0, "Na dobry początek", "2:15"),
    (0, "Wysoki sądzie", "3:54"),
    (0, "Wnoszę o uchylenie okna", "4:15"),
    (0, "Uchylam", "3:32"),
    (0, "Teraz siedzę", "4:59"),
    (0, "I tak to się żyje w tym kraju", "4:20");