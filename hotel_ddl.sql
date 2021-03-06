DROP DATABASE IF EXISTS hoteldb;
CREATE DATABASE IF NOT EXISTS hoteldb;

USE hoteldb;

-- 1. Guest Table
CREATE TABLE Guest (
GuestID INT AUTO_INCREMENT NOT NULL,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(2) NOT NULL,
Zip INT NOT NULL,
Phone VARCHAR(25) NOT NULL,
PRIMARY KEY (GuestID)
);

-- 2. RoomType Table
CREATE TABLE RoomType (
RoomTypeID INT AUTO_INCREMENT NOT NULL,
`Type` ENUM('Single', 'Double', 'Suite') NOT NULL,
StandardOccupancy INT NOT NULL,
MaximumOccupancy INT NOT NULL,
BasePrice DECIMAL(5,2) NOT NULL,
ExtraPerson ENUM('10', '20', 'NA') NOT NULL,
PRIMARY KEY (RoomTypeID)
);

-- 3. Room Table
CREATE TABLE Room (
RoomID INT AUTO_INCREMENT NOT NULL,
RoomTypeID INT NOT NULL,
RoomNumber INT NOT NULL,
ADA_Accessable ENUM('YES','NO') NOT NULL,
PRIMARY KEY (RoomID),
FOREIGN KEY (RoomTypeID) REFERENCES RoomType (RoomTypeID)
);

-- 4. Amenity Table
CREATE TABLE Amenity (
AmenityID INT AUTO_INCREMENT NOT NULL,
RoomTypeID INT NOT NULL, 
Microwave ENUM('TRUE','FALSE')  NOT NULL,
Jacuzzi ENUM('TRUE','FALSE') NOT NULL,
Refrigerator ENUM('TRUE','FALSE') NOT NULL,
Oven ENUM('TRUE','FALSE') NOT NULL,
PRIMARY KEY (AmenityID),
FOREIGN KEY (RoomTypeID) REFERENCES RoomType (RoomTypeID)
);

-- 5. Reservation Table
CREATE TABLE Reservation (
ReservationID INT AUTO_INCREMENT NOT NULL,
RoomID INT NOT NULL,
GuestID INT NOT NULL,
Adults INT NOT NULL,
Children INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalCost DECIMAL(6,2) NOT NULL,
PRIMARY KEY (ReservationID),
FOREIGN KEY (GuestID) REFERENCES Guest (GuestID),
FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
);