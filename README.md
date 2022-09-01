# RestaurantOrderAnalysis
I performed an Exploratory Data Analysis on a restaurant Order Dataset using SQL. The dataset was downloaded from Kaggle in .xlsx file format, it was then coverted into a .csv file and imported into Microsoft SQL Server Managemet Studio.
This dataset has details of orders placed by customers to the restaurants in a food delivery app. There are 500 orders that were placed on a day. 

## In this analysis i answered the following questions

1) What is the average customer rating 
2) What is the total number of items sold?
3) What is the total amount of orders?
4) What is the average delivery time?
5) What is the number of customer per zone?
6) Which restaurant received the most orders?
7) What is the most used mode of payment?
8) Which is the most liked cuisine?
9) When do customers order more in a day? 
10) Which customer ordered the most?
11) What is the total order for each zone?

# Creating Database

From within Microsoft SQL Server Managemet Studio, i created a new database with the name "RestaurantOrderAnalysis"
![Database](https://user-images.githubusercontent.com/107180803/188012164-f70f6d52-9fb3-40f0-ac5d-82a992fb9ff2.jpg)

# Importing the Dataset

There are two files, one that contains the Orders Data and another that contained the Restaurant Details. I imported each .csv file into the database
![Import](https://user-images.githubusercontent.com/107180803/188013094-c80a4a66-31fb-443f-8416-bf036e8ddc4e.jpg)

# Data Validation

Using the 'WHERE' clause, i checked for Null values in each of the columns for both tables

![Null ](https://user-images.githubusercontent.com/107180803/188016047-62f70e80-957b-46b9-bf35-1a0c17a599cc.jpg)

Fortunately, there are no NULL values in the data.

# Data Cleaning

 The data is clean already, but i needed to effect a change to the 'Date' column of the Orders Data. The date format was Date/Time, so i splited the column into two to extract the time column in order to effectively answer one of the questions i had in mind
 
 ![Date](https://user-images.githubusercontent.com/107180803/188017824-17e9d70c-5c3f-417d-becf-9929dc57d799.jpg)
 
 ![Reset](https://user-images.githubusercontent.com/107180803/188017857-e95c31f3-e788-4aed-a955-8b3c371043fa.jpg)
 
 # Basic Calculations
 
 Using aggregate functions, I answered the first four questions on my list
 
 1) What is the average customer rating 
2) What is the total number of items sold?
3) What is the total amount of orders?
4) What is the average delivery time?

![Aggregate](https://user-images.githubusercontent.com/107180803/188018866-64db980f-f637-45da-a2c4-cb798e6f1827.jpg)

# Table Joining

As earlier mentioned, we have two tables (Orders Data and Restaurant Details), I joined the two tables together

![join](https://user-images.githubusercontent.com/107180803/188019292-d6cea501-bd98-4488-9e5c-1b2dc303b869.jpg)

# INSIGHTS INTO THE CLEAN DATA

To answer the remaining questions on my list, I created a Common Table Expression (CTE).

CTE is a temporary named result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.

#  What is the number of customer per zone?

![Q5](https://user-images.githubusercontent.com/107180803/188020675-bab6d260-bb1b-4ef5-bfaf-351d472864ab.jpg)
Zone B and Zone D has the same number of customers but the four zones all have the number of customers in the same range

# Which restaurant received the most orders?

To answer this, I took a sum of the order amount and grouped it by the restaurant name.

![Q6](https://user-images.githubusercontent.com/107180803/188021254-17c042ce-d60c-493f-9874-b16174d7d5c3.jpg)

The Veer Restaurant had the highest order

 # What is the most used mode of payment?
 
 ![Q7](https://user-images.githubusercontent.com/107180803/188021948-86090d0f-4510-42e5-af04-476e5496fc77.jpg)
 
 We had more customers that paid with cards
 
 #  Which is the most liked cuisine?
 
 ![Q8](https://user-images.githubusercontent.com/107180803/188022652-6ac38aa2-9e81-4141-9fe6-374cf472eb25.jpg)
 
 The result shows that the most preferred cuisine is the North Indian cuisine
 
 # When do customers order more in a day? 
 
 ![Q9](https://user-images.githubusercontent.com/107180803/188023126-2d13af1a-2238-4fce-b22e-32517ad78e50.jpg)
 
 The highest number of orders were made in the afternoon
 
 # Which customer ordered the most?
 
 ![image](https://user-images.githubusercontent.com/107180803/188023648-78411dc5-cf76-4231-ad3d-f8e589889f52.png)
 
 Srini is the Gold Customer, with the highest number of orders
 
 # What is the total order for each zone?
 
 ![Q11](https://user-images.githubusercontent.com/107180803/188023923-428919c2-a428-4df6-a5bc-b71dfd50b1ec.jpg)
 
 Zone D has the highest number of orders
 
 

 













 





