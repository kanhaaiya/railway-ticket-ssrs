
-- Create all required tables for the SSRS Railway Ticket Project

CREATE TABLE PassengerMaster (
    PNRno INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Sex NVARCHAR(10),
    Address NVARCHAR(100)
);

CREATE TABLE AccountMaster (
    PNRno INT,
    Amount DECIMAL(10,2),
    TransactionID NVARCHAR(20),
    TransactionDate DATE,
    FOREIGN KEY (PNRno) REFERENCES PassengerMaster(PNRno)
);

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
