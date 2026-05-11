CREATE TABLE Customers3(customer_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(100),phone VARCHAR(15),city VARCHAR(50));
select*from Customers3;

CREATE TABLE Destinations3(destination_id INT PRIMARY KEY AUTO_INCREMENT,destination_name VARCHAR(100),country VARCHAR(100),price DECIMAL(10,2));
select*from Destinations3;

CREATE TABLE Bookings3 (booking_id INT PRIMARY KEY AUTO_INCREMENT,customer_id INT,destination_id INT,booking_date DATE,travel_date DATE,FOREIGN KEY (customer_id) REFERENCES Customers3(customer_id),
FOREIGN KEY (destination_id) REFERENCES Destinations3(destination_id));
select*from Bookings3;


CREATE TABLE Payments3(payment_id INT PRIMARY KEY AUTO_INCREMENT,booking_id INT,amount DECIMAL(10,2),payment_date DATE,payment_method VARCHAR(50),
FOREIGN KEY (booking_id) REFERENCES Bookings3(booking_id));
select*from Payments3;


INSERT INTO Customers3(name, email, phone, city) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Delhi'),
('Anita Verma', 'anita@gmail.com', '9876543211', 'Mumbai'),
('Kiran Rao', 'kiran@gmail.com', '9876543212', 'Hyderabad');
select*from Customers3;

INSERT INTO Destinations3(destination_name, country, price) VALUES
('Goa Beach', 'India', 15000),
('Paris Tour', 'France', 120000),
('Dubai Trip', 'UAE', 80000);
select*from Destinations3;


INSERT INTO Bookings3(customer_id, destination_id, booking_date, travel_date) VALUES
(1, 1, '2025-01-10', '2025-02-15'),
(2, 2, '2025-01-12', '2025-03-10'),
(3, 3, '2025-01-15', '2025-04-05');
select*from Bookings3;


INSERT INTO Payments3(booking_id, amount, payment_date, payment_method) VALUES
(1, 15000, '2025-01-11', 'Credit Card'),
(2, 120000, '2025-01-13', 'UPI'),
(3, 80000, '2025-01-16', 'Debit Card');
select*from Payments3;


SELECT C.name, D.destination_name, B.travel_date
FROM Customers3 C
JOIN Bookings3 B ON C.customer_id = B.customer_id
JOIN Destinations3 D ON B.destination_id = D.destination_id;


SELECT C.name, SUM(P.amount) AS Total_Amount
FROM Customers3 C
JOIN Bookings3 B ON C.customer_id = B.customer_id
JOIN Payments3 P ON B.booking_id = P.booking_id
GROUP BY C.name;


SELECT destination_name, price FROM Destinations3 WHERE price = (SELECT MAX(price) FROM Destinations3);


SELECT C.name, B.travel_date FROM Customers3 C JOIN Bookings3 B ON C.customer_id = B.customer_id WHERE B.travel_date > '2025-03-01';

SELECT D.destination_name, COUNT(B.booking_id) AS Total_Bookings FROM Destinations3 D
LEFT JOIN Bookings3 B ON D.destination_id = B.destination_id
GROUP BY D.destination_name;
