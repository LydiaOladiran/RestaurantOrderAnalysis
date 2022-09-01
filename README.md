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


