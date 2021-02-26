CREATE PROCEDURE [dbo].[ReservedRoom]

AS
	select h1.[Name] as HotelName,h1.City as City,h2.BedQuantity as BedQuantity,[Money], b.Passportid as Passportid
	from Hotels as h1
	join HotelsRoomsInfo as h2
	on h1.ID = h2.HotelId
	join booked as b
	on b.HotelidRoom = h2.ID
	join PersonsInfo as p
	on p.Passportid = b.Passportid
GO
