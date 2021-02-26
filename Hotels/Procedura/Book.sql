CREATE PROCEDURE [dbo].[Book]
	@passportId varchar(10),
	@name nvarchar(20),
	@surname nvarchar(20),
	@gender nchar(1),
	@email nvarchar(30),
	@city nvarchar(20),
	@country nvarchar(30),
	@creditCardNumber nvarchar(15),
	@from datetime,
	@to datetime,
	@HotelName varchar(50),
	@CityName varchar(50),
	@BedQuantity tinyint,
	@Money money
AS
	
	--we want to find any HotelRoomsINfo id for inserting in booked table

	DECLARE @HotelBookID int

	SET @HotelBookID = (select top 1
						h2.ID
						from Hotels as h1
						join HotelsRoomsInfo as h2
						on h1.ID = h2.HotelId
						where h1.City = @CityName and h1.[Name] = @HotelName and h2.[Money] = @Money and h2.BedQuantity = @BedQuantity)

	DECLARE @SuchPassportId int
	
	SET @SuchPassportId = (		select count(*)
								from PersonsInfo
								where Passportid = @passportId
							)
	IF @SuchPassportId = 0
	BEGIN
	INSERT INTO PersonsInfo([Name],[Surname],[Passportid],[Gender],[Email],[City],[Country],[CreditCardNumber])
	VALUES (@name, @surname, @passportId, @gender, @email, @city, @country,@creditCardNumber)
	END

	INSERT INTO booked([From],[To],[HotelidRoom],[Passportid])
	VALUES (@from, @to, @HotelBookID, @passportId)



RETURN 0
