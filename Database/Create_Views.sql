
-- Create a view for report dataset

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