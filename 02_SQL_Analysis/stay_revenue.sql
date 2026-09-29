-- =====================================================
-- Average Length of Stay and Revenue
-- by Hotel and Room Type

# Stay Duration & Revenue

--This query analyzes completed hotel stays by calculating:

-- Average length of stay
-- Average revenue per stay

--The results are grouped by hotel and room type.
-- =====================================================

SELECT
    h.HotelName,
    rt.TypeName AS RoomType,
    AVG(DATEDIFF(DAY, b.CheckInDate, b.CheckOutDate))
        AS AvgLengthOfStay,
    AVG(PaymentTotals.TotalRevenue)
        AS AvgRevenuePerStay
FROM Hotels h
JOIN Rooms r
    ON h.HotelID = r.HotelID
JOIN RoomTypes rt
    ON r.RoomTypeID = rt.RoomTypeID
JOIN Bookings b
    ON r.RoomID = b.RoomID
JOIN (
    SELECT
        BookingID,
        SUM(Amount) AS TotalRevenue
    FROM Payments
    WHERE Status = 'Completed'
    GROUP BY BookingID
) PaymentTotals
    ON b.BookingID = PaymentTotals.BookingID
WHERE b.Status = 'Checked-Out'
GROUP BY
    h.HotelName,
    rt.TypeName
ORDER BY
    h.HotelName,
    AvgRevenuePerStay DESC;
