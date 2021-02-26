﻿/*
Deployment script for HotelsDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HotelsDB"
:setvar DefaultFilePrefix "HotelsDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[booked]...';


GO
CREATE TABLE [dbo].[booked] (
    [ID]          INT          IDENTITY (1, 1) NOT NULL,
    [From]        DATETIME     NOT NULL,
    [To]          DATETIME     NOT NULL,
    [HotelidRoom] INT          NOT NULL,
    [Passportid]  VARCHAR (10) NOT NULL,
    CONSTRAINT [bookedPK] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
PRINT N'Creating [dbo].[Hotels]...';


GO
CREATE TABLE [dbo].[Hotels] (
    [ID]   INT          IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    [City] VARCHAR (50) NOT NULL,
    CONSTRAINT [hotelsPK] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
PRINT N'Creating [dbo].[HotelsRoomsInfo]...';


GO
CREATE TABLE [dbo].[HotelsRoomsInfo] (
    [HotelId]      INT      NOT NULL,
    [RoomQauntity] SMALLINT NOT NULL,
    [BedQuantity]  TINYINT  NOT NULL,
    [Money]        MONEY    NOT NULL,
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PrKeyHotelInfo] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
PRINT N'Creating [dbo].[PersonsInfo]...';


GO
CREATE TABLE [dbo].[PersonsInfo] (
    [Passportid]       VARCHAR (10)  NOT NULL,
    [Name]             NVARCHAR (20) NOT NULL,
    [Surname]          NVARCHAR (20) NOT NULL,
    [Gender]           NCHAR (1)     NOT NULL,
    [Email]            NVARCHAR (30) NOT NULL,
    [City]             NVARCHAR (20) NOT NULL,
    [CreditCardNumber] NVARCHAR (15) NOT NULL,
    CONSTRAINT [person_id] PRIMARY KEY CLUSTERED ([Passportid] ASC)
);


GO
PRINT N'Creating [dbo].[Booked_to_Hotels_ref]...';


GO
ALTER TABLE [dbo].[booked]
    ADD CONSTRAINT [Booked_to_Hotels_ref] FOREIGN KEY ([HotelidRoom]) REFERENCES [dbo].[HotelsRoomsInfo] ([ID]);


GO
PRINT N'Creating [dbo].[reference_to_personInfo_info]...';


GO
ALTER TABLE [dbo].[booked]
    ADD CONSTRAINT [reference_to_personInfo_info] FOREIGN KEY ([Passportid]) REFERENCES [dbo].[PersonsInfo] ([Passportid]);


GO
PRINT N'Creating [dbo].[Hotels_Info]...';


GO
ALTER TABLE [dbo].[HotelsRoomsInfo]
    ADD CONSTRAINT [Hotels_Info] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotels] ([ID]);


GO
PRINT N'Creating [dbo].[CrossingDatesNumber]...';


GO
CREATE PROCEDURE [dbo].[CrossingDatesNumber]
	@DateFrom datetime,
	@DateTo datetime,
	@WhichHotelRoom int

AS
	DECLARE @reservedRooms int


	set @reservedRooms = (select count(*)
						from booked
						where booked.HotelidRoom = @WhichHotelRoom   AND  (
								(@DateFrom < booked.[From] and @DateTo > booked.[From])
								OR (@DateFrom > booked.[From] and @DateFrom < booked.[To])
										)
							)
			
RETURN @reservedRooms
GO
PRINT N'Creating [dbo].[ForAddingHotels]...';


GO
CREATE PROCEDURE [dbo].[ForAddingHotels]
	@HotelId int,
	@RoomQauntity smallint,
	@BedQuantity tinyint,
	@Money money

AS
	
	INSERT INTO HotelsRoomsInfo([HotelId],[BedQuantity],[RoomQauntity],[Money])
				Values (@HotelId, @BedQuantity, @RoomQauntity, @Money);
GO
PRINT N'Creating [dbo].[GetHotelBedid]...';


GO
CREATE PROCEDURE [dbo].[GetHotelBedid]
	@HotelName varchar(50),
	@CityName varchar(50),
	@BedQuantity tinyint
AS

return	(select h2.ID
		from Hotels as h1
		join HotelsRoomsInfo as h2
		on h1.ID = h2.HotelId
		where h1.City = @CityName AND h1.Name = @HotelName AND h2.BedQuantity = @BedQuantity)
GO
PRINT N'Creating [dbo].[ReturningHotelid]...';


GO
CREATE PROCEDURE [dbo].[ReturningHotelid]
	@HotelName varchar(50),
	@CityName varchar(50)
AS
	DECLARE @HotelId int
	INSERT INTO Hotels([Name], [City])
			VALUES (@HotelName, @CityName);

	SET @HotelId = SCOPE_IDENTITY()
RETURN @HotelId
GO
PRINT N'Creating [dbo].[SearchWithAllComponents]...';


GO
CREATE PROCEDURE [dbo].[SearchWithAllComponents]
	@HotelName varchar(50),
	@CityName varchar(50),
	@From datetime,
	@To datetime,
	@BedQuantity int
AS
	DECLARE @HotelsInfoID int
	EXECUTE @HotelsInfoID = GetHotelBedid @HotelName, @CityName, @BedQuantity
	PRINT @HotelsInfoID

	DECLARE @ReservedRooms int
	EXECUTE @ReservedRooms = CrossingDatesNumber @From, @To, @HotelsInfoID
	PRINT @ReservedRooms

	DECLARE @TotalHotelRooms int
	SET @TotalHotelRooms = (select h2.RoomQauntity
							from Hotels as h1
							join HotelsRoomsInfo as h2
							on h1.ID = h2.HotelId
							where h1.City = isnull(@CityName, h1.City) AND h1.Name = @HotelName AND h2.BedQuantity = @BedQuantity)

	PRINT @TotalHotelRooms
	IF @TotalHotelRooms > @ReservedRooms
	BEGIN
		select *
		from Hotels as h1
		join HotelsRoomsInfo as h2
		on h1.ID = h2.HotelId
		where h2.ID = @HotelsInfoID    
	END
RETURN @@ROWCOUNT
GO
PRINT N'Creating [dbo].[AddNewHotelWithProperties]...';


GO
CREATE PROCEDURE [dbo].[AddNewHotelWithProperties]
	@HotelNamee varchar(50),
	@CityNamee varchar(50),
	@RoomQauntity1 smallint,
	@RoomQauntity2 smallint,
	@RoomQauntity3 smallint,
	@BedQuantity1 tinyint,
	@BedQuantity2 tinyint,
	@BedQuantity3 tinyint,
	@Money1 money,
	@Money2 money,
	@Money3 money

AS
	Declare @GetHotelid int 

	execute @GetHotelid = ReturningHotelid @HotelName = @HotelNamee, @CityName = @CityNamee; 

	EXEC ForAddingHotels @HotelId = @GetHotelid, @RoomQauntity = @RoomQauntity1, @BedQuantity = @BedQuantity1, @Money = @Money1;
	EXEC ForAddingHotels @HotelId = @GetHotelid, @RoomQauntity = @RoomQauntity2, @BedQuantity = @BedQuantity2, @Money = @Money2;
	EXEC ForAddingHotels @HotelId = @GetHotelid, @RoomQauntity = @RoomQauntity3, @BedQuantity = @BedQuantity3, @Money = @Money3;
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '24e16052-4657-4ae9-8e14-1a85824884e6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('24e16052-4657-4ae9-8e14-1a85824884e6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a16ba480-e399-46c3-857c-6516ff06ee3c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a16ba480-e399-46c3-857c-6516ff06ee3c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd50172b5-5d64-47fc-9142-f4e7755416d4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d50172b5-5d64-47fc-9142-f4e7755416d4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '22cacbf6-d9d5-46af-a1c9-a38e49b299cb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('22cacbf6-d9d5-46af-a1c9-a38e49b299cb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b5821e3e-ba19-4100-a496-6270567dfb42')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b5821e3e-ba19-4100-a496-6270567dfb42')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '360a4cec-52b7-4bb1-8f84-4b7a3e683576')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('360a4cec-52b7-4bb1-8f84-4b7a3e683576')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4826f0da-fd05-44c1-ae61-9a977030b3aa')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4826f0da-fd05-44c1-ae61-9a977030b3aa')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f847042f-4d9f-4a17-8e6f-c0aef1a86274')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f847042f-4d9f-4a17-8e6f-c0aef1a86274')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3317d152-24a2-4262-8dc5-6d1df7e56d70')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3317d152-24a2-4262-8dc5-6d1df7e56d70')

GO

GO
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

/*
Insert INTO Hotels([Name], [City])
VALUES ('Marriott', 'Yerevan'),
       ('Marriott', 'Sochi'),
       ('Hilton', 'Yerevan'),
	   ('Hilton', 'Gyumri'),
	   ('Radisson Blu', 'Yerevan'),
	   ('Radisson Blu', 'Sochi')


	   */

EXEC AddNewHotelWithProperties @HotelNamee = 'Marriot', @CityNamee = 'Yerevan' , @RoomQauntity1 = 10, @RoomQauntity2 = 5,
								@RoomQauntity3 = 4, @BedQuantity1 = 1, @BedQuantity2 = 2, @BedQuantity3 = 3,
								@money1 = 17000, @money2 = 28000, @money3 = 37000;


								
EXEC AddNewHotelWithProperties @HotelNamee = 'Grand Hotel', @CityNamee = 'Yerevan' , @RoomQauntity1 = 7, @RoomQauntity2 = 4,
								@RoomQauntity3 = 3, @BedQuantity1 = 1, @BedQuantity2 = 2, @BedQuantity3 = 3,
								@money1 = 17000, @money2 = 28000, @money3 = 37000;

EXEC AddNewHotelWithProperties 'Hilton Hotel','New York',10,5,3,1,2,3,63000,120000,190000;
EXEC AddNewHotelWithProperties 'Hilton Hotel','Los Angeles',13,7,4,1,2,3,64500,130000,182000;
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
