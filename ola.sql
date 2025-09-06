create database ola;

use ola;
select * from bookings;

-- 1. Retrieve all successful bookings? 
Create View Successful_Bookings As
select * from bookings where booking_status = "success";
-- 1. Retrieve all successful bookings? 
select * from Successful_Bookings;


-- 2. Find the average ride distance for each vehicle type?
Create View  ride_distance_for_each_vehicle As 
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings GROUP BY
Vehicle_Type;

-- 2. Find the average ride distance for each vehicle type?
Select * from ride_distance_for_each_vehicle;


-- 3. Get the total number of cancelled rides by customers:?
create view cancelled_rides_by_customers As
select count(*) from Bookings 
where Booking_Status = 'canceled by customer';

-- 3. Get the total number of cancelled rides by customers:?
select * from cancelled_rides_by_customers;


-- 4. List the top 5 customers who booked the highest number of rides:?
create view top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) 
as total_rides FROM bookings
 GROUP BY Customer_ID 
 ORDER BY total_rides DESC LIMIT 5;
 
 -- 4. List the top 5 customers who booked the highest number of rides:?
select * from top_5_customers;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:?
create view Canceled_Rides_by_Driver As
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:?
select * from Canceled_Rides_by_Driver;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:?
Create view maximum_and_minimum_driver_ratings As
select max(Driver_Ratings) as max_rating ,
 min(Driver_Ratings) as min_rating 
from Bookings
where Vehicle_Type = 'prime sedan';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:?
select * from maximum_and_minimum_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:?
create view upi_payment As
select * from bookings where payment_method = 'upi';

-- 7. Retrieve all rides where payment was made using UPI:?
select * from upi_payment ;


-- 8. Find the average customer rating per vehicle type:?
create view avg_customer_rating_per_vehicle As
select Vehicle_Type ,avg(Customer_Rating) from bookings group by vehicle_type;

-- 8. Find the average customer rating per vehicle type:?
select * from avg_customer_rating_per_vehicle;

-- 9. Calculate the total booking value of rides completed successfully:?
create view sucessful_booking_rides AS
select sum(booking_value) as succesful_rides_value from bookings
where Booking_Status ='success';

-- 9. Calculate the total booking value of rides completed successfully:?
select * from sucessful_booking_rides;

-- 10. List all incomplete rides along with the reason?
create view incomplete_rides as
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides =
'Yes';

-- 10. List all incomplete rides along with the reason?
select * from incomplete_rides;
