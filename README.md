# **Analysing Sakila DVD Rentals**
# Project Description

In this project, you will query the **Sakila DVD Rental** database. The Sakila Database holds information about a company that rents movie DVDs. For this project, you will be querying the database to gain an understanding of the customer base, such as what the patterns in movie watching are across different customer groups, how they compare on payment earnings, and how the stores compare in their performance. To assist you in the queries ahead, the schema for the DVD Rental database is provided [here](https://www.postgresqltutorial.com/wp-content/uploads/2018/03/printable-postgresql-sample-database-diagram.pdf).


*(Note: One quirk you may notice as you explore this "fake" database is that the rental dates are all from 2005 and 2006, while the payment dates are all from 2007. Don't worry about this.)*

# Getting Started

## Dependecies
- PostgreSQL version 14
- Microsoft Excel or any other Visualization tool of your choice
- 64 Bit Windows Machine

## Database Description
PostgreSQL Sample Database Tables

There are 15 tables in the DVD Rental database:

**actor** – stores actors data including first name and last name.

**film** – stores film data such as title, release year, length, rating, etc.

**film_actor** – stores the relationships between films and actors.

**category** – stores film’s categories data.

**film_category** - stores the relationships between films and categories.

**store** – contains the store data including manager staff and address.

**inventory** – stores inventory data.

**rental** – stores rental data.

**payment** – stores customer’s payments.

**staff** – stores staff data.

**customer** – stores customer data.

**address** – stores address data for staff and customers

**city** – stores city names.

**country** – stores country names.

# Installing
The Sakila DVD Rental database and other information to help you carry out a successful query can be found [here](http://www.postgresqltutorial.com/postgresql-sample-database/)
# Executing Program
To execute this program, follow the suggested steps.()
- Create a schema with a descriptive name (let's name it Sakila DVD Rental)
- load the Sakila database which you dowmloaded earlier into the schema
# Author
**Opara-Eze Tochi**

@oetochi
# Version History
Version 1.0: Initial Release 
# Licence 
You can freely copy and/or reproduce the code and the visualization in this project.
# Acknowledgements
Worthy of mention is Mr Derek Steer, CEO of [Mode](www.mode.com). He taught me SQL under the **#AdvanceAfricaScholarship**, a partnership between [Access Bank](https://www.accessbankplc.com/) and [Udacity](https://www.udacity.com/).

[**PostgreSQL Tutorial**](https://www.postgresqltutorial.com/postgresql-sample-database/)

# Sample Questions
You can attempt answering these questions to get acquainted with the Sakila database

1. Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out.

1. Provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter) based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories.

1. Write a query that returns the store ID for the store, the year and month and the number of rental orders each store has fulfilled for that month. Your table should include a column for each of the following: year, month, store ID and count of rental orders fulfilled during that month.

1. Can you write a query to capture the customer name, month and year of payment, 
and total payment amount for each month by these top 10 paying customers?
