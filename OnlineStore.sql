Create Table Categories
(
	CategoryId int Primary Key identity,
	Name VarChar(100),
	Description VarChar(500),
	MainCategory int References Categories(CategoryId)
)

Create Table Products
(
	ProductId int Primary Key Identity,
	StockQuantity int,
	Name VarChar(100),
	AddedDate Date,
	Description VarChar(500),
	UnitPrice Decimal(10,2),
	CategoryId int References Categories(CategoryId)
)

Create Table StockTransaction
(
	TranId int Primary Key Identity,
	TranDate Date,
	Type VarChar(20),
	QuantityChange int,
	Reference VarChar(100),
	ProductId int References Products(ProductId)
)

Create Table Suppliers
(
	SupplierId int Primary Key Identity,
	Name VarChar(100),
	Country VarChar(100),
	Email VarChar(100),
	Address VarChar(100),
	CountactNumber int
)

Create Table Products_Suppliers
(
	SupplierId int References Suppliers(SupplierId),
	ProductId int References Products(ProductId)
)

Create Table Customer
(
	CustomerID int Primary Key identity,
	FullName VarChar(100),
	PhoneNumber int,
	Email VarChar(100),
	ShipingAddress VarChar(200),
	RegidtraionDate Date
)

Create Table Reviews
(
	ReviewId int Primary Key Identity, 
	Rating int,
	Date Date,
	Comment VarChar,
	ProductId int References Products(ProductId),
	CustomerID int References Customer(CustomerID)
)

Create Table Orders
(
	OrderId int Primary Key Identity,
	Status VarChar(100),
	TotalAmount Decimal(10,2),
	OrderDate Date,
	CustomerId int References Customer(CustomerId)
)

Create Table OrderItems
(
	OrderItemId int Primary Key Identity,
	Quantity int,
	UniPrice Decimal,
	ProductId int References Products(ProductId),
	OrderId int References Orders(OrderId)
)

Create Table Payments
(
	PaymentId int Primary Key Identity,
	PaymentDate Date,
	Amount Decimal(10,2),
	Status VarChar(100),
	Method VarChar(200)
)

Create Table Orders_Payment
(
	OrderId int References Orders(OrderId),
	PaymentId int References Payments(PaymentId)
)

Create Table Shipments
(
	ShipmentId int Primary Key Identity,
	ShipmentDate Date,
	Status VarChar(100),
	DeliveryDate Date,
	CarrirName VarChar(100),
	TrackingNumber int,
	OrderId int References Orders(OrderId)
)