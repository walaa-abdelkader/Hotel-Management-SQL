-- =====================================================
-- Current Room Occupancy View
--This view provides the current room status and occupancy information.

--It returns:

-- Room ID
-- Room Number
-- Hotel ID
-- Room Status
--Room Occupancy

--The view checks active bookings based on the current date.
--It was also used as a data source for the Power BI room occupancy dashboard.
-- =====================================================

CREATE OR ALTER VIEW vw_CurrentOccupancy
AS
SELECT
    r.RoomID,
    r.RoomNumber,
    r.HotelID,
    r.Status AS RoomStatus,

    CASE
        WHEN EXISTS (
            SELECT 1
            FROM Bookings b
            WHERE b.RoomID = r.RoomID
              AND b.CheckInDate <= CAST(GETDATE() AS DATE)
              AND b.CheckOutDate > CAST(GETDATE() AS DATE)
              AND b.Status IN ('Confirmed', 'Checked-In')
        )
        THEN 'Occupied'
        ELSE 'Available'
    END AS RoomOccupancy

FROM Rooms r;
GO
