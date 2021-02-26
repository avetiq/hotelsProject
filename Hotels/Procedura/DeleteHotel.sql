CREATE PROCEDURE [dbo].[DeleteHotel]
	@HotelName varchar(50),
	@CityName varchar(50)
AS
	
	DELETE from Hotels
	WHERE ID = (SELECT ID
				FROM Hotels as h
				WHERE h.[Name] = @HotelName AND h.[City] = @CityName)

	
GO
