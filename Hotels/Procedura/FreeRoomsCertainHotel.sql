CREATE PROCEDURE [dbo].[FreeRoomsCertainHotel]
	@HotelName varchar(50),
	@CityName varchar(50),
	@From datetime,
	@To datetime = null,
	@BedQuantity tinyint
AS
	
	declare @t table(HotelName nchar(20), City nchar(20), Bed tinyint, Room smallint, [Money] money)
	insert @t
	exec SearchST @HotelName, @CityName, @From, null, null

	select Bed,[Money]
	from @t
	group by Bed,[Money]


GO