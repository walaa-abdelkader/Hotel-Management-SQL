# 🏨 Hotel Management Database & Analytics

## 📌 Project Overview

This project focuses on designing and analyzing a hotel management database using **SQL Server**.

The project covers database design, normalization, SQL analysis, database programmability, performance optimization, and integration with **Power BI** to create an interactive hotel room occupancy dashboard.

---

## 🎯 Project Objectives

* Design a structured hotel management database.
* Apply database normalization principles.
* Analyze hotel bookings, revenue, guests, and room occupancy.
* Develop SQL Views, Stored Procedures, Functions, and Transactions.
* Improve database performance using indexes.
* Connect SQL Server to Power BI for interactive reporting.

---

# 1️⃣ Database Design

The database was designed to manage key hotel operations, including:

* Hotels
* Room Types
* Rooms
* Guests
* Bookings
* Payments
* Services
* Booking Services
* Employees
* Reviews

### Database Relationships

The database includes relationships between hotels, rooms, bookings, guests, payments, services, and employees.

### Normalization

The database design follows normalization principles up to **Third Normal Form (3NF)** to reduce data redundancy and improve data integrity.

Key examples include:

* **1NF:** Booking services are stored as individual records in `BookingServices`.
* **2NF:** Service details depend on `ServiceID`, while booking-specific quantities are stored in `BookingServices`.
* **3NF:** Hotel information is stored in the `Hotels` table instead of being repeated across related tables.
### Entity Relationship Diagram
![Uploading Screenshot 2026-09-29 233952.png…]()

---

# 2️⃣ SQL Analysis

Several SQL queries were developed to analyze hotel operations and business performance.

### Revenue by Hotel

Calculates total revenue by hotel for a selected period.

### Loyal Guests

Identifies guests with multiple bookings based on their loyalty tier and booking history.

### Arrivals & Departures

Identifies guests arriving and departing on a specific date.

### Average Stay & Revenue

Analyzes average length of stay and average revenue by hotel and room type.

---

# 3️⃣ SQL Programmability

The project also includes advanced SQL Server features for database operations and business logic.

### Views

Created SQL Views to simplify reporting and provide reusable datasets for analysis.

### Stored Procedures

Developed a stored procedure for guest check-in, including validation, room availability checks, and transaction handling.

### Functions

Created a table-valued function to calculate room booking costs based on room and booking dates.

### Transactions & Error Handling

Used transactions with `TRY...CATCH`, `COMMIT`, and `ROLLBACK` to maintain data consistency and safely handle failed operations.

---

# 4️⃣ Performance Optimization

Indexes were created to improve query performance and optimize access to frequently queried data.

The optimization focused on columns commonly used for:

* Searching
* Filtering
* Joining tables
* Date-based analysis

---

# 5️⃣ Power BI Dashboard

The SQL Server database was connected to **Power BI** to create an interactive hotel room occupancy dashboard.

The dashboard provides an overview of room availability and current occupancy status.

### Dashboard Includes

* **Total Rooms**
* **Available Rooms**
* **Occupied Rooms**
* **Room Status Details**
* **Room Number**
* **Room Status**
* **Room Occupancy**

The dashboard uses SQL Server data and views as the data source for reporting and visualization.

### Dashboard Preview

![Hotel Management Dashboard](05_PowerBI_Dashboard/dashboard.png)

---

## 🛠️ Tools & Technologies

* **SQL Server**
* **T-SQL**
* **Power BI**
* **Database Design**
* **Data Analysis**

---

## 📂 Project Structure

```text
01_Database_Design/
02_SQL_Analysis/
03_SQL_Programmability/
04_Performance/
05_PowerBI_Dashboard/
```

---

## 💡 Key Skills Demonstrated

* Relational Database Design
* Database Normalization
* SQL Querying
* Data Analysis
* Views
* Stored Procedures
* Functions
* Transactions
* Error Handling
* Indexing
* SQL Server & Power BI Integration
* Data Visualization
