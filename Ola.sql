CREATE DATABASE Ola;
USE Ola;


-- 1. Retrieve all successful bookings:
Create view Successful_Bookings As 
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

Select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW Ride_Distance_for_Each_Vehicle As
SELECT Vehicle_Type , avg(Ride_Distance) As Avg_Distance
from bookings
GROUP BY Vehicle_Type

SELECT * from Ride_Distance_for_Each_Vehicle;



-- 3. Get the total number of canceled rides by customers:
Create view canceled_rides_for_customers as
SELECT COUNT(*) FROM bookings
WHERE Booking_Status ='Canceled by Driver';

select * from canceled_rides_for_customers;



-- 4. List the top 5 customers who booked the highest number of rides
CREATE VIEW Top_5_customer as
SELECT Customer_ID , count(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

Select * from Top_5_customer;





-- 5. Get the number of rides canceled by drivers due to personal and car-related issues:
CREATE view canceled_by_drivers_p_c_issues AS
select count(*) from bookings/
where Canceled_Rides_by_Driver = 'Personal & Car related issue';





-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';


-- 7. Retrieve all rides where payment was made using UP!:-+*
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';


-- 8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating From bookings
GROUP BY Vehicle_Type;



-- 9. Calculate the total booking value of rides completed successfully:
Create view total_successful_ride_value As
Select SUM(Booking_Value) as total_successful_value
FROM bookings 
WHERE Booking_Status = 'Success';



-- 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
Select Booking_ID, Incomplete_Rides_reason
From bookings
Where Incomplete_Rides = 'Yes';

