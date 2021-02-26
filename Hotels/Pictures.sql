﻿CREATE TABLE [dbo].[Pictures]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Source] NVARCHAR(150) NOT NULL, 
    [Hotelid] INT NOT NULL,
	CONSTRAINT PicturesTableID PRIMARY KEY([Id]),
	CONSTRAINT Hotels_Info_Pictures FOREIGN KEY ([Hotelid]) REFERENCES Hotels(ID) ON DELETE CASCADE
)
