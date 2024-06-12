# Train-Ticket-Booking-System-Database
This repository contains the SQL schema for a Train Ticket Booking System, designed to manage customers, admins, trains, trips, bookings, and tickets.

# Tables

# Customer
- Customerid (int, primary key, auto-generated): Unique identifier for each customer.
- SSN (varchar(20), unique): Social Security Number of the customer.
- Firstname (varchar(20), not null): First name of the customer.
- Lastname (varchar(20), not null): Last name of the customer.
- Phone (varchar(30), unique): Phone number of the customer.
- Email (varchar(40), unique): Email address of the customer.
- Password (varchar(40), not null): Password for customer login.

# Admin

- Adminid (int, primary key, auto-generated): Unique identifier for each admin.
- SSN (varchar(20), unique): Social Security Number of the admin.
- Firstname (varchar(20), not null): First name of the admin.
- Lastname (varchar(20), not null): Last name of the admin.
- Phone (varchar(30), unique): Phone number of the admin.
- Email (varchar(40), unique): Email address of the admin.
- Password (varchar(40), not null): Password for admin login.

# Train
- Trainid (int, primary key, auto-generated): Unique identifier for each train.
- Adminid (int, foreign key): ID of the admin managing the train.
- TrainName (varchar(30), not null): Name of the train.
- brand (varchar(70), not null): Brand or type of the train.
- capcity (int, not null): Total capacity of the train.
- Avaliablecapcity (int, not null): Available capacity of the train.

# Trip
- Tripid (int, primary key, auto-generated): Unique identifier for each trip.
- Source (varchar(50), not null): Source location of the trip.
- Destination (varchar(50), not null): Destination location of the trip.
- Tripdate (date, not null): Date of the trip.
- Starttime (time, not null): Start time of the trip.
- duration (int, not null): Duration of the trip in minutes.

# Trip_price
- Tripid (int, foreign key): ID of the trip.
- class (int, check between 1 and 3): Class identifier for pricing.
- Price (numeric(6,2), not null): Price of the trip for the specified class.

# go_to
- Trainid (int, foreign key): ID of the train.
- Tripid (int, foreign key): ID of the trip.
- Primary key constraint on (Trainid, Tripid): Ensures each train is assigned to a specific trip.
Booking
- Bookingid (int, primary key, auto-generated): Unique identifier for each booking.
- customerid (int, foreign key): ID of the customer making the booking.
- Trainid (int, foreign key): ID of the train booked.
- Tripid (int, foreign key): ID of the trip booked.
- TotalNumberofseats (int, not null): Total number of seats booked.
- TotalPrice (numeric(9,2)): Total price of the booking.

# Booking_class
- Bookingid (int, foreign key): ID of the booking.
- class (int, check between 1 and 3): Class identifier for the booked seats.
- Numberofseats (int, not null): Number of seats booked in the specified class.
- Primary key constraint on (Bookingid, class): Ensures each booking has details for each class.

# Ticket
- Bookingid (int, foreign key): ID of the booking.
- Seatnumber (int, not null): Seat number assigned to the ticket.
- class (int, check between 1 and 3): Class identifier for the ticket.
- Price (numeric(6,2), not null): Price of the ticket.
- Primary key constraint on (Seatnumber, Bookingid): Ensures each ticket is uniquely identified by seat and booking.
