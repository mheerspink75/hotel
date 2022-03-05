use hoteldb;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT `name`,
       roomnumber,
       startdate,
       enddate
FROM   reservation
       INNER JOIN room
               ON room.roomid = reservation.reservationid
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
WHERE  enddate BETWEEN '2023-07-01' AND '2023-07-31'; 

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT `name`,
       roomnumber,
       startdate,
       enddate,
       jacuzzi
FROM   reservation
       INNER JOIN amenity
               ON amenity.roomid = reservation.roomid
       INNER JOIN room
               ON room.roomid = reservation.reservationid
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
WHERE  jacuzzi = 'TRUE'; 

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT `name`,
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
WHERE  `name` = 'Mack Simmer';

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT roomnumber,
       reservationid,
       baseprice,
       totalcost
FROM   room
       INNER JOIN roomtype
               ON roomtype.roomtypeid = room.roomid
       INNER JOIN reservation
               ON reservation.roomid = room.roomid
ORDER  BY roomnumber; 

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

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

SELECT `name`,
       Count(`name`) AS reservations_per_guest
FROM   reservation
       INNER JOIN guest
               ON guest.guestid = reservation.guestid
GROUP  BY `name`
HAVING Count(`name`) > 0
ORDER  BY reservations_per_guest DESC;

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT `name`,
       address,
       phone
FROM   guest
WHERE  phone = '(446) 351-6860';  