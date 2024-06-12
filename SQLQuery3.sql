create Table Customer (
Customerid int  primary key Identity(1,1),
SSN varchar(20) unique,
Firstname varchar(20) not null,
Lastname varchar(20) not null,
Phone varchar(30) unique,
Email varchar(40) unique,
Password varchar(40) not null,
);

create Table Admin (
Adminid int  primary key Identity(1,1),
SSN varchar(20) unique,
Firstname varchar(20) not null,
Lastname varchar(20) not null,
Phone varchar(30) unique,
Email varchar(40) unique,
Password varchar(40) not null,
);

create Table Train (
Trainid int primary key identity(1,1),
Adminid int foreign key references Admin (Adminid),
TrainName varchar(30) not null,
brand varchar(70) not null,
capcity int not null,
Avaliablecapcity int not null,


);

create Table Trip (
Tripid int primary key identity(1,1),
Source varchar(50) not null,
Destination varchar(50) not null,
Tripdate date not null,
Starttime time not null,
duration int not null,

);

create Table Trip_price(
Tripid int foreign key references Trip (Tripid),
class int check (class between 1 and 3),
Price numeric (6,2) not null ,
primary key (class,Tripid),

);

create Table go_to(
Trainid int foreign key references Train (Trainid),
Tripid int foreign key references Trip (Tripid),
primary key (Trainid,Tripid),
);

create Table Booking (
Bookingid int primary key identity(1,1),
customerid int foreign key references Customer (customerid),
Trainid int foreign key references Train (Trainid),
Tripid int foreign key references Trip (Tripid),
TotalNumberofseats int not null,
TotalPrice numeric (9,2)  ,


);

create Table Booking_class (
Bookingid int foreign key references Booking (Bookingid),
class int check (class between 1 and 3),
Numberofseats int not null,
primary key (Bookingid,class),
);

create Table Ticket (
Bookingid int foreign key references Booking (Bookingid),
Seatnumber int  not null,
class int check (class between 1 and 3),
Price numeric (6,2) not null ,
primary key (Seatnumber,Bookingid),
);



