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
go
if not exists (select [Id], [FirstName], [LastName] from dbo.Person where FirstName = 'Sofiya' and LastName = 'Kochetova')
begin
  insert into dbo.Person (FirstName, LastName) values ('Sofiya', 'Kochetova')
end
go
if not exists (select [Id], [Street], [City], [State], [ZipCode] from dbo.Address where Street = '30 Ablay-hana' and City = 'Aktobe' and State = 'KZ' and ZipCode = '030020')
begin
  insert into dbo.Address (Street, City, State, ZipCode) values ('30 Ablay-hana', 'Aktobe', 'KZ', '030020')
end
go
if not exists (select [Id], [Street], [City], [State], [ZipCode] from dbo.Address where Street = '156 Fifth Avenue' and City = 'Almaty' and State = 'KZ' and ZipCode = '050000')
begin
  insert into dbo.Address (Street, City, State, ZipCode) values ('156 Fifth Avenue', 'Almaty', 'KZ', '050000')
end
go
if not exists (select [Id], [AddressId], [PersonId], [CompanyName], [Position], [EmployeeName] from dbo.Employee where AddressId = 1 and PersonId = 1 and CompanyName = 'Epam Kazakhstan' and Position = 'Software Engineer' and EmployeeName = 'Al')
begin
  insert into dbo.Employee (AddressId, PersonId, CompanyName, Position, EmployeeName) values (1, 1, 'Epam Kazakhstan', 'Software Engineer', 'Al')
end
go
if not exists (select [Id], [AddressId], [PersonId], [CompanyName], [Position], [EmployeeName] from dbo.Employee where AddressId = 2 and PersonId = 2 and CompanyName = 'RGB Bottles' and Position = 'Engineer' and EmployeeName = 'Sofi')
begin
  insert into dbo.Employee (AddressId, PersonId, CompanyName, Position, EmployeeName) values (2, 2, 'RGB Bottles', 'Engineer', 'Sofi')
end
go
if not exists (select [Id], [Name], [AddressId] from dbo.Company where AddressId = 1 and Name = 'Epam Kazakhstan')
begin
  insert into dbo.Company (AddressId, Name) values (1, 'Epam Kazakhstan')
end
go
if not exists (select [Id], [Name], [AddressId] from dbo.Company where AddressId = 2 and Name = 'RGB Bottles')
begin
  insert into dbo.Company (AddressId, Name) values (2, 'RGB Bottles')
end
go