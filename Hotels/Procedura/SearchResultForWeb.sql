CREATE PROCEDURE [dbo].[SearchResultForWeb]
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
	


	SELECT *
	FROM   (
			SELECT  res1.ID as HOTELID, res1.[Name], res1.City, res2.[Source], res3.Short, res3.Long,
							ROW_NUMBER() OVER(PARTITION BY res1.ID ORDER BY res1.ID) as toPrint
			FROM Hotels as res1
			JOIN Pictures as res2
			ON res1.ID = res2.Hotelid
			JOIN Descriptionn as res3
			ON res1.ID = res3.Hotelid
			WHERE res1.ID IN
				(	
					select DISTINCT t1.ID
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
				)

			)as kkk
	where kkk.toPrint = 1









GO