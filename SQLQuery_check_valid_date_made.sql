CREATE FUNCTION check_valid_date_made (
    @old VARCHAR(10), 
    @new VARCHAR(10)
) RETURNS BIT
AS BEGIN
IF ((SELECT   [dbo].[Reservation].[DateMade]
FROM     [dbo].[Reservation]
WHERE    ( [dbo].[Reservation].[ReservationID] = @old )) <= (SELECT   [dbo].[Reservation].[DateMade]
FROM     [dbo].[Reservation]
WHERE    ( [dbo].[Reservation].[ReservationID] = @new ))) return 1
return 0
END