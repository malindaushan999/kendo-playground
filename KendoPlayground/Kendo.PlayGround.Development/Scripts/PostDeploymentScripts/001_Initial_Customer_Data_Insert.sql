-- Insert 100,000 dummy records into Customer table with random data
DECLARE @counter INT = 0;
DECLARE @CustomerCount INT = 0;

IF OBJECT_ID('[Core].[Customer]') IS NOT NULL AND OBJECT_ID('[Core].[CustomerDetails]') IS NOT NULL
BEGIN

SELECT
	@CustomerCount = COUNT(1)
FROM Core.Customer;

IF @CustomerCount = 0
BEGIN
WHILE @Counter < 100000
BEGIN
INSERT INTO [Core].[Customer] (FirstName, LastName, Email, Phone, CreatedBy, CreatedDate)
	SELECT
		-- Generate random first names and last names
		CASE ABS(CHECKSUM(NEWID())) % 5
			WHEN 0 THEN 'Smith'
			WHEN 1 THEN 'Johnson'
			WHEN 2 THEN 'Brown'
			WHEN 3 THEN 'Taylor'
			WHEN 4 THEN 'Anderson'
		END AS FIRSTNAME
	   ,CASE ABS(CHECKSUM(NEWID())) % 5
			WHEN 0 THEN 'John'
			WHEN 1 THEN 'Jane'
			WHEN 2 THEN 'Alex'
			WHEN 3 THEN 'Chris'
			WHEN 4 THEN 'Sam'
		END AS LASTNAME
	   ,

		-- Generate unique random email
		CONCAT(LEFT(NEWID(), 8), '@example.com') AS EMAIL
	   ,

		-- Generate random phone numbers
		CONCAT('123-456-', RIGHT('0000' + CAST(ABS(CHECKSUM(NEWID())) % 10000 AS NVARCHAR(4)), 4)) AS PHONE
	   ,'System' AS CREATEDBY
	   ,                -- CreatedBy
		DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 3650), GETDATE()) AS CREATEDDATE; -- Random CreatedDate within 10 years

SET @Counter = @Counter + 1;
END;

-- Insert corresponding records into CustomerDetails table for each Customer
INSERT INTO [Core].[CustomerDetails] (CustomerID, [Address], City, [State], ZipCode, Country, DateOfBirth, CreatedBy, CreatedDate)
	SELECT
		CustomerID
	   , -- Foreign key reference to CustomerID

		-- Generate random address
		CONCAT('Address ', ABS(CHECKSUM(NEWID())) % 1000) AS ADDRESS
	   ,

		-- Random City
		CASE ABS(CHECKSUM(NEWID())) % 5
			WHEN 0 THEN 'New York'
			WHEN 1 THEN 'Los Angeles'
			WHEN 2 THEN 'Chicago'
			WHEN 3 THEN 'Houston'
			WHEN 4 THEN 'Phoenix'
			ELSE 'Washington DC'
		END AS CITY
	   ,

		-- Random State
		CASE ABS(CHECKSUM(NEWID())) % 5
			WHEN 0 THEN 'NY'
			WHEN 1 THEN 'CA'
			WHEN 2 THEN 'IL'
			WHEN 3 THEN 'TX'
			WHEN 4 THEN 'AZ'
			ELSE 'DC'
		END AS STATE
	   ,RIGHT('00000' + CAST(ABS(CHECKSUM(NEWID())) % 100000 AS NVARCHAR(5)), 5) AS ZIPCODE
	   , -- Random ZipCode
		'USA' AS COUNTRY
	   , -- Fixed Country value

		DATEADD(YEAR, -(18 + ABS(CHECKSUM(NEWID()) % 50)), GETDATE()) AS DATEOFBIRTH
	   , -- Random DateOfBirth (age 18-68)

		'System' AS CREATEDBY
	   ,                      -- CreatedBy
		DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 3650), GETDATE()) AS CREATEDDATE -- Random CreatedDate within 10 years
	FROM [Core].Customer;
END
END
