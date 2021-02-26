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
USE [$(DatabaseName)];


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



EXEC InsertFromWindow 'Marriot','Yerevan' ,1, 1, 17000
EXEC InsertFromWindow 'Marriot','Yerevan' ,2, 1, 17000
EXEC InsertFromWindow 'Marriot','Yerevan' ,3, 1, 17000


EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,1, 1, 17000
EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,2, 3, 47000
EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,3, 3, 47000
EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,4, 3, 47000
EXEC InsertFromWindow 'Grand Hotel','Yerevan' ,5, 2, 47000

EXEC InsertFromWindow 'Marriot','Yerevan' ,4, 3, 37000
EXEC InsertFromWindow 'Marriot','Yerevan' ,5, 2, 28000
EXEC InsertFromWindow 'Marriot','Yerevan' ,6, 2, 28000
EXEC InsertFromWindow 'Marriot','Yerevan' ,7, 2, 28000
EXEC InsertFromWindow 'Marriot','Yerevan' ,8, 2, 28000
EXEC InsertFromWindow 'Marriot','Yerevan' ,9, 2, 28000


INSERT INTO PersonsInfo
VALUES 
('1111', 'aaa','sss','F','asas','assa','sacasc','hhh'),
('2222', 'aaa','sss','F','asas','assa','sacasc','jjl'),
('3333', 'aaa','sss','F','asas','assa','sacasc','jbj'),
('4444', 'aaa','sss','F','asas','assa','sacasc','hjbhj')


INSERT INTO booked
VALUES ('2020-03-06', '2020-03-15', 1, '1111'),
		('2020-03-02', '2020-03-14', 2, '2222'),
		('2020-03-07', '2020-03-09', 3, '3333'),
		('2020-03-06', '2020-03-15', 6, '4444')

		
GO

GO
PRINT N'Update complete.';


GO
