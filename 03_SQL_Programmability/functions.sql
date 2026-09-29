-- =====================================================
-- Room Booking Cost Function
--`fn_RoomBookingCost` is a table-valued function used to 
  --retrieve completed booking information for a specific room and date range.

--The function calculates:

-- Number of nights
-- Total paid amount

--It filters the results to completed and checked-out bookings.
-- =====================================================

CREATE OR ALTER FUNCTION fn_RoomBookingCost
(
    @RoomID INT,
    @StartDate DATE,
    @EndDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        b.BookingID,
        b.RoomID,
        b.CheckInDate,
        b.CheckOutDate,

        DATEDIFF(
            DAY,
            b.CheckInDate,
            b.CheckOutDate
        ) AS Nights,

        SUM(p.Amount) AS TotalPaid

    FROM Bookings b
    JOIN Payments p
        ON b.BookingID = p.BookingID

    WHERE b.RoomID = @RoomID
      AND b.CheckInDate >= @StartDate
      AND b.CheckOutDate <= @EndDate
      AND b.Status = 'Checked-Out'
      AND p.Status = 'Completed'

    GROUP BY
        b.BookingID,
        b.RoomID,
        b.CheckInDate,
        b.CheckOutDate
);
GO
