CREATE TABLE [dbo].[HotelsRoomsInfo]
(
	[HotelId] INT NOT NULL,
	[RoomNumber] SMALLINT NOT NULL, 
    [BedQuantity] TINYINT NOT NULL, 
    [Money] money NOT NULL,
	[ID] INT NOT NULL IDENTITY(1,1), 
	CONSTRAINT PrKeyHotelInfo PRIMARY KEY([ID]),
    CONSTRAINT Hotels_Info FOREIGN KEY ([HotelId]) REFERENCES Hotels(ID) ON DELETE CASCADE
)
