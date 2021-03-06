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
PRINT N'Creating [dbo].[DeleteHotel]...';


GO
CREATE PROCEDURE [dbo].[DeleteHotel]
	@HotelName varchar(50),
	@CityName varchar(50)
AS
	DECLARE @HotelID int
	SET @HotelID = (SELECT ID
					FROM Hotels as h
					WHERE h.[Name] = @HotelName AND h.[City] = @CityName)
	DELETE from Hotels
	WHERE ID = @HotelID

-- we have deleted from Hotels table

--next we need to delete from HotelsRoomsInfo, but get the ID list for HotelsRoomsInfo

	DECLARE @RoomsID table(ID int)
	INSERT INTO @RoomsID
	SELECT ID
	FROM HotelsRoomsInfo as h
	WHERE h.[HotelId] = @HotelID

	DELETE FROM HotelsRoomsInfo
	WHERE ID in (SELECT ID
				FROM @RoomsID)

--deleting from booked, we don't delete from PersonsInfo, because that man can have another book
	DELETE FROM booked
	where HotelidRoom in (select ID 
							from @RoomsID)
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
PRINT N'Creating [dbo].[InsertFromWindow]...';


GO
CREATE PROCEDURE [dbo].[InsertFromWindow]
	@HotelName varchar(50),
	@CityName varchar(50),
	@RoomQauntity smallint,
	@BedQuantity tinyint,
	@Money money
	
AS
--ete masnachyux chka,@HotID -n klini 0, piti insert anenq
	DECLARE @HotID int

	Set @HotID = isnull((SELECT h.ID FROM Hotels h WHERE h.City = @CityName AND h.[Name] = @HotelName),0)


	IF @HotID = 0
	BEGIN
		INSERT INTO Hotels([Name], [City])
			VALUES (@HotelName, @CityName);

	SET @HotID = SCOPE_IDENTITY()
	END
--hima piti stugenq tenc qanakov senyakner ka te voch

	DECLARE @EXISTS int

	SET @EXISTS =   (select count(*)
					from HotelsRoomsInfo
					where HotelId = @HotID AND BedQuantity = @BedQuantity)
		
	--ete 0 e return arel, uremn senyak chka
	--piti insert ani
	IF @EXISTS = 0
	BEGIN
		INSERT INTO HotelsRoomsInfo([HotelId],[BedQuantity],[RoomQauntity],[Money])
				Values (@HotID, @BedQuantity, @RoomQauntity, @Money);
	END
GO
PRINT N'Creating [dbo].[SearchST]...';


GO
CREATE PROCEDURE [dbo].[SearchST]
	@HotelName varchar(50),
	@CityName varchar(50),
	@From datetime,
	@To datetime = null,
	@BedQuantity tinyint
AS
	IF @BedQuantity = 0
	BEGIN
		SET @BedQuantity = null
	END


	IF LEN(@CityName) = 0
	BEGIN
		SET @CityName = null
	END

	IF LEN(@HotelName) = 0
	begin
		SET @HotelName = NULL
	end

	select *
	from (select h1.[Name] as HotelName,h1.City as CityName,h2.[Money] as Moneyy,h2.BedQuantity as Bed
															,(RoomQauntity-reservedCount) as tarberutyun
	from Hotels as h1
	join HotelsRoomsInfo as h2
	on h1.ID = h2.HotelId
	left join (select h2.ID,count(*) as reservedCount
			from Hotels as h1
			join HotelsRoomsInfo as h2
			on h1.ID = h2.HotelId
			left join booked as b
			on b.HotelidRoom = h2.ID
			where(@To IS NOT NULL AND h1.[Name] = isnull(@HotelName,h1.[Name]) and h1.City = isnull(@CityName,h1.City) and
								h2.BedQuantity = isnull(@BedQuantity,h2.BedQuantity) and 
								(
											(@From <= b.[From] and  @To > b.[From])
											OR (@From >= b.[From] and @From < b.[To])
								)
				)
				OR
				( @To IS NULL AND
				h1.[Name] = isnull(@HotelName,h1.[Name]) and h1.City = isnull(@CityName,h1.City) and
								h2.BedQuantity = isnull(@BedQuantity,h2.BedQuantity) and 
								(
											(@From <= b.[From])
											OR (@From >= b.[From] and @From < b.[To])
								)
				)

													
			group by h2.ID) as k
	on k.ID = h2.ID
	where  h1.[Name] = isnull(@HotelName,h1.[Name]) and h1.City = isnull(@CityName,h1.City) and
								h2.BedQuantity = isnull(@BedQuantity,h2.BedQuantity)) as verjnakan
	where verjnakan.tarberutyun > 0 or verjnakan.tarberutyun IS NULL
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
		select h1.Name,h2.Money
		from Hotels as h1
		join HotelsRoomsInfo as h2
		on h1.ID = h2.HotelId
		where h2.ID = @HotelsInfoID    
	END
RETURN @@ROWCOUNT
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
//CONSTRAINT reference_to_personInfo_info FOREIGN KEY ([Passportid]) REFERENCES PersonsInfo([Passportid])
*/

EXEC InsertFromWindow 'Marriot','Yerevan' ,10, 1, 17000
EXEC InsertFromWindow 'Marriot','Yerevan' ,5, 2, 28000
EXEC InsertFromWindow 'Marriot','Yerevan' ,4, 3, 37000

EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,7, 1, 17000
EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,3, 3, 47000

EXEC InsertFromWindow 'Grand Hotel','Los Angeles' ,3, 3, 47000

EXEC InsertFromWindow 'Grand Hotel','New York' ,3, 3, 47000


EXEC InsertFromWindow 'Hilton Hotel','New York' ,10, 1, 17000
EXEC InsertFromWindow 'Hilton Hotel','New York' ,5, 2, 28000
EXEC InsertFromWindow 'Hilton Hotel','New York' ,3, 3, 47000

EXEC InsertFromWindow 'Hilton Hotel','Los Angeles' ,13, 1, 17000
EXEC InsertFromWindow 'Hilton Hotel','Los Angeles' ,7, 2, 28000
EXEC InsertFromWindow 'Hilton Hotel','Los Angeles',4, 3, 47000



INSERT INTO booked
VALUES ('2020-03-06', '2020-03-15', 3, '1111'),
		('2020-03-02', '2020-03-14', 3, '2222'),
		('2020-03-07', '2020-03-09', 5, '3333'),
		('2020-03-06', '2020-03-15', 6, '4444'),
		('2020-03-02', '2020-03-14', 6, '5555'),
		('2020-03-06', '2020-03-15', 7, '6666'),
		('2020-03-02', '2020-03-14', 7, '7777'),
		('2020-03-07', '2020-03-09', 7, '8888'),
		('2020-03-06', '2020-03-15', 8, '9999'),
		('2020-03-09', '2020-03-15', 10, '1010')


INSERT INTO PersonsInfo
VALUES 
('1111', 'aaa','sss','F','asas','assa','sacasc'),
('2222', 'aaa','sss','F','asas','assa','sacasc'),
('3333', 'aaa','sss','F','asas','assa','sacasc'),
('4444', 'aaa','sss','F','asas','assa','sacasc')
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
