# Complex SQL Queries with Joins

This project focuses on mastering SQL joins by writing complex queries using different types of joins.

## Objectives

- Practice writing queries with INNER JOIN, LEFT JOIN, and FULL OUTER JOIN
- Understand how to retrieve related data from multiple tables
- Handle cases where data might be missing in joined tables

## Tasks

The project contains SQL queries in `joins_queries.sql` that demonstrate different join operations:

1. **INNER JOIN Query**: Retrieves all bookings along with the respective users who made those bookings.
2. **LEFT JOIN Query**: Retrieves all properties and their reviews, including properties that have no reviews.
3. **FULL OUTER JOIN Query**: Retrieves all users and all bookings, showing records even if a user has no booking or a booking isn't linked to a user.

## File Structure

- `joins_queries.sql`: Contains all the SQL queries demonstrating different join operations

## Database Context

The queries are designed to work with an Airbnb-like database that contains tables for:

- Users
- Properties
- Bookings
- Reviews
