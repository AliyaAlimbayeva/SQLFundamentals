CREATE TRIGGER [CreateCompanyOnInsert]
ON [dbo].[Employee]
AFTER INSERT
AS
BEGIN
    DECLARE @CompanyName NVARCHAR(50)
    DECLARE @AddressID INT
    
    SELECT @CompanyName = CompanyName,
           @AddressID = AddressId
    FROM inserted

    INSERT INTO Company (Name, AddressId)
    VALUES (@CompanyName, @AddressID)
END