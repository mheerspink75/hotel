USE hoteldb;

INSERT INTO Guest (GuestID, FirstName, LastName, Address, City, State, Zip, Phone) values 
	(1, 'Matt', 'Heerspink', '3113 Parker Annex Rd', 'Jonesboro', 'AR', 72401, '(517) 414-9194'),
	(2, 'Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', 51501, '(291) 553-0508'),
	(3, 'Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', 99654, '(478) 277-9632'),
	(4, 'Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', 78552, '(308) 494-0198'),
	(5, 'Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', 08096, '(214) 730-0298'),
	(6, 'Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', 48601, '(377) 507-0974'),
	(7, 'Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', 80003, '(814) 485-2615'),
	(8, 'Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', 60099, '(279) 491-0960'),
	(9, 'Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', 02864, '(446) 396-6785'),
	(10, 'Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', 13126, '(834) 727-1001'),
	(11, 'Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', 	22015, '(446) 351-6860'),
	(12, 'Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', 19026, '(231) 893-2755');


INSERT INTO RoomType (RoomTypeID, `Type`, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) values 
	(1, 'Double', 2, 4, 199.99, '10'),
	(2, 'Double', 2, 4, 174.99, '10'),
	(3, 'Double', 2, 4, 199.99, '10'),
	(4, 'Double', 2, 4, 174.99, '10'),
	(5, 'Single', 2, 2, 174.99, 'NA'),
	(6, 'Single', 2, 2, 149.99, 'NA'),
	(7, 'Single', 2, 2, 174.99, 'NA'),
	(8, 'Single', 2, 2, 149.99, 'NA'),
	(9, 'Double', 2, 4, 199.99, '10'),
	(10, 'Double', 2, 4, 174.99, '10'),
	(11, 'Double', 2, 4, 199.99, '10'),
	(12, 'Double', 2, 4, 174.99, '10'),
	(13, 'Double', 2, 2, 174.99, 'NA'),
	(14, 'Single', 2, 2, 149.99, 'NA'),
	(15, 'Single', 2, 2, 174.99, 'NA'),
	(16, 'Single', 2, 2, 149.99, 'NA'),
	(17, 'Suite', 3, 8, 399.99, '20'),
	(18, 'Suite', 3, 8, 399.99, '20');
    

INSERT INTO Room (RoomID, RoomTypeID, RoomNumber, ADA_Accessable) values 
	(1, 1, 201, 'No'),
	(2, 2, 202, 'Yes'),
	(3, 3, 203, 'No'),
	(4, 4, 204, 'Yes'),
	(5, 5, 205, 'No'),
	(6, 6, 206, 'Yes'),
	(7, 7, 207, 'No'),
	(8, 8, 208, 'Yes'),
	(9, 9, 301, 'No'),
	(10, 10, 302, 'Yes'),
	(11, 11, 303, 'No'),
	(12, 12, 304, 'Yes'),
	(13, 13, 305, 'No'),
	(14, 14, 306, 'Yes'),
	(15, 15, 307, 'No'),
	(16, 16, 308, 'Yes'),
	(17, 17, 401, 'Yes'),
	(18, 18, 402, 'Yes');
 
 
    INSERT INTO Amenity (AmenityID, RoomTypeID, Microwave, Jacuzzi, Refrigerator, Oven) values 
	(1, 1, 'True', 'True', 'False', 'False'),
	(2, 2, 'False', 'False', 'True', 'False'),
	(3, 3, 'True', 'True', 'False', 'False'),
	(4, 4, 'False', 'False', 'True', 'False'),
	(5, 5, 'True', 'True', 'True', 'False'),
	(6, 6, 'True', 'True', 'False', 'False'),
	(7, 7, 'True', 'False', 'True', 'False'),
	(8, 8, 'True', 'True', 'False', 'False'),
	(9, 9, 'False', 'False', 'True', 'False'),
	(10, 10, 'True', 'True', 'False', 'False'),
	(11, 11, 'False', 'False', 'True', 'False'),
	(12, 12, 'False', 'False', 'True', 'False'),
	(13, 13, 'True', 'True', 'True', 'False'),
	(14, 14, 'True', 'False', 'True', 'False'),
	(15, 15, 'True', 'True', 'True', 'False'),
	(16, 16, 'True', 'False', 'True', 'False'),
	(17, 17, 'True', 'False', 'True', 'True'),
	(18, 18, 'True', 'False', 'True', 'True');


INSERT INTO Reservation (ReservationID, RoomID, GuestID, Adults, Children, StartDate, EndDate, TotalCost) values
	(1,16,2,1,0,'2023-02-02','2023-02-04',299.98),
	(2,3,3,2,1,'2023-02-05','2023-02-10',999.95),
	(3,13,4,2,0,'2024-02-22','2023-02-24',349.98),
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


