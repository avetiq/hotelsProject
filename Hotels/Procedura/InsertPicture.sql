CREATE PROCEDURE [dbo].[InsertPicture]
	@HotelName varchar(50),
	@CityName varchar(50),
	@PicUrl nvarchar(150)
AS

	DECLARE @HoteliD int

	SET @HoteliD = (SELECT ID
					FROM Hotels
					Where [Name] = @HotelName AND [City] = @CityName)

	INSERT INTO Pictures([Hotelid],[Source])
		VALUES (@HoteliD, @PicUrl);
GO
