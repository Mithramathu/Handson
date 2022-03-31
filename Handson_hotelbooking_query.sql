--HotelBooking Solutions
--Easy
--1 give the booking_data and the no of nights for guest 1183
select  booking_date,nights from booking where guest_id=1183
--2 List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival
select arrival_time,first_name,last_name from booking a join guest b on a.guest_id=b.id where booking_date='2016-11-05' order by arrival_time
--3 Give the daily rate that should be paid for bookings with ids 5152,5165,5154 and 5295. INclude booking id,room type,no of occupants and the amount
select booking_id,room_type,occupants,amount from booking a join rate b on a.room_type_requested=b.room_type and a.occupants=b.occupancy where booking_id in(5154,5165,5295,5152)
--4 Find who is staying in room 101 on 2016-12-03, include first name,last name and address
select first_name,last_name, address from booking a join guest b on a.guest_id=b.id where room_no=101 and booking_date='2016-12-03'
--5 For guests 1185 and 1270 show the no of bookings made and the total no of nights. your output should include the guest id and total no of bookings and the total number of nights 
select guest_id,count(nights) "count(nights)",sum(nights)"sum(nights)" from booking where guest_id in(1185,1270) group by guest_id

--Medium
--6 Show the total amount payable bt guest Ruth Cadbury for her room bookings. You should join to the rate table using room_type_requested and occupants
select sum(booking.nights*rate.amount) as sum_nights_amount from booking join rate on(booking.occupants=rate.occupancy and booking.room_type_requested=rate.room_type)
join guest on(guest.id=booking.guest_id) where guest.first_name='Ruth' and guest.last_name='Cadbury'
--7 Calculate the total bill for booking 5346 including extras
select sum(booking.nights*rate.amount)+sum(e.amount) from booking join rate on(booking.occupants=rate.occupancy and booking.room_type_requested=rate.room_type)
join(select booking_id,sum(amount) as amount from extra group by booking_id) as e on(e.booking_id=booking.booking_id) where booking.booking_id=5128
--8 For every guest who has the word "Edinburgh" in their address show the total no of nights booked. Be sure to include 0 for those guests who have never had a booking. Show lastname,
--firstname,address and no of nights. Order by last name then first name.
select guest.last_name,guest.first_name,guest.address,case when sum(booking.nights) is null then 0 else sum(booking.nights) end as nights
from booking right join guest on(guest.id=booking.guest_id) where guest.address like 'Edinburgh%' group by guest.last_name, guest.first_name,guest.address order by guest.last_name,guest.first_name
--9 For each day of the week beginning 2016-11-25 show the no of bookings starting that day. Be sure to show all the days of the week in the correct order
select booking_date asi,count(booking_id) as arrivals from booking where booking_date between '2016-11-25' and '2016-12-01' group by booking_date
--10 Show the no of guests in the hotel on the night of 2016-11-21. Include all occuopants who checked in that day but not those who checked out.
select sum(occupants) from booking where booking_date <= '2016-11-21' and date_add(booking_date,interval nights day) > '2016-11-21'