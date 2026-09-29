-- =====================================================
-- Performance Optimization
-- Indexes
-- =====================================================

-- Booking date is frequently used for filtering
CREATE INDEX IX_Bookings_BookingDate
ON Bookings (BookingDate);


-- Check-in and check-out dates are frequently
-- used for occupancy and arrival/departure analysis
CREATE INDEX IX_Bookings_CheckInDate
ON Bookings (CheckInDate);

CREATE INDEX IX_Bookings_CheckOutDate
ON Bookings (CheckOutDate);


-- RoomID is frequently used when joining
-- bookings with rooms
CREATE INDEX IX_Bookings_RoomID
ON Bookings (RoomID);


-- BookingID is frequently used when retrieving payments
CREATE INDEX IX_Payments_BookingID
ON Payments (BookingID);


-- GuestID is frequently used when analyzing
-- guest booking history
CREATE INDEX IX_Bookings_GuestID
ON Bookings (GuestID);


---# Performance Optimization

--Indexes were created on frequently queried columns to improve data retrieval and query performance.

--The indexes support common operations such as:

-- Date filtering
-- Booking analysis
-- Room occupancy checks
-- Guest booking history
-- Payment lookups
-- Table joins
