USE hoteldb;

-- First, using the data provided in the tables above, create the required SQL statements to populate the tables with the data above.
-- Include your name, address, and phone number in the first record of the table for guests. You may use a fictitious address and phone number, as long as you use your own name.
-- As with the tables, add data to the primary tables before adding data to the tables with foreign keys.

-- Insert Into Guest Table
INSERT INTO Guest (GuestID, FirstName, LastName, Address, City, State, Zip, Phone) values 
	(1,'Matt','Heerspink','3113 Parker Annex Rd','Jonesboro','AR',72401,'(517)414-9194'),
	(2,'Mack','Simmer','379 Old Shore Street','Council Bluffs','IA',51501,'(291)553-0508'),
	(3,'Bettyann','Seery','750 Wintergreen Dr.','Wasilla','AK',99654,'(478)277-9632'),
	(4,'Duane','Cullison','9662 Foxrun Lane','Harlingen','TX',78552,'(308)494-0198'),
	(5,'Karie','Yang','9378 W. Augusta Ave.','West Deptford','NJ',08096,'(214)730-0298'),
	(6,'Aurore','Lipton','762 Wild Rose Street','Saginaw','MI',48601,'(377)507-0974'),
	(7,'Zachery','Luechtefeld','7 Poplar Dr.','Arvada','CO',80003,'(814)485-2615'),
	(8,'Jeremiah','Pendergrass','70 Oakwood St.','Zion','IL',60099,'(279)491-0960'),
	(9,'Walter','Holaway','7556 Arrowhead St.','Cumberland','RI',02864,'(446)396-6785'),
	(10,'Wilfred','Vise','77 West Surrey Street','Oswego','NY',13126,'(834)727-1001'),
	(11,'Maritza','Tilton','939 Linda Rd.','Burke','VA',22015,'(446)351-6860'),
	(12,'Joleen','Tison','87 Queen St.','Drexel Hill','PA',19026,'(231)893-2755');

-- Insert Into RoomType Table
INSERT INTO RoomType (RoomTypeID, `Type`, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) values 
	(1,2,2,4,199.99,1),
	(2,2,2,4,174.99,1),
	(3,1,2,2,174.99,3),
	(4,1,2,2,149.99,3),
	(5,2,2,2,174.99,3),
	(6,3,3,8,399.99,2);
    
-- Insert Into Room Table
INSERT INTO Room (RoomID, RoomTypeID, RoomNumber, ADA_Accessable) values 
	(1,1,201,2),
	(2,2,202,1),
	(3,1,203,2),
	(4,2,204,1),
	(5,3,205,2),
	(6,4,206,1),
	(7,3,207,2),
	(8,4,208,1),
	(9,1,301,2),
	(10,2,302,1),
	(11,1,303,2),
	(12,2,304,1),
	(13,3,305,2),
	(14,4,306,1),
	(15,3,307,2),
	(16,4,308,1),
	(17,6,401,1),
	(18,6,402,1);
 
     -- Insert Into Amenity Table
INSERT INTO Amenity (AmenityID, RoomTypeID, Microwave, Jacuzzi, Refrigerator, Oven) values 
	(1,1,1,1,2,2),
	(2,2,2,2,1,2),
	(3,1,1,1,2,2),
	(4,2,2,2,1,2),
	(5,3,1,1,1,2),
	(6,4,1,2,1,2),
	(7,3,1,1,1,2),
	(8,4,1,2,1,2),
	(9,1,1,1,2,2),
	(10,2,2,2,1,2),
	(11,1,1,1,2,2),
	(12,2,2,2,1,2),
	(13,3,1,1,1,2),
	(14,4,1,2,1,2),
	(15,3,1,1,1,2),
	(16,4,1,2,1,2),
	(17,6,1,2,1,1),
	(18,6,1,2,1,1);

-- Insert Into Reservation Table
INSERT INTO Reservation (ReservationID, RoomID, GuestID, Adults, Children, StartDate, EndDate, TotalCost) values
	(1,16,2,1,0,'2023-02-02','2023-02-04',299.98),
	(2,3,3,2,1,'2023-02-05','2023-02-10',999.95),
	(3,13,4,2,0,'2023-02-22','2023-02-24',349.98),
	(4,1,5,2,2,'2023-03-06','2023-03-07',199.99),
	(5,15,1,1,1,'2023-03-17','2023-03-20',524.97),
	(6,10,6,3,0,'2023-03-18','2023-03-23',924.95),
	(7,2,7,2,2,'2023-03-29','2023-03-31',349.98),
	(8,12,8,2,0,'2023-03-31','2023-04-05',874.95),
	(9,9,9,1,0,'2023-04-09','2023-04-13',799.96),
	(10,7,10,1,1,'2023-04-23','2023-04-24',174.99),
	(11,17,11,2,4,'2023-05-30','2023-06-02',1199.97),
	(12,6,12,2,0,'2023-06-10','2023-06-14',599.96),
	(13,8,12,1,0,'2023-06-10','2023-06-14',599.96),
	(14,12,6,3,0,'2023-06-17','2023-06-18',184.99),
	(15,5,1,2,0,'2023-06-28','2023-07-02',699.96),
	(16,4,9,3,1,'2023-07-13','2023-07-14',184.99),
	(17,17,10,4,2,'2023-07-18','2023-07-21',1259.97),
	(18,11,3,2,1,'2023-07-28','2023-07-29',199.99),
	(19,13,3,1,0,'2023-08-30','2023-09-01',349.98),
	(20,8,2,2,0,'2023-09-16','2023-09-17',149.99),
	(21,3,5,2,2,'2023-09-13','2023-09-15',399.98),
	(22,17,4,2,2,'2023-11-22','2023-11-25',1199.97),
	(23,6,2,2,0,'2023-11-22','2023-11-25',449.97),
	(24,9,2,2,2,'2023-11-22','2023-11-25',599.97),
	(25,10,11,2,0,'2023-12-24','2023-12-28',699.96);

-- Second, after adding all of the data above, create SQL statements that will delete Jeremiah Pendergrass and his reservations from the database.
-- Deleting data should start with records that reference Jeremiah Pendergrass using a foreign key and then delete the record from the guest table as the last step.
-- The scripts should only delete records related to Jeremiah Pendergrass and his reservations. They should not delete any room data.

-- Delete Records for Jeremiah Pendergrass
DELETE FROM Reservation WHERE GuestID='8';
DELETE FROM Guest WHERE GuestID='8';
