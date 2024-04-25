<<<<<<< HEAD
select * from orders
where customer_id=7 and price<1000;

SELECT first_name,last_name,points from customers
where country = "spanian"

select products from orders 
where price>1200 and price<1400

select * from orders 
where price<1200 and customer_id=6

select * from customers
where  customer_id=4 or country= "Germany"

select * from  orders 
where customer_id in (1,4)

select * from orders 
where price between 1000 and 1300

select * from orders 
where order_id between 4 and 9
order by price Desc

select * from orders 
where products like "Ga%"

select * from customers
where first_name like "__n%" or last_name like "F%n"

select first_name, (points+10)*2 as point_and_bonus 
from customers
where points>2000
order by point_and_bonus desc

select distinct customer_id 
from orders 
where price = 1100

select * from customers 
where points>50
order by points desc 
limit 1,2

select min(price) from orders 
select max(price) from orders

select count(price)
as p_order from orders

select sum(points)
as s_points from customers 

select sum(points)
as s_point from customers
where country="Spanian" and last_name="Ollad" or country="Germany"

select avg(price)
as a_price from orders

select avg(price)
as a_price from orders
where customer_id in (7,6)

select sum(price)
as s_price from orders 
where order_id not between 4 and 8

select * from orders 
where price between 1000 and 1300 and customer_id in ( 1,4,6)
order by order_id desc

select count(customer_id),country
from customers
group by country 

select customer_id from customers 
group by country 

select * from customers c
join orders o
on c.customer_id=o.customer_id

select count(products) from orders
where products= "iphone 13 pro"

select avg(price) from orders
where customer_id=2

select count(products) from orders 

select count(customer_id) from customers
where country="Spanian"

select distinct count(products) as p_count
from orders 
where products like "%o" or price<1200 

select customer_id , avg(price) as avg_price , 
       count(order_id) as total_orders
from orders 
group by customer_id
order by avg_price desc

select count(o.products),c.customer_id
from orders o
join customers c
on o.customer_id=c.customer_id and country="germany"
group by customer_id

select count(customer_id),country
from customers
group by country

select distinct count(products),price
from orders 
group by price
order by price desc

select customer_id
from orders 
group by order_id 
having sum(order_id>2) 

select * from orders o
left join customers c 
on o.customer_id=c.customer_id 

select customer_id from customers c
join orders o
using(customer_id)
group by customer_id
having count(order_id)>=2
order by customer_id desc

select country from customers 
group by country
having count(customer_id)=1

select count(o.products) as T_product
from orders o
join customers c
on o.customer_id=c.customer_id and c.first_name="Tara"
group by products
having sum(price)>500

select  count(products) from orders 
where price<1200

select o.products,c.first_name,c.last_name,c.points
from orders o
join customers c
on o.customer_id=c.customer_id 
and price between 1200 and 1400
order by points desc
 
select products, max(price) from orders
group by products
having min(price)>1200

select customer_id,first_name,points from customers
where last_name="Ollad" or points>=4000 

select customer_id,first_name,last_name,points
from customers
where points>1000
union
select customer_id,first_name,last_name,points
from customers
where points<1200


=======
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
>>>>>>> 2122e2c71d27eaef9dd4c86f522078de3a59d260
