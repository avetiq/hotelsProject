CREATE TABLE [dbo].[booked]
(
	[ID] INT NOT NULL IDENTITY(1,1), 
    [From] DATETIME NOT NULL, 
    [To] DATETIME NOT NULL, 
    [HotelidRoom] INT NOT NULL, 
	[Passportid] VARCHAR(10) NOT NULL,
    CONSTRAINT bookedPK PRIMARY KEY([ID]),
	CONSTRAINT Booked_to_Hotels_ref FOREIGN KEY ([HotelidRoom]) REFERENCES HotelsRoomsInfo(ID) ON DELETE CASCADE,
	CONSTRAINT reference_to_personInfo_info FOREIGN KEY ([Passportid]) REFERENCES PersonsInfo([Passportid])
	
)
