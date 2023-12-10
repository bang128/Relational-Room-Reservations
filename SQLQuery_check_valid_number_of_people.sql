CREATE FUNCTION check_valid_number_of_people (
    @RoomID VARCHAR(10),
    @NumberOfPeople INTEGER
) RETURNS BIT
AS BEGIN
IF (@NumberOFPeople <= (
    SELECT   [dbo].[Room].[Capacity]
    FROM     [dbo].[Room]
    WHERE    ( [dbo].[Room].[RoomID] = @RoomID )
)) return 1
return 0
END