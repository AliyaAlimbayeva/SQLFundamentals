﻿/*
Deployment script for TaskDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TaskDB"
:setvar DefaultFilePrefix "TaskDB"
:setvar DefaultDataPath "C:\Users\Aliya_Alimbayeva\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Aliya_Alimbayeva\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
if not exists (select [Id], [FirstName], [LastName] from [dbo].[Person] where [FirstName] = 'Aliya' and LastName = 'Alimbayeva')
begin
  insert into dbo.Person (FirstName, LastName) values ('Aliya', 'Alimbayeva')
end
GO
if not exists (select [Id], [FirstName], [LastName] from dbo.Person where FirstName = 'Sofiya' and LastName = 'Kochetova')
begin
  insert into dbo.Person (FirstName, LastName) values ('Sofiya', 'Kochetova')
end
GO
if not exists (select [Id], [Street], [City], [State], [ZipCode] from dbo.Address where Street = '30 Ablay-hana' and City = 'Aktobe' and State = 'KZ' and ZipCode = '030020')
begin
  insert into dbo.Address (Street, City, State, ZipCode) values ('30 Ablay-hana', 'Aktobe', 'KZ', '030020')
end
GO
if not exists (select [Id], [Street], [City], [State], [ZipCode] from dbo.Address where Street = '156 Fifth Avenue' and City = 'Almaty' and State = 'KZ' and ZipCode = '050000')
begin
  insert into dbo.Address (Street, City, State, ZipCode) values ('156 Fifth Avenue', 'Almaty', 'KZ', '050000')
end
GO
if not exists (select [Id], [AddressId], [PersonId], [CompanyName], [Position], [EmployeeName] from dbo.Employee where AddressId = 1 and PersonId = 1 and CompanyName = 'Epam Kazakhstan' and Position = 'Software Engineer' and EmployeeName = 'Al')
begin
  insert into dbo.Employee (AddressId, PersonId, CompanyName, Position, EmployeeName) values (1, 1, 'Epam Kazakhstan', 'Software Engineer', 'Al')
end
GO
if not exists (select [Id], [AddressId], [PersonId], [CompanyName], [Position], [EmployeeName] from dbo.Employee where AddressId = 2 and PersonId = 2 and CompanyName = 'RGB Bottles' and Position = 'Engineer' and EmployeeName = 'Sofi')
begin
  insert into dbo.Employee (AddressId, PersonId, CompanyName, Position, EmployeeName) values (2, 2, 'RGB Bottles', 'Engineer', 'Sofi')
end
GO
if not exists (select [Id], [Name], [AddressId] from dbo.Company where AddressId = 1 and Name = 'Epam Kazakhstan')
begin
  insert into dbo.Company (AddressId, Name) values (1, 'Epam Kazakhstan')
end
GO
if not exists (select [Id], [Name], [AddressId] from dbo.Company where AddressId = 2 and Name = 'RGB Bottles')
begin
  insert into dbo.Company (AddressId, Name) values (2, 'RGB Bottles')
end
GO

GO
PRINT N'Update complete.';


GO
