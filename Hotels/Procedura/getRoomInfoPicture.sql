CREATE PROCEDURE [dbo].[getRoomInfoPicture]
	@id int
AS
	select res1.[Name] as HotelName,res2.[Source] as Nkar,res3.Long as Long 
	from Hotels as res1
	join Pictures as res2
	on res1.ID = res2.Hotelid
	join Descriptionn as res3
	on res1.ID = res3.Hotelid
	where res1.ID = @id


RETURN 0
