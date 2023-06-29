CREATE PROCEDURE InsertEmployeeInfo
    @CompanyName nvarchar(20),
    @Street nvarchar(50),
    @EmployeeName nvarchar(50) = NULL,
    @FirstName nvarchar(50) = NULL,
    @LastName nvarchar(50) = NULL,
    @Position nvarchar(30) = NULL,
    @City nvarchar(20) = NULL,
    @State nvarchar(50) = NULL,
    @ZipCode nvarchar(50) = NULL
AS
BEGIN
    -- Check if at least one field is not NULL, empty string, or contains only spaces
    IF (@EmployeeName IS NULL OR LTRIM(RTRIM(@EmployeeName)) = '') AND
       (@FirstName IS NULL OR LTRIM(RTRIM(@FirstName)) = '') AND
       (@LastName IS NULL OR LTRIM(RTRIM(@LastName)) = '')
    BEGIN
        RAISERROR('At least one field (EmployeeName, FirstName, or LastName) must have a value.', 16, 1)
        RETURN;
    END

    IF LEN(@CompanyName) > 20
        SET @CompanyName = LEFT(@CompanyName, 20)

    -- Insert the employee information into the database
    INSERT INTO Employee (EmployeeName, PersonId, CompanyName, Position, AddressId)
    VALUES (
        CASE WHEN @EmployeeName IS NOT NULL AND LTRIM(RTRIM(@EmployeeName)) <> '' THEN @EmployeeName
             WHEN @FirstName IS NOT NULL AND LTRIM(RTRIM(@FirstName)) <> '' THEN @FirstName + ' ' + @LastName
             ELSE @LastName
        END,
        (SELECT Id FROM Person WHERE FirstName = @FirstName AND LastName = @LastName),
        @CompanyName,
        @Position,
        (SELECT Id FROM Address WHERE Street = @Street AND City = @City AND State = @State AND ZipCode = @ZipCode)
    )
END
