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
  title TEXT NOT NULL,
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
    (2, "Nie ma letko", 2021, "/static/img/album1.png"),
    (1, "Kiedyś to było", 2020, "/static/img/album2.jpg"),
    (0, "Dobrze jak jest dobrze", 2018, "/static/img/album3.jpg");

INSERT INTO songs 
    (album_id, title, duration)
VALUES
    (0, "Moim zdaniem to nie ma tak", "2:50"),
    (0, "Że dobrze albo że nie dobrze", "3:03"),
    (0, "Gdybym miał powiedzieć", "3:53"),
    (0, "Co cenię w życiu najbardziej", "4:06"),
    (0, "Powiedziałbym", "3:23"),
    (0, "Ludzi", "4:01"),
    (0, "Znaczy... marchew", "4:20");

INSERT INTO songs 
    (album_id, title, duration)
VALUES
    (1, "Bronili się 9 długich dni", "9:00"),
    (1, "To nie ma z tym nic wspólnego", "3:15"),
    (1, "Zaraz będzie ciemno", "5:34"),
    (1, "A Adama jak zwykle nie ma", "4:03"),
    (1, "Ona przyszła stamtąd gdzie wszyscy spadają", "15:45"),
    (1, "Napisałem wiersz: Nie-bo", "3:33"),
    (1, "Ładny", "5:25"),
    (1, "Nie jestem pewien końcówki", "21:37");

INSERT INTO songs 
    (album_id, title, duration)
VALUES
    (2, "Na dobry początek", "2:15"),
    (2, "Wysoki sądzie", "3:54"),
    (2, "Wnoszę o uchylenie okna", "4:15"),
    (2, "Uchylam", "3:32"),
    (2, "Teraz siedzę", "4:59"),
    (2, "I tak to się żyje w tym kraju", "4:20");