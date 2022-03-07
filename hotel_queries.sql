 USE hoteldb;

-- For each query, include:
-- The request from this assignment as a comment above the query, including the number
-- The query itself
-- The results of the query in a comment under the query


-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT firstname,
       lastname,
       roomnumber,
       startdate,
       enddate
FROM   reservation
       INNER JOIN room
               ON room.roomid = reservation.roomid
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
WHERE  enddate BETWEEN '2023-07-01' AND '2023-07-31';

-- Query Results:
# firstname	lastname	roomnumber	startdate	enddate
-- Matt	Heerspink	205	2023-06-28	2023-07-02
-- Walter	Holaway	204	2023-07-13	2023-07-14
-- Wilfred	Vise	401	2023-07-18	2023-07-21
-- Bettyann	Seery	303	2023-07-28	2023-07-29



-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT firstname,
       lastname,
       roomnumber,
       startdate,
       enddate,
       jacuzzi
FROM   reservation
       INNER JOIN room
               ON room.roomid = reservation.roomid
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
       INNER JOIN amenity
               ON amenity.amenityid = room.roomid
WHERE  jacuzzi = 'TRUE';

-- Query Results:
# firstname	lastname	roomnumber	startdate	enddate	jacuzzi
-- Karie	Yang	201	2023-03-06	2023-03-07	TRUE
-- Bettyann	Seery	203	2023-02-05	2023-02-10	TRUE
-- Karie	Yang	203	2023-09-13	2023-09-15	TRUE
-- Matt	Heerspink	205	2023-06-28	2023-07-02	TRUE
-- Wilfred	Vise	207	2023-04-23	2023-04-24	TRUE
-- Walter	Holaway	301	2023-04-09	2023-04-13	TRUE
-- Mack	Simmer	301	2023-11-22	2023-11-25	TRUE
-- Bettyann	Seery	303	2023-07-28	2023-07-29	TRUE
-- Duane	Cullison	305	2023-02-22	2023-02-24	TRUE
-- Bettyann	Seery	305	2023-08-30	2023-09-01	TRUE
-- Matt	Heerspink	307	2023-03-17	2023-03-20	TRUE



-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT firstname,
       lastname,
       roomnumber,
       adults,
       children,
       startdate,
       adults + children AS total_guests
FROM   reservation
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
       INNER JOIN room
               ON room.roomid = reservation.roomid
WHERE  firstname = 'Mack'
       AND lastname = 'Simmer';
       
-- Query Results:
# firstname	lastname	roomnumber	adults	children	startdate	total_guests
-- Mack	Simmer	308	1	0	2023-02-02	1
-- Mack	Simmer	208	2	0	2023-09-16	2
-- Mack	Simmer	206	2	0	2023-11-22	2
-- Mack	Simmer	301	2	2	2023-11-22	4


-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT roomnumber,
       reservationid,
       baseprice,
       totalcost
FROM   room
       INNER JOIN roomtype
               ON roomtype.roomtypeid = room.roomtypeid
       INNER JOIN reservation
               ON reservation.roomid = room.roomid
ORDER  BY roomnumber;

-- Query Results:
-- # roomnumber	reservationid	baseprice	totalcost
-- 201	4	199.99	199.99
-- 202	7	174.99	349.98
-- 203	2	199.99	999.95
-- 203	21	199.99	399.98
-- 204	16	174.99	184.99
-- 205	15	174.99	699.96
-- 206	12	149.99	599.96
-- 206	23	149.99	449.97
-- 207	10	174.99	174.99
-- 208	13	149.99	599.96
-- 208	20	149.99	149.99
-- 301	9	199.99	799.96
-- 301	24	199.99	599.97
-- 302	6	174.99	924.95
-- 302	25	174.99	699.96
-- 303	18	199.99	199.99
-- 304	14	174.99	184.99
-- 305	3	174.99	349.98
-- 305	19	174.99	349.98
-- 307	5	174.99	524.97
-- 308	1	149.99	299.98
-- 401	11	399.99	1199.97
-- 401	17	399.99	1259.97


-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT reservationid,
       roomnumber,
       maximumoccupancy,
       startdate,
       enddate
FROM   room
       INNER JOIN reservation
               ON reservation.roomid = room.roomid
       INNER JOIN roomtype
               ON roomtype.roomtypeid = room.roomtypeid
WHERE  enddate BETWEEN '2023-04-01' AND '2023-04-30'
       AND maximumoccupancy = '4'
ORDER  BY enddate;

-- Query Results:
-- # reservationid	roomnumber	maximumoccupancy	startdate	enddate
-- 9	301	4	2023-04-09	2023-04-13


-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT firstname,
       lastname,
       Count(lastname) AS reservations_per_guest
FROM   reservation
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
GROUP  BY lastname
HAVING Count(lastname) >= 1
ORDER  BY reservations_per_guest DESC,
          lastname;
          
-- Query Results:
-- # firstname	lastname	reservations_per_guest
-- Mack	Simmer	4
-- Bettyann	Seery	3
-- Duane	Cullison	2
-- Matt	Heerspink	2
-- Walter	Holaway	2
-- Aurore	Lipton	2
-- Maritza	Tilton	2
-- Joleen	Tison	2
-- Wilfred	Vise	2
-- Karie	Yang	2
-- Zachery	Luechtefeld	1


-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT firstname,
       lastname,
       address,
       phone
FROM   guest
WHERE  phone = '(446) 351-6860';  

-- Query Results:
-- # firstname	lastname	address	phone
-- Maritza	Tilton	939 Linda Rd.	(446) 351-6860

