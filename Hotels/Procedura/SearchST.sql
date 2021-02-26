CREATE PROCEDURE [dbo].[SearchST]
	@HotelName varchar(50),
	@CityName varchar(50),
	@From datetime,
	@To datetime = null,
	@BedQuantity tinyint
AS

	SET @BedQuantity = nullif(@BedQuantity ,0)

	IF LEN(@CityName) = 0
	BEGIN
	SET @CityName = null
	END

	IF LEN(@HotelName)= 0
	BEGIN
	SET @HotelName = null
	END
	
	

	select t1.[Name] as HotelName, t1.City as CityName , t2.BedQuantity as Bed, t2.RoomNumber, t2.[Money]
	from Hotels as t1
	join HotelsRoomsInfo as t2
	ON t1.ID = t2.HotelId
	where t2.ID IN (
						select h3.ID
						from Hotels as h4
						join HotelsRoomsInfo as h3
						on h4.ID = h3.HotelId
						where h4.[Name] = isnull(@HotelName,h4.[Name]) and h4.City = isnull(@CityName,h4.City)
											and h3.BedQuantity = isnull(@BedQuantity,h3.BedQuantity)
						EXCEPT
						(
						select h2.ID as reservedRoomsIds
						from Hotels as h1
						join HotelsRoomsInfo as h2
						on h1.ID = h2.HotelId
						join booked as b
						on b.HotelidRoom = h2.ID
						where (@To IS NOT NULL AND h1.[Name] = isnull(@HotelName,h1.[Name]) and h1.City = isnull(@CityName,h1.City) and
								h2.BedQuantity = isnull(@BedQuantity,h2.BedQuantity) and 
								(
											(@From <= b.[From] and  @To > b.[From])
											OR (@From >= b.[From] and @From < b.[To])
								)
							)
							OR
							( @To IS NULL AND
							h1.[Name] = isnull(@HotelName,h1.[Name]) and h1.City = isnull(@CityName,h1.City) and
											h2.BedQuantity = isnull(@BedQuantity,h2.BedQuantity) and 
											(
														(@From <= b.[From])
														OR (@From >= b.[From] and @From < b.[To])
											)
								)
						group by h2.ID
						)
					)
		--group by t1.[Name], t1.City, t2.BedQuantity, t2.[Money]									


GO
