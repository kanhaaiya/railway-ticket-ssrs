
# Railway Ticket Booking System (SQL Server + SSRS)

This project simulates an Indian Railway ticket booking system and generates printable tickets using SSRS.

## Features
- SQL Server relational schema for passengers, transactions, and journey details
- Parameterized SSRS report (PNR input)
- IRCTC-style layout with schedule, fare, berth, and personal details

## Setup

### 1. Create Database and Tables
Run the scripts in the `/Database` folder:
- `Create_Tables.sql`
- `Insert_Sample_Data.sql`
- `Create_Views.sql`

### 2. Open SSRS Report
Open the `.rdl` file in Report Builder or Visual Studio.
- Set up a data source connection to your SQL Server
- Use the view `vw_RailwayTicketReport` for dataset
- Add a parameter to filter by `PNRno`

## Sample PNR: `547298`

## Screenshots
See `/Screenshots` for examples of data and final report output.

## Author
Kanhaaiya Lal  © 2025  
This project is for educational and demo purposes only.
