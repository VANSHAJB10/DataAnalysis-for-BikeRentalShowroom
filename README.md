# DataAnalysis-for-BikeRentalShowroom [SQL]
 <img src = "sql_analysis_readme_img.png">
 <br>
 
## Project Overview

This project is focused on analyzing a dataset from a bike rental shop to provide insights that can help the shop owner, James, grow his business. <br>
Using SQL, various business questions are answered by querying the provided dataset, including customer behavior, bike rental revenue, membership trends, and more.

The dataset consists of different tables 
<ul>
<li>bikes</li> <li> customers</li> <li>rentals</li> <li>memberships</li>. 
</ul>
Each query in this project addresses a specific business problem posed by James, helping him make informed decisions regarding his shop's operations.

<br>

## Dataset Information
The dataset for this project includes the following key tables:

Customer: Contains information about customers, including their unique IDs, names, and email addresses.
Bike: Provides details about the shop's bike inventory, including bike ID, model, category, rental pricing, and status (available, rented, or out of service).
Rental: Captures information about each rental, including the customer who rented the bike, the start time, duration, and total paid for the rental.
Membership: Contains data about memberships purchased by customers, including the membership type and the total amount paid.
Membership Type: Describes the types of memberships available, their descriptions, and prices.

## Problem Statements
This project addresses several key business questions James is interested in. Some of the key analyses include:

<ol>
<li>Bike Availability by Category: How many bikes are available or rented in each category?</li>
<li>Customer Memberships: Which customers have purchased memberships, and how many memberships has each customer purchased?</li>
<li>Bike Pricing: How can rental prices be adjusted with discounts for different categories (e.g., electric bikes, mountain bikes)?</li>
<li>Revenue Analysis: What is the total revenue generated from bike rentals and memberships by month and year?</li>
<li>Customer Segmentation: Group customers based on the number of rentals into different segments (e.g., fewer than 5 rentals, between 5 and 10 rentals).</li>
  
</ol>

## Tools Used
<b>SQL</b>: SQL was used to query and analyze the dataset, leveraging joins, groupings, and aggregate functions to answer the business questions.
<br>
<b>PostgreSQL/MySQL </b>: A SQL database was used to store and query the data.
