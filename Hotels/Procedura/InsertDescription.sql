CREATE PROCEDURE [dbo].[InsertDescription]
	@HotelName varchar(50),
	@CityName varchar(50),
	@ShortDescription nvarchar(600),
	@LongDescription nvarchar(1500)
AS

	DECLARE @HoteliD int
	DECLARE @CountInDesc int
	Set @HoteliD = (SELECT ID FROM Hotels Where [Name] = @HotelName AND [City] = @CityName)
	SET @CountInDesc = isnull((SELECT COUNT(*) FROM Descriptionn WHERE Hotelid = @HoteliD),0)

	IF @CountInDesc = 1
	BEGIN
		RAISERROR ( 'Whoops, Such Hotel Description already Exsists',18,1)		
	END
	ELSE
	BEGIN
		INSERT INTO Descriptionn([Short],[Long],[Hotelid])
			VALUES (@ShortDescription, @LongDescription, @HoteliD);
	END
 
GO
