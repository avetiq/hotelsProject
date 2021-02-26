CREATE PROCEDURE [dbo].[InsertFromWindow]
	@HotelName varchar(50),
	@CityName varchar(50),
	@RoomNumber smallint,
	@BedQuantity tinyint,
	@Money money
	
AS
	BEGIN TRANSACTION;
--ete masnachyux chka,@HotID -n klini 0, piti insert anenq
	DECLARE @HotID int

	Set @HotID = isnull((SELECT h.ID FROM Hotels h WHERE h.City = @CityName AND h.[Name] = @HotelName),0)


	IF @HotID = 0
	BEGIN
		INSERT INTO Hotels([Name], [City])
			VALUES (@HotelName, @CityName);

	SET @HotID = SCOPE_IDENTITY()
	END
--hima piti stugenq tenc hamari senyakn ka mer hotel-um te voch
--bayc ete stugum enq u tesnum enq vor ka, RAISERROR enq anum

--	RAISERROR ( 'Whoops, Such Hotel Room already Exsists',1,1)

		
       IF EXISTS  (select RoomNumber
				    from HotelsRoomsInfo
				    where HotelId = @HotID AND RoomNumber = @RoomNumber)
		BEGIN
		RAISERROR ( 'Whoops, Such Hotel Room already Exsists',18,1)
		END
		ELSE
		BEGIN
		INSERT INTO HotelsRoomsInfo([HotelId],[BedQuantity],[RoomNumber],[Money])
				Values (@HotID, @BedQuantity, @RoomNumber, @Money);
		END
	COMMIT TRANSACTION;
GO

