create database OLA
use OLA

1. Retrieve all successful bookings:

Create View Successful_Bookings AS
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';
select * from Successful_Bookings;

2. Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM bookings 
GROUP BY Vehicle_Type;
select * from ride_distance_for_each_vehicle

ALTER TABLE bookings
ALTER COLUMN Ride_Distance FLOAT;

Select * from ride_distance_for_each_vehicle;

3. Get the total number of cancelled rides by customers:

CREATE VIEW all_cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_rides FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';
select * from all_cancelled_rides_by_customers

4. List the top 5 customers who booked the highest number of rides:

create view Top_5_Customers As
SELECT TOP 5 Customer_ID,
    COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC;

select * from Top_5_Customers

5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Rides_Cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS total_cancelled_rides
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Rides_Cancelled_by_Drivers_P_C_Issues


6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT 
    MIN(CASE 
        WHEN Customer_Rating != 'NA' 
        AND Customer_Rating IS NOT NULL 
        AND ISNUMERIC(Customer_Rating) = 1
        THEN CAST(Customer_Rating AS DECIMAL(10,2)) 
    END) AS Min_Customer_Rating,
    
    MAX(CASE 
        WHEN Customer_Rating != 'NA' 
        AND Customer_Rating IS NOT NULL 
        AND ISNUMERIC(Customer_Rating) = 1
        THEN CAST(Customer_Rating AS DECIMAL(10,2)) 
    END) AS Max_Customer_Rating

FROM Bookings;

7. Retrieve all rides where payment was made using UPI:

Create view UPI_Payment As
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';
Select * from UPI_Payment

8. Find the average customer rating per vehicle type:

Create View AVG_cust_rating AS
SELECT 
    Vehicle_Type,
    AVG(TRY_CAST(Customer_Rating AS DECIMAL(10,2))) AS Avg_Customer_Rating
FROM Bookings
GROUP BY Vehicle_Type;

select * from AVG_cust_rating

9. Calculate the total booking value of rides completed successfully:

Create View Total_Successful_Ride_value As
SELECT 
    SUM(TRY_CAST(Booking_Value AS DECIMAL(10,2))) as total_successful_Ride_value 
FROM bookings 
WHERE Booking_Status = 'Success';

select * from Total_Successful_Ride_value

10. List all incomplete rides along with the reason:

Create View incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides ='Yes';

select * from [dbo].[Bookings][Bookings]

select * from Bookings


1. select * from Successful_Bookings;
2. select * from ride_distance_for_each_vehicle
3. select * from all_cancelled_rides_by_customers
4. select * from Top_5_Customers
5. select * from Rides_Cancelled_by_Drivers_P_C_Issues
6. SELECT 'Min_Customer_Rating' AS Rating_Type, 
        MIN(TRY_CAST(Customer_Rating AS DECIMAL(10,2))) AS Rating_Value
FROM Bookings

UNION ALL

SELECT 'Max_Customer_Rating' AS Rating_Type, 
        MAX(TRY_CAST(Customer_Rating AS DECIMAL(10,2))) AS Rating_Value
FROM Bookings;
7. Select * from UPI_Payment
8. select * from AVG_cust_rating
9. WHERE Booking_Status = 'Success';
10. select * from incomplete_Rides_Reason;