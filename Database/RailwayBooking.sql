CREATE DATABASE RailwayBookingDB

use RailwayBookingDB


--------Create tables:--------------
-------1. PassengerMaster-------------------

CREATE TABLE PassengerMaster (
    PNRno INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Sex NVARCHAR(10),
    Address NVARCHAR(100)
);


------------------2. AccountMaster---------------------

CREATE TABLE AccountMaster (
    PNRno INT,
    Amount DECIMAL(10,2),
    TransactionID NVARCHAR(20),
    TransactionDate DATE,
    FOREIGN KEY (PNRno) REFERENCES PassengerMaster(PNRno)
);


-----------------------3. Journey_Details-------------

CREATE TABLE Journey_Details (
    PNRno INT,
    DeparturePlace NVARCHAR(50),
    ArrivalPlace NVARCHAR(50),
    DepartureDate DATETIME,
    ArrivalDate DATETIME,
    BerthNo NVARCHAR(10),
    TrainNo INT,
	Class NVARCHAR(50),
    FOREIGN KEY (PNRno) REFERENCES PassengerMaster(PNRno)
);


Select * From PassengerMaster
Select * From AccountMaster
Select * From Journey_Details



-----------------------Insert Sample Data in all table------------------


-- Insert data in Passenger table -----
INSERT INTO PassengerMaster VALUES
(547298, 'Krish', 28, 'Male', 'Kolkata'),
(547300, 'klk', 26, 'Male', 'Indore'),
(547301, 'Riya', 25, 'Female', 'Mumbai'),
(547302, 'Aman', 29, 'Male', 'Delhi'),
(547303, 'Sneha', 26, 'Female', 'Indore'),
(547304, 'Raj', 25, 'Male', 'Patna'),
(547305, 'Pooja', 37, 'Female', 'Patna'),
(547306, 'Vikram', 26, 'Male', 'Chennai'),
(547307, 'Meera', 42, 'Female', 'Lucknow'),
(547308, 'Arjun', 20, 'Male', 'Kolkata'),
(547309, 'Nisha', 39, 'Female', 'Bangalore');

-- Insert data in Account-----------
INSERT INTO AccountMaster VALUES
(547298, 1200.00, 'TC178267', '2017-06-08'),
(547300, 599.12, 'TC1000', '2025-07-10'),
(547301, 1402.37, 'TC1001', '2025-07-10'),
(547302, 658.24, 'TC1002', '2025-07-10'),
(547303, 687.4, 'TC1003', '2025-07-10'),
(547304, 1081.46, 'TC1004', '2025-07-10'),
(547305, 628.97, 'TC1005', '2025-07-10'),
(547306, 1043.54, 'TC1006', '2025-07-10'),
(547307, 1145.55, 'TC1007', '2025-07-10'),
(547308, 700.6, 'TC1008', '2025-07-10'),
(547309, 919.78, 'TC1009', '2025-07-10');


-- Insert data in Journey table --------
INSERT INTO Journey_Details VALUES
(547298, 'Kolkata', 'Patna', '2025-07-20 20:33:10', '2025-07-21 07:30:15', 'B3,56', 79216,'2AC'),
(547300, 'Patna', 'Lucknow', '2025-07-20 20:00:00', '2025-07-21 07:00:00', 'S5,12', 79000, 'Sleeper'),
(547301, 'Bangalore', 'Indore', '2025-07-20 21:00:00', '2025-07-21 07:00:00', 'B2,45', 79001, '2AC'),
(547302, 'Bangalore', 'Patna', '2025-07-20 22:00:00', '2025-07-21 05:00:00', 'B3,56', 79002, '3AC'),
(547303, 'Chennai', 'Mumbai', '2025-07-20 23:00:00', '2025-07-21 08:00:00', 'S1,23', 79003, '1AC'),
(547304, 'Chennai', 'Kolkata', '2025-07-21 00:00:00', '2025-07-21 09:00:00', 'S2,34', 79004, 'Sleeper'),
(547305, 'Chennai', 'Bangalore', '2025-07-21 01:00:00', '2025-07-21 08:00:00', 'S3,67', 79005, '2AC'),
(547306, 'Kolkata', 'Indore', '2025-07-21 02:00:00', '2025-07-21 12:00:00', 'A1,78', 79006, '3AC'),
(547307, 'Jaipur', 'Bangalore', '2025-07-21 03:00:00', '2025-07-21 14:00:00', 'A2,90', 79007, '1AC'),
(547308, 'Indore', 'Hyderabad', '2025-07-21 04:00:00', '2025-07-21 14:00:00', 'C1,22', 79008, 'Sleeper'),
(547309, 'Bangalore', 'Chennai', '2025-07-21 05:00:00', '2025-07-21 15:00:00', 'C2,11', 79009, '2AC');


------- Create View for Reporting-----------------------------------------

CREATE VIEW vw_RailwayTicketReport AS
SELECT 
    p.PNRno,
    p.Name,
    p.Age,
    p.Sex,
    p.Address,
    a.Amount,
    a.TransactionID,
    a.TransactionDate,
    j.DeparturePlace,
    j.ArrivalPlace,
    j.DepartureDate,
    j.ArrivalDate,
    j.BerthNo,
    j.TrainNo,
	j.Class
FROM PassengerMaster p
JOIN AccountMaster a ON p.PNRno = a.PNRno
JOIN Journey_Details j ON p.PNRno = j.PNRno;


select * from vw_RailwayTicketReport

