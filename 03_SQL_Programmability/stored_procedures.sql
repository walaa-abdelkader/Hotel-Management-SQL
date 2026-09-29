-- =====================================================
-- Guest Check-In Stored Procedure
--# Stored Procedure – Guest Check-In

`--sp_CheckInGuest` automates the guest check-in process.

---The procedure:

1. Validates the booking.
2. Checks whether the booking is confirmed.
3. Checks room availability.
4. Updates the booking status to `Checked-In`.
5. Updates the room status to `Occupied`.
6. Uses a transaction to ensure that all changes succeed together.

--If an error occurs, the transaction is rolled back.
-- =====================================================

CREATE OR ALTER PROCEDURE sp_CheckInGuest
    @BookingID INT
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE @RoomID INT;

        -- Get the room associated with the booking
        SELECT @RoomID = RoomID
        FROM Bookings
        WHERE BookingID = @BookingID
          AND Status = 'Confirmed';

        -- Validate booking
        IF @RoomID IS NULL
        BEGIN
            THROW 50001, 'Booking does not exist or is not confirmed.', 1;
        END;

        -- Check room availability
        IF EXISTS (
            SELECT 1
            FROM Rooms
            WHERE RoomID = @RoomID
              AND Status <> 'Available'
        )
        BEGIN
            THROW 50002, 'Room is not available for check-in.', 1;
        END;

        -- Update booking status
        UPDATE Bookings
        SET Status = 'Checked-In'
        WHERE BookingID = @BookingID;

        -- Update room status
        UPDATE Rooms
        SET Status = 'Occupied'
        WHERE RoomID = @RoomID;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;

    END CATCH;

END;
GO
