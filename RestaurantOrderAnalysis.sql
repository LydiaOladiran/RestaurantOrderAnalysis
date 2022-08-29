select * from dbo.Orders_Data

--Checking for NULL values in the Datasets

select Customer_name 
from Orders_Data 
where Customer_Name is null

select Restaurant_ID 
from Orders_Data 
where Restaurant_ID is null

select Quantity_of_Items 
from Orders_Data 
where Quantity_of_Items is null

select Order_Amount 
from Orders_Data 
where Order_Amount is null

select Payment_Mode 
from Orders_Data 
where Payment_Mode is null

select Delivery_Time_Taken_mins
from Orders_Data 
where Delivery_Time_Taken_mins is null

select Customer_Rating_food 
from Orders_Data 
where Customer_Rating_food is null

select Customer_Rating_delivery 
from Orders_Data 
where Customer_Rating_delivery is null

select * from Restaurants_Details
--Also checked for NULL enteries in the second table
select RestaurantName 
from Restaurants_Details 
where RestaurantName is null

select Cuisine 
from Restaurants_Details 
where Cuisine is null

select Zone 
from Restaurants_Details 
where Zone is null

select Category 
from Restaurants_Details 
where Category is null

-- Splited the Order_Date column in the Orders_Data in order to have the order time in a seperate column
alter table Orders_Data
add Reset_Order_Date Date
update Orders_Data 
set Reset_Order_Date = CONVERT(Date, Order_Date)
alter table Orders_Data
add Order_Time Time
update Orders_Data 
set Order_Time = CONVERT(Time, Order_Date, 120)

--Deleted the existing Order_Date column since i now have the date and time in a seperate columns
alter table Orders_Data 
drop column Order_Date

select * from Orders_Data

--Summarized the datasets using aggregate functions
select avg(Customer_Rating_food) as 'Average Customer Rating' 
from Orders_Data
select sum(Quantity_of_items) as 'Total Items Sold' 
from Orders_Data
select sum(Order_Amount) as 'Total Orders' 
from Orders_Data
select avg(Delivery_Time_Taken_mins)as 'Average Delivery Time' 
from Orders_Data

--Joining the Orders_Data and Restaurants_Details table
select * 
from Orders_Data od
inner join Restaurants_Details rd
on od.Restaurant_ID = rd.RestaurantID

--Created a CTE for the joined tables for easier referencing

--INSIGHTS INTO THE CLEAN DATASET
--Number of Customers per Zone
with Merged_Table as
(select RestaurantName,
        Cuisine,
		Zone, 
        Category, 
		        Payment_Mode,
		        Customer_Name, 
		        Order_Amount, 
		        Quantity_of_Items, 
		        Delivery_Time_Taken_mins
  from Orders_Data od
  inner join Restaurants_Details rd
  on od.Restaurant_ID = rd.RestaurantID)
select COUNT(distinct(Customer_Name)) as 'Total Customers', 
Zone 
from Merged_Table
group by Zone
order by COUNT(distinct(Customer_Name)) desc

--Top 5 restaurants with the highest orders
with Merged_Table as
(select 
       RestaurantName, 
	   Cuisine, 
	   Zone, 
	   Category, 
	   Payment_Mode,
	   Customer_Name, 
	   Order_Amount, 
	   Quantity_of_Items, 
	   Delivery_Time_Taken_mins
from Orders_Data od
inner join Restaurants_Details rd
on od.Restaurant_ID = rd.RestaurantID)
select top 5 sum(Order_Amount) as 'Total Orders', 
      RestaurantName
from  Merged_Table
group by RestaurantName
order by SUM(Order_Amount) desc

--To know the most used mode of payment
with Mode_Of_Payment as 
(Select Payment_Mode,
case 
when Payment_Mode = 'Debit Card' then 'Card'
when Payment_Mode = 'Credit Card' then 'Card'
else 'Cash'
end as Mode_of_Payment
from Orders_Data)
select count(Mode_of_Payment) as 'Quantity', 
Mode_of_Payment 
from Mode_Of_Payment
group by Mode_of_Payment
order by count(Mode_of_Payment) desc

--The most ordered cuisine which shows customers preference
with Merged_Table as
(select RestaurantName, Cuisine, Zone, Category, Payment_Mode,Customer_Name, Order_Amount, Quantity_of_Items, Delivery_Time_Taken_mins
from Orders_Data od
inner join Restaurants_Details rd
on od.Restaurant_ID = rd.RestaurantID)
select top 5 sum(Order_Amount) as 'Total Orders', 
             Cuisine 
from Merged_Table
group by Cuisine
order by sum(Order_Amount) desc

--Rate of order by time of day
with TOD as 
(select 
case
when Order_Time between '12:00:00' and '17:59:00' then 'Afternoon'
when Order_Time between '18:00:00' and '23:59:00' then 'Night'
else 'Morning'
end as 'Time_of_Day'
from Orders_Data)
select Time_of_Day, count(Time_of_Day) as 'Orders by time of day' 
from TOD
group by Time_of_Day
order by count(Time_of_Day) desc

--Top 5 customers with the most orders
with Merged_Table as
(select 
       RestaurantName,
	   Cuisine, 
	   Zone, 
	   Category, 
	   Payment_Mode,
	   Customer_Name, 
	   Order_Amount, 
	   Quantity_of_Items, 
	   Delivery_Time_Taken_mins
from Orders_Data od
inner join Restaurants_Details rd
on od.Restaurant_ID = rd.RestaurantID)
select top 5 sum(Order_Amount) as 'Total Orders', 
Customer_Name 
from Merged_Table
group by Customer_Name
order by SUM(Order_Amount) desc


--Total orders for each zone
with Merged_Table as
(select 
       RestaurantName, 
	   Cuisine, 
	   Zone, 
	   Category, 
	   Payment_Mode,
	   Customer_Name, 
	   Order_Amount, 
	   Quantity_of_Items, 
	   Delivery_Time_Taken_mins
from Orders_Data od
inner join Restaurants_Details rd
on od.Restaurant_ID = rd.RestaurantID)
select Sum(Order_Amount) as 'Total Orders',
Zone 
from Merged_Table
group by Zone
order by Sum(Order_Amount) desc

