----- ENTIDADES FUERTES

create table example.Suppliers(
    SupplierID int not null PRIMARY key,
    SupplierName nvarchar(200),
    [Address] nvarchar(2000),
    City nvarchar(200),
    PostalCode nvarchar(200),
    Country nvarchar(200),
    Phone nvarchar(200)
)

---- ENTIDADES DEBILES

CREATE TABLE example.Orders(
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerID NUMERIC NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE,
    ShipperID INT NOT NULL
)

ALTER TABLE example.Orders
ADD CONSTRAINT FK_Customer 
FOREIGN KEY (CustomerID) 
REFERENCES example.Customers(CustomerID)

ALTER TABLE example.Orders
ADD CONSTRAINT FK_Employee
FOREIGN KEY (EmployeeID) 
REFERENCES example.Employees(EmployeeID)

ALTER TABLE example.Orders
ADD CONSTRAINT FK_shipper
FOREIGN KEY (ShipperID) 
REFERENCES example.Shippers(ShipperID)

CREATE TABLE [example].[Products](
	[ProductoID] [int] NOT NULL PRIMARY KEY,
	[ProductName] [nvarchar](200) NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Unit] [nvarchar](200) NULL,
	[Price] [NUMERIC] NULL
)

ALTER TABLE example.Products
ADD CONSTRAINT FK_Suppliers
FOREIGN KEY (SupplierID)
REFERENCES example.Suppliers(SupplierID)

ALTER TABLE example.Products
ADD CONSTRAINT FK_Categories
FOREIGN KEY (CategoryID)
REFERENCES example.Categories(CategoryID)

---- entidades debiles segundo nivel

CREATE TABLE example.OrderDetails(
    OrderDetailID INT NOT NULL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT
)

ALTER TABLE example.OrderDetails
ADD CONSTRAINT FK_Products
FOREIGN KEY (ProductID)
REFERENCES example.Products(ProductoID)

ALTER TABLE example.OrderDetails
ADD CONSTRAINT FK_Orders
FOREIGN KEY (OrderID)
REFERENCES example.Orders(OrderID)