# Power BI Dashboard

The SQL Server hotel management database was connected to Power BI to create an interactive hotel room occupancy dashboard.

## Dashboard Purpose

The dashboard provides an overview of the current room inventory and occupancy status.

## Key Metrics

### Total Rooms
Displays the total number of rooms in the hotel database.

### Available Rooms
Shows the number of rooms currently available.

### Occupied Rooms
Shows the number of rooms currently occupied based on active bookings.

### Room Status Details

The dashboard provides detailed room-level information, including:

- Room Number
- Room Status
- Room Occupancy

## SQL Server Integration

The dashboard uses SQL Server data as its data source.<img width="1928" height="1190" alt="Screenshot 2026-09-30 001341" src="https://github.com/user-attachments/assets/98bdacd5-f3dd-4228-955b-bc3211c71693" />


The `vw_CurrentOccupancy` SQL View was used to provide room occupancy information for Power BI.

This integration demonstrates the connection between database development and business intelligence reporting.
