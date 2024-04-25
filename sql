CREATE TABLE Buecher (
  BuchID INT PRIMARY KEY,
  Titel VARCHAR(255),
  Autor VARCHAR(255),
  ISBN VARCHAR(20),
  Verfuegbar BOOLEAN
); 

CREATE TABLE Mitglieder (
  MitgliedID INT PRIMARY KEY,
  Name VARCHAR(255),
  Adresse VARCHAR(255),
  Telefonnummer VARCHAR(15)
);


CREATE TABLE Ausleihen (
  AusleihID INT PRIMARY KEY,
  BuchID INT,
  MitgliedID INT,
  Ausleihdatum DATE,
  Rueckgabedatum DATE,
  FOREIGN KEY (BuchID) REFERENCES Buecher(BuchID),
  FOREIGN KEY (MitgliedID) REFERENCES Mitglieder(MitgliedID)
);

INSERT INTO Buecher (BuchID, Titel, Autor, ISBN, Verfuegbar) VALUES
(1, '1984', 'George Orwell', '978-0451524935', TRUE),
(2, 'Moby Dick', 'Herman Melville', '978-1503280786', TRUE),
(3, 'A Tale of Two Cities', 'Charles Dickens', '978-1503280795', TRUE),
(4, 'The Hobbit', 'J.R.R.Tolkien', '978-1503280125', FALSE),
(5, 'The Da Vinci Code', 'Dan Brown', '978-1503280855', FALSE);

INSERT INTO Mitglieder (MitgliedID, Name, Adresse, Telefonnummer) VALUES
(1, 'Max Mustermann', 'Wegstr 1, 12345 Musterstadt', '0123456789'),
(2, 'Mandana Karimi', 'Bergheimerstr 2, 45359 Essen', '017577652455'),
(3, 'Ryan Reynolds', 'Gitschinerstr 95, 45479 Duisburg', '015550411425'),
(4, 'Raya Ollad', 'Frintropstr 255, 45359 Essen', '017670512645'),
(5, 'Mahan Mousavi', 'Bergmannstr 21, 45485 Duisburg',  '01779009263');

INSERT INTO Ausleihen (AusleihID, BuchID, MitgliedID, Ausleihdatum, Rueckgabedatum) VALUES
(1, 1, 1, '2023-01-01', NULL),
(2, 2, 2, '2024-02-21', NULL),
(3, 4, 5, '2023-01-01', NULL),
(4, 3, 3, '2024-04-16', NULL),
(5, 5, 4, '2021-03-21', '2022-02-02'),
(6, 3, 2, '2022-05-14', '2022-11-06'),
(7, 4, 5, '2023-04-12', '2024-05-01');

select * from mitglieder
select * from buecher
select * from Ausleihen

select * from mitglieder 
where name = 'Raya ollad' and adresse like '%Essen'

select * from mitglieder 
where name like 'R%' or telefonnummer like '%5' 

SELECT b.Titel, m.Name FROM Buecher b
JOIN Ausleihen a ON b.BuchID = a.BuchID
JOIN Mitglieder m ON a.MitgliedID = m.MitgliedID
WHERE a.Rueckgabedatum IS NULL or a.Ausleihdatum > DATE('2021-03-21');

SELECT * FROM Buecher 
WHERE Autor = 'George Orwell';

select count(BuchID) from ausleihen 
where MitgliedID = 2

select m.Name, COUNT(a.AusleihID) AS AnzahlAusleihen
FROM Mitglieder m
JOIN Ausleihen a ON m.MitgliedID = a.MitgliedID
GROUP BY m.Name;

SELECT b.Titel, COUNT(a.AusleihID) AS AnzahlAusleihen
FROM Buecher b
JOIN Ausleihen a ON b.BuchID = a.BuchID
GROUP BY b.Titel
ORDER BY AnzahlAusleihen DESC; 

UPDATE Mitglieder
SET Adresse = 'Neuer Weg 3, 45479 Duisburg'
WHERE MitgliedID = 3;

select * from mitglieder
where MitgliedID = 3;

UPDATE Buecher
SET Verfuegbar = TRUE
WHERE BuchID = (SELECT BuchID FROM Ausleihen WHERE AusleihID = 5 and 4);

select * from buecher;

SELECT b.Titel, AVG(DATEDIFF(a.Rueckgabedatum, a.Ausleihdatum)) AS DurchschnittlicheTage
FROM Ausleihen a
JOIN Buecher b ON a.BuchID = b.BuchID
WHERE a.Rueckgabedatum IS NOT NULL
GROUP BY b.Titel;

SELECT DISTINCT m.Name
FROM Mitglieder m
JOIN Ausleihen a ON m.MitgliedID = a.MitgliedID
WHERE a.Rueckgabedatum IS NULL;

SELECT b.Titel, m.Name, a.Ausleihdatum, CASE WHEN a.Rueckgabedatum IS NULL THEN 'Nicht zurückgegeben' ELSE 'Zurückgegeben' END AS Status
FROM Ausleihen a
JOIN Buecher b ON a.BuchID = b.BuchID
JOIN Mitglieder m ON a.MitgliedID = m.MitgliedID;

SELECT m.MitgliedID, m.Name, m.telefonnummer, b.Titel, a.Ausleihdatum
FROM Ausleihen a
JOIN Buecher b ON a.BuchID = b.BuchID
JOIN Mitglieder m ON a.MitgliedID = m.MitgliedID
WHERE a.Rueckgabedatum IS NULL AND a.Ausleihdatum < DATE('2024-05-01');

SELECT b.Autor, COUNT(a.AusleihID) AS Ausleihen
FROM Buecher b
JOIN Ausleihen a ON b.BuchID = a.BuchID
WHERE a.Ausleihdatum BETWEEN '2023-01-01' AND '2024-12-31'
GROUP BY b.Autor
ORDER BY Ausleihen DESC; 

SELECT Adresse, COUNT(a.AusleihID) AS Ausleihen
FROM Mitglieder m
JOIN Ausleihen a ON m.MitgliedID = a.MitgliedID
GROUP BY m.Adresse
ORDER BY Ausleihen DESC;

SELECT m.Name, b.Titel 
FROM Ausleihen a
JOIN Buecher b ON a.BuchID = b.BuchID
JOIN Mitglieder m ON a.MitgliedID = m.MitgliedID
WHERE m.MitgliedID = 1;

SELECT b.Titel, COUNT(a.AusleihID) AS Ausleihen, b.Verfuegbar
FROM Buecher b
LEFT JOIN Ausleihen a ON b.BuchID = a.BuchID
GROUP BY b.Titel, b.Verfuegbar
HAVING b.Verfuegbar = FALSE
ORDER BY Ausleihen DESC; 

SELECT b.Titel, b.Autor
FROM Buecher b
LEFT JOIN Ausleihen a ON b.BuchID = a.BuchID
WHERE a.BuchID IS NULL;

SELECT DATE_FORMAT(a.Ausleihdatum, '%Y-%m') AS Monat, 
COUNT(*) AS DurchschnittlicheAnzahl 
FROM Ausleihen a 
GROUP BY Monat;