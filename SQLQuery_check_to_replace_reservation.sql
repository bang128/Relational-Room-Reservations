CREATE FUNCTION check_to_replace_reservation (
    @ReservationID VARCHAR(10),
    @ReplacingReservation VARCHAR(10)
) RETURNS BIT
AS BEGIN
IF ((SELECT   [dbo].[People].[PriorityLevel]
FROM     [dbo].[People] 
INNER JOIN [dbo].[Reservation]  ON [dbo].[People].[EID] = [dbo].[Reservation].[EID]
WHERE  [dbo].[Reservation].[ReservationID] = @ReplacingReservation) > (SELECT   [dbo].[People].[PriorityLevel]
FROM     [dbo].[People] 
INNER JOIN [dbo].[Reservation]  ON [dbo].[People].[EID] = [dbo].[Reservation].[EID]
WHERE  [dbo].[Reservation].[ReservationID] = @ReservationID))
return 1
return 0
END