create database UBER;
use  UBER;
Select * from bookings;
-- -------------------------------------------------------------------------------------------------------- 
-- -------------------------------------------------------------------------------------------------------- 

-- 1. Retrieve all successful bookings:
Create View Successfull_Bookings as 
Select * from bookings
where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as
Select Vehicle_Type , AVG(Ride_Distance) as avg_distance from bookings
group by Vehicle_Type; 

-- 3. Get the total number of cancelled rides by customers:
create View  cancelled_rides_by_customers as
Select count(*)  as  cancelled_rides_by_customers  from bookings
where booking_status = 'Canceled by Customer';


-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
Select Customer_ID, count(Booking_ID) as total_rides from bookings
group by Customer_ID 
order by total_rides desc 
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_rides_by_driver_P_C_Isues as
Select count(*)  as  cancelled_rides_by_drivers  from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue' ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view MAX_MIN_Rating as 
Select MAX(Driver_Ratings) as max_rating , MIN(Driver_Ratings) as min_rating from bookings
where Vehicle_Type ='Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view Payment_By_UPI as
Select * from bookings
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
create view average_customer_rating_per_V as 
Select Vehicle_Type  , AVG(Customer_Rating) as Avg_rating from bookings
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_rides_completed_successfully as 
Select SUM(Booking_Value) as total_successfull_value from bookings 
where Booking_Status = 'Success' ;

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
Select Booking_ID ,  Incomplete_Rides_Reason  from bookings
where  Incomplete_Rides = 'Yes' ;




-- -------------------------------------------------------------------------------------------------------- 
-- -------------------------------------------------------------------------------------------------------- 

-- 1. Retrieve all successful bookings:
Select * from Successfull_Bookings;

-- 2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
Select * from  cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
Select * from  top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from  cancelled_rides_by_driver_P_C_Isues; 

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from  MAX_MIN_Rating ;

-- 7. Retrieve all rides where payment was made using UPI:
Select * from  Payment_By_UPI ;

-- 8. Find the average customer rating per vehicle type:
Select * from average_customer_rating_per_V ;

-- 9. Calculate the total booking value of rides completed successfully:
Select * from total_rides_completed_successfully ; 

-- 10. List all incomplete rides along with the reason:
Select * from  incomplete_rides_reason ;

