CREATE TABLE [Core].[CustomerDetails]
(
    CustomerDetailsID   INT IDENTITY(1,1), 
    CustomerID          INT                 NOT NULL, -- Unique constraint to enforce one-to-one relationship
    [Address]           NVARCHAR(255)       NOT NULL,
    City                NVARCHAR(100)       NOT NULL,
    [State]             NVARCHAR(50)        NOT NULL,
    ZipCode             NVARCHAR(10)        NOT NULL,
    Country             NVARCHAR(50)        NOT NULL,
    DateOfBirth         DATE                NULL,
    CreatedBy           NVARCHAR(50)        NOT NULL CONSTRAINT DF_CustomerDetails_CreatedBy DEFAULT (1),
    CreatedDate         DATETIME2           NOT NULL CONSTRAINT DF_CustomerDetails_CreatedDate DEFAULT GETDATE(), -- Default constraint for CreatedDate
    ModifiedBy          NVARCHAR(50)        NULL,
    ModifiedDate        DATETIME2           NULL,
    CONSTRAINT PK_CustomerDetails_CustomerDetailsID PRIMARY KEY NONCLUSTERED (CustomerDetailsID ASC), -- Clustered index on CustomerDetailsID
    -- Foreign key constraint to link CustomerID in CustomerDetails to CustomerID in Customer
    CONSTRAINT FK_CustomerDetails_CustomerID FOREIGN KEY (CustomerID) REFERENCES [Core].[Customer](CustomerID)
);