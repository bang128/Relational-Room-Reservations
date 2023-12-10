UPDATE RoomItem
SET Charge = Quantity * (
   SELECT [dbo].[Item].[Price]
   FROM [dbo].[Item]
   WHERE [dbo].[Item].[ItemID] = [dbo].[RoomItem].[ItemID]);

UPDATE Room
SET TotalItemCharge = (
    SELECT SUM([dbo].[RoomItem].[Charge])
    FROM [dbo].[RoomItem]
    WHERE [dbo].[RoomItem].[RoomID] = [dbo].[Room].[RoomID]);

UPDATE ReservationItem
SET Charge = Quantity * (
   SELECT [dbo].[Item].[Price]
   FROM [dbo].[Item]
   WHERE [dbo].[Item].[ItemID] = [dbo].[ReservationItem].[ItemID]);

UPDATE Reservation
SET TotalItemCharge = (
    SELECT SUM([dbo].[ReservationItem].[Charge])
    FROM [dbo].[ReservationItem]
    WHERE [dbo].[ReservationItem].[ReservationID] = [dbo].[Reservation].[ReservationID]);

UPDATE Reservation
SET TotalItemCharge = 0
WHERE TotalItemCharge IS NULL;

UPDATE Reservation
SET TotalBilled = TotalItemCharge + (
    SELECT [dbo].[Room].[RoomCharge]
    FROM [dbo].[Room]
    WHERE [dbo].[Room].[RoomID] = [dbo].[Reservation].[RoomID]);

UPDATE Reservation
SET EID = (
    SELECT [dbo].[Proxy].[ManagerID]
    FROM [dbo].[Proxy]
    WHERE [dbo].[Proxy].[ProxyID] = [dbo].[Reservation].[ProxyID]
)
WHERE ProxyID IS NOT NULL;

/* All OldReservations are initially invalid to be replaced */
UPDATE ReplacedReservation
SET ReplaceFlag = 'Invalid';

/* Update the replacement to valid after checking the each Person's priority */
UPDATE ReplacedReservation
SET ReplaceFlag = 'Valid'
WHERE dbo.check_to_replace_reservation(OldReservation, NewReservation) = 1;

/* All reservations are initially active */
UPDATE Reservation
SET Flag = 'Active'
WHERE Flag IS NULL;

/* Replace the OldReservation by the NewReservation if the old ID in the ReplacedReservation table and the ReplaceFlag is valid */
UPDATE Reservation
SET Flag = 'Replaced'
WHERE ReservationID IN (
    SELECT [dbo].[ReplacedReservation].[OldReservation]
    FROM [dbo].[ReplacedReservation]
    WHERE [dbo].[ReplacedReservation].[ReplaceFlag] = 'Valid'
);

/* Set invalid if the new-entered reservation cannot replace the old one*/
UPDATE Reservation
SET Flag = 'Invalid'
WHERE ReservationID IN (
    SELECT [dbo].[ReplacedReservation].[NewReservation]
    FROM [dbo].[ReplacedReservation]
    WHERE [dbo].[ReplacedReservation].[ReplaceFlag] = 'Invalid'
);

/* Revert the OldReservation (replaced reservation) back to active if the NewReservation has been canceled*/
UPDATE Reservation
SET Flag = 'Active'
WHERE ReservationID IN (
    SELECT   [dbo].[ReplacedReservation].[OldReservation]
    FROM     [dbo].[Reservation] 
    INNER JOIN [dbo].[ReplacedReservation]  ON [dbo].[Reservation].[ReservationID] = [dbo].[ReplacedReservation].[NewReservation] 
    WHERE    ( [dbo].[Reservation].[Flag] = 'Canceled')
);

