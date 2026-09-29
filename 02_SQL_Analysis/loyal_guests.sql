--Loyal Guests
--This query identifies guests who made at least three 
--bookings within the last 12 months of the latest booking date in the database.

--The analysis also considers the guest loyalty tier.-- Loyal Guests
-- Guests with at least 3 bookings
-- within the last 12 months
-- =====================================================

SELECT
    G.LoyaltyTier,
    G.GuestID,
    COUNT(B.GuestID) AS BookingCount
FROM Bookings B
JOIN Guests G
    ON B.GuestID = G.GuestID
WHERE B.BookingDate >= DATEADD(
        MONTH,
        -12,
        (SELECT MAX(BookingDate) FROM Bookings)
      )
  AND G.LoyaltyTier IN ('None', 'Silver')
GROUP BY
    G.LoyaltyTier,
    G.GuestID
HAVING COUNT(B.GuestID) >= 3
ORDER BY BookingCount DESC;
