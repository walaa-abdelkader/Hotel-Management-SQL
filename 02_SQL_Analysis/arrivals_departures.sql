
-- =====================================================
# Arrivals & Departures

--This query identifies guest arrivals and departures for a specific date.

--`UNION ALL` is used to combine check-in and check-out
--activities into one result set while keeping the activity type clearly identified.

-- Arrivals and Departures
-- 23 March 2024
-- =====================================================

SELECT
    b.BookingID,
    b.GuestID,
    b.RoomID,
    b.CheckInDate AS ActivityDate,
    'Arrival' AS ActivityType
FROM Bookings b
WHERE b.CheckInDate = '2024-03-23'

UNION ALL

SELECT
    b.BookingID,
    b.GuestID,
    b.RoomID,
    b.CheckOutDate AS ActivityDate,
    'Departure' AS ActivityType
FROM Bookings b
WHERE b.CheckOutDate = '2024-03-23'

ORDER BY ActivityDate, BookingID;
