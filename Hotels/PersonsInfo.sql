CREATE TABLE [dbo].[PersonsInfo]
(
	[Passportid] VARCHAR(10) NOT NULL, 
    [Name] NVARCHAR(20) NOT NULL, 
    [Surname] NVARCHAR(20) NOT NULL, 
    [Gender] NCHAR(1) NOT NULL,  
    [Email] NVARCHAR(30) NOT NULL, 
    [City] NVARCHAR(20) NOT NULL, 
    [CreditCardNumber]  NVARCHAR(15) NOT NULL,
	[Country] NVARCHAR(30) NOT NULL, 
    CONSTRAINT person_id PRIMARY KEY([Passportid])
)
