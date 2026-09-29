-- # Revenue by Hotel
--
-- This query calculates the total payment revenue generated
-- by each hotel for bookings created in 2024.
--
-- It joins Hotels, Rooms, Bookings, and Payments to connect
-- hotel information with booking and payment data.
--
-- Only confirmed and checked-out bookings are included.
--
-- =====================================================
-- Total Revenue by Hotel - 2024
-- =====================================================

SELECT
    h.HotelName,
    SUM(p.Amount) AS TotalRevenue
FROM Hotels h
JOIN Rooms r
    ON h.HotelID = r.HotelID
JOIN Bookings b
    ON r.RoomID = b.RoomID
JOIN Payments p
    ON b.BookingID = p.BookingID
WHERE YEAR(b.BookingDate) = 2024
  AND b.Status IN ('Confirmed', 'Checked-Out')
GROUP BY h.HotelName
ORDER BY TotalRevenue DESC;
