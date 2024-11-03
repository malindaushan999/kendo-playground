CREATE FUNCTION [dbo].[TVFServerSideGrid]
(
	@UserId INT
)
RETURNS TABLE
AS 
RETURN
(
	SELECT 
		C.CustomerId,
		C.FirstName,
		C.LastName,
		C.Email,
		C.Phone,
		CD.[Address],
		CD.City,
		CD.[State],
		CD.ZipCode,
		CD.Country,
		CD.DateOfBirth,
		CD.CreatedDate,
		CD.ModifiedDate
	FROM Core.Customer C
	INNER JOIN Core.CustomerDetails CD ON C.CustomerId = CD.CustomerId
)
