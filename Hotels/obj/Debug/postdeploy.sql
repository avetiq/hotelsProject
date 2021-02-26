/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/



EXEC InsertFromWindow 'Marriot','Yerevan' ,1, 1, 17000
EXEC InsertFromWindow 'Marriot','Yerevan' ,2, 3, 47000
EXEC InsertFromWindow 'Marriot','Yerevan' ,3, 3, 49000
EXEC InsertFromWindow 'Marriot','Yerevan' ,4, 3, 49000
EXEC InsertFromWindow 'Marriot','Yerevan' ,5, 2, 47000


EXEC InsertFromWindow 'Hilton Hotel','Yerevan' ,1, 1, 17000
EXEC InsertFromWindow 'Hilton Hotel','Yerevan' ,2, 3, 47000
EXEC InsertFromWindow 'Hilton Hotel','Yerevan' ,3, 3, 49000
EXEC InsertFromWindow 'Hilton Hotel','Yerevan' ,4, 3, 49000
EXEC InsertFromWindow 'Hilton Hotel','Yerevan' ,5, 2, 47000


EXEC InsertFromWindow 'Raddison Blu','Sochi' ,1, 1, 17000
EXEC InsertFromWindow 'Raddison Blu','Sochi' ,2, 3, 47000
EXEC InsertFromWindow 'Raddison Blu','Sochi' ,3, 3, 490000
EXEC InsertFromWindow 'Raddison Blu','Sochi' ,4, 3, 49000
EXEC InsertFromWindow 'Raddison Blu','Sochi' ,5, 2, 47000


EXEC InsertFromWindow 'Hyatt  Hotel', 'New York' ,1, 1, 17000
EXEC InsertFromWindow 'Hyatt  Hotel', 'New York',2, 3, 47000
EXEC InsertFromWindow 'Hyatt  Hotel', 'New York' ,3, 3, 49000
EXEC InsertFromWindow 'Hyatt  Hotel', 'New York' ,4, 3, 49000
EXEC InsertFromWindow 'Hyatt  Hotel', 'New York' ,5, 2, 47000



EXEC InsertFromWindow 'Cosmos Hotel', 'Moscow' ,1, 1, 17000
EXEC InsertFromWindow 'Cosmos Hotel', 'Moscow' ,2, 3, 47000
EXEC InsertFromWindow 'Cosmos Hotel', 'Moscow' ,3, 3, 49000
EXEC InsertFromWindow 'Cosmos Hotel', 'Moscow' ,4, 3, 49000
EXEC InsertFromWindow 'Cosmos Hotel','Moscow' ,5, 2, 47000





INSERT INTO Pictures
VALUES ('/photos/Marriott/img0.jpg', 1),
		('/photos/Marriott/img1.jpg', 1),
		('/photos/Marriott/img2.jpg', 1),
		('/photos/Marriott/img3.jpg', 1),
		('/photos/Marriott/img4.jpg', 1),
		('/photos/Marriott/img5.jpg', 1),
		('/photos/Marriott/img6.jpg', 1),
		('/photos/HiltonHotel/img0.jpg', 2),
		('/photos/HiltonHotel/img1.jpg', 2),
		('/photos/HiltonHotel/img2.jpg', 2),
		('/photos/HiltonHotel/img3.jpg', 2),
		('/photos/HiltonHotel/img4.jpg', 2),
		('/photos/HiltonHotel/img5.jpg', 2),
		('/photos/HiltonHotel/img6.jpg', 2),
		('/photos/Radisson Blu/img0.jpg', 3),
		('/photos/Radisson Blu/img1.jpg', 3),
		('/photos/Radisson Blu/img2.jpg', 3),
		('/photos/Radisson Blu/img3.jpg', 3),
		('/photos/Radisson Blu/img4.jpg', 3),
		('/photos/Radisson Blu/img5.jpg', 3),
		('/photos/Radisson Blu/img6.jpg', 3),
		('/photos/HyattHotelNewYork/logo.jpg', 4),
		('/photos/HyattHotelNewYork/1.jpg', 4),
		('/photos/HyattHotelNewYork/2.jpg', 4),
		('/photos/HyattHotelNewYork/3.jpg', 4),
		('/photos/HyattHotelNewYork/4.jpg', 4),
		('/photos/HyattHotelNewYork/5.jpg', 4),
		('/photos/CosmosHotelMoscow/logo.png', 5),
		('/photos/CosmosHotelMoscow/1.jpg', 5),
		('/photos/CosmosHotelMoscow/2.jpg', 5),
		('/photos/CosmosHotelMoscow/3.jpg', 5),
		('/photos/CosmosHotelMoscow/4.jpg', 5),
		('/photos/CosmosHotelMoscow/5.jpg', 5)
		




GO
