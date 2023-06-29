CREATE VIEW [dbo].[EmployeeInfo] AS 
	SELECT TOP 100 percent e.Id AS EmployeeId, 
	ISNULL(e.EmployeeName, p.FirstName + ' ' + p.LastName) AS EmployeeFullName, 
	a.ZipCode + '_' + ISNULL(a.State, '') + ', ' + a.City + '-' + a.Street AS EmployeeFullAddress,
	c.Name + '(' + ISNULL(e.Position, '') + ')' AS EmployeeCompanyInfo
	FROM dbo.Employee e
	left join dbo.Person p on p.Id = e.PersonId
	left join dbo.Address a on a.Id = e.AddressId
    left join dbo.Company c ON e.CompanyName = c.Name
	ORDER BY CompanyName, City;
	