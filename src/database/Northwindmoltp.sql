-------------------------
CREATE TABLE "Employees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" varbinary(max) NULL ,
	"Notes" nvarchar(max) NULL ,
	"ReportsTo" "int" NULL ,
	"PhotoPath" nvarchar (255) NULL ,
	CONSTRAINT "PK_Employees" PRIMARY KEY NONCLUSTERED 
	(
		"EmployeeID"
	),
	CONSTRAINT "FK_Employees_Employees" FOREIGN KEY 
	(
		"ReportsTo"
	) REFERENCES "dbo"."Employees" (
		"EmployeeID"
	),
	CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
)
WITH (MEMORY_OPTIMIZED=ON) 
GO
Alter Table Employees Add INDEX LastName (LastName)
GO
Alter Table Employees add INDEX PostalCode (PostalCode)
GO
---------------------------
CREATE TABLE "Categories" (
	"CategoryID" "int" IDENTITY (1, 1) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" nvarchar(max) NULL ,
	"Picture" varbinary(max) NULL ,
	CONSTRAINT "PK_Categories" PRIMARY KEY  NONCLUSTERED 
	(
		"CategoryID"
	)
)
WITH (MEMORY_OPTIMIZED=ON) 
GO
 Alter table Categories ADD INDEX CategoryName(CategoryName)
GO
--------------------------------
CREATE TABLE "Customers" (
	"CustomerID" nchar (5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	CONSTRAINT "PK_Customers" PRIMARY KEY  NONCLUSTERED 
	(
		"CustomerID"
	)
)
WITH (MEMORY_OPTIMIZED=ON) 
GO
 Alter table customers ADD INDEX City(City)
GO
 Alter table customers ADD INDEX CompanyName(CompanyName)
GO
 Alter table customers ADD INDEX PostalCode(PostalCode)
GO
 Alter table customers ADD INDEX Region(Region)
GO
---------------------------------------
CREATE TABLE "Shippers" (
	"ShipperID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Shippers" PRIMARY KEY  NONCLUSTERED 
	(
		"ShipperID"
	)
)
WITH (MEMORY_OPTIMIZED=ON) 
GO
----------------------------------------
CREATE TABLE "Suppliers" (
	"SupplierID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	"HomePage" nvarchar(max) NULL ,
	CONSTRAINT "PK_Suppliers" PRIMARY KEY  NONCLUSTERED 
	(
		"SupplierID"
	)
)
WITH (MEMORY_OPTIMIZED=ON) 
GO
 Alter table suppliers ADD INDEX CompanyName(CompanyName)
GO
 Alter table suppliers ADD INDEX PostalCode(PostalCode)
GO
----------------------------------------------
CREATE TABLE "Orders" (
	"OrderID" "int" IDENTITY (1, 1) NOT NULL ,
	"CustomerID" nchar (5) NULL ,
	"EmployeeID" "int" NULL ,
	"OrderDate" "datetime" NULL ,
	"RequiredDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipVia" "int" NULL ,
	"Freight" "money" NULL CONSTRAINT "DF_Orders_Freight" DEFAULT (0),
	"ShipName" nvarchar (40) NULL ,
	"ShipAddress" nvarchar (60) NULL ,
	"ShipCity" nvarchar (15) NULL ,
	"ShipRegion" nvarchar (15) NULL ,
	"ShipPostalCode" nvarchar (10) NULL ,
	"ShipCountry" nvarchar (15) NULL ,
	CONSTRAINT "PK_Orders" PRIMARY KEY  NONCLUSTERED 
	(
		"OrderID"
	),
	CONSTRAINT FK_Orders_Customers FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	CONSTRAINT FK_Orders_Employees FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES Employees (
		EmployeeID
	),
	CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
	(
		ShipVia
	) REFERENCES Shippers (
		ShipperID
	)
)
WITH (MEMORY_OPTIMIZED=ON)
GO
 Alter table orders Add INDEX CustomerID(CustomerID)
GO
 Alter table orders Add INDEX CustomersOrders(CustomerID)
GO
 Alter table orders Add  INDEX EmployeeID(EmployeeID)
GO
 Alter table orders Add  INDEX EmployeesOrders(EmployeeID)
GO
 Alter table orders Add  INDEX OrderDate(OrderDate)
GO
 Alter table orders Add  INDEX ShippedDate(ShippedDate)
GO
 Alter table orders Add  INDEX ShippersOrders(ShipVia)
GO
 Alter table orders Add  INDEX ShipPostalCode(ShipPostalCode)
GO
----------------------------------------------------
CREATE TABLE "Products" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"SupplierID" "int" NULL ,
	"CategoryID" "int" NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" "money" NULL CONSTRAINT "DF_Products_UnitPrice" DEFAULT (0),
	"UnitsInStock" "smallint" NULL CONSTRAINT "DF_Products_UnitsInStock" DEFAULT (0),
	"UnitsOnOrder" "smallint" NULL CONSTRAINT "DF_Products_UnitsOnOrder" DEFAULT (0),
	"ReorderLevel" "smallint" NULL CONSTRAINT "DF_Products_ReorderLevel" DEFAULT (0),
	"Discontinued" "bit" NOT NULL CONSTRAINT "DF_Products_Discontinued" DEFAULT (0),
	CONSTRAINT "PK_Products" PRIMARY KEY  NONCLUSTERED 
	(
		"ProductID"
	),
	CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
	(
		"CategoryID"
	) REFERENCES Categories (
		"CategoryID"
	),
	CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
	(
		"SupplierID"
	) REFERENCES Suppliers (
		"SupplierID"
	),
	CONSTRAINT "CK_Products_UnitPrice" CHECK (UnitPrice >= 0),
	CONSTRAINT "CK_ReorderLevel" CHECK (ReorderLevel >= 0),
	CONSTRAINT "CK_UnitsInStock" CHECK (UnitsInStock >= 0),
	CONSTRAINT "CK_UnitsOnOrder" CHECK (UnitsOnOrder >= 0)
)
WITH (MEMORY_OPTIMIZED=ON)
GO
 Alter table Products ADD INDEX CategoriesProducts(CategoryID)
GO
 Alter table Products ADD  INDEX CategoryID(CategoryID)
GO
 Alter table Products ADD  INDEX ProductName(ProductName)
GO
 Alter table Products ADD  INDEX SupplierID(SupplierID)
GO
 Alter table Products ADD  INDEX SuppliersProducts(SupplierID)
GO
----------------------------------------------------------------
CREATE TABLE "OrderDetails" (
	"OrderID" "int" NOT NULL ,
	"ProductID" "int" NOT NULL ,
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_Order_Details_UnitPrice" DEFAULT (0),
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_Order_Details_Quantity" DEFAULT (1),
	"Discount" "real" NOT NULL CONSTRAINT "DF_Order_Details_Discount" DEFAULT (0),
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  NONCLUSTERED 
	(
		"OrderID",
		"ProductID"
	),
	CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES Orders (
		"OrderID"
	),
	CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES Products (
		"ProductID"
	),
	CONSTRAINT "CK_Discount" CHECK (Discount >= 0 and (Discount <= 1)),
	CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
	CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
)
WITH (MEMORY_OPTIMIZED=ON)
GO
 Alter table OrderDetails ADD INDEX OrderID(OrderID)
GO
 Alter table OrderDetails ADD  INDEX OrdersOrder_Details(OrderID)
GO
 Alter table OrderDetails ADD  INDEX ProductID(ProductID)
GO
 Alter table OrderDetails ADD  INDEX ProductsOrder_Details(ProductID)
GO
--------------------------------------------------------


