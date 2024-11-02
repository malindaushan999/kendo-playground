CREATE TABLE [Core].[Customer]
(
    CustomerID      INT             IDENTITY(1,1),
    FirstName       NVARCHAR(50)    NOT NULL,
    LastName        NVARCHAR(50)    NOT NULL,
    Email           NVARCHAR(100)   NOT NULL        CONSTRAINT UQ_Customer_Email UNIQUE, -- Unique constraint on Email
    Phone           NVARCHAR(15)    NULL,
    CreatedBy       NVARCHAR(50)    NOT NULL        CONSTRAINT DF_Customer_CreatedBy DEFAULT (1),
    CreatedDate     DATETIME2       NOT NULL        CONSTRAINT DF_Customer_CreatedDate DEFAULT GETDATE(), -- Default constraint for CreatedDate
    ModifiedBy      NVARCHAR(50)    NULL,
    ModifiedDate    DATETIME2       NULL
    CONSTRAINT PK_Customer_CustomerID PRIMARY KEY NONCLUSTERED (CustomerID ASC)  -- Clustered index on CustomerID
);
