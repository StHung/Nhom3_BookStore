use master
go
create database BookStore
go
use BookStore
go
Create table [Category]
(
	[CategoryID] Varchar(20) NOT NULL,
	[CategoryName] Nvarchar(50) NOT NULL,
	[CategoryDescription] Nvarchar(200) NOT NULL,
Primary Key ([CategoryID])
) 
go

Create table [Book]
(
	[BookID] Varchar(20) NOT NULL,
	[PublisherID] Varchar(20) NOT NULL,
	[CategoryID] Varchar(20) NOT NULL,
	[Tittle] Nvarchar(150) NOT NULL,
	[Author] Nvarchar(50) NOT NULL,
	[ReleaseYear] Integer NULL,
	[NumberOfPages] Integer NULL,
	[Price] Decimal(18,0) NULL,
	[Description] Ntext NULL,
	[Dimension] Nvarchar(50) NULL,
	[Images] Nvarchar(150) NULL,
	[Quantity] Integer NULL,
Primary Key ([BookID])
) 
go

Create table [Account]
(
	[AccountID] Varchar(20) NOT NULL,
	[Username] Char(30) NOT NULL,
	[Password] Char(30) NOT NULL,
	[CustomerID] Varchar(20) NOT NULL,
Primary Key ([AccountID])
) 
go

Create table [Publisher]
(
	[PublisherID] Varchar(20) NOT NULL,
	[PublisherName] Nvarchar(100) NOT NULL,
	[Address] Nvarchar(150) NULL,
Primary Key ([PublisherID])
) 
go

Create table [Bill]
(
	[BillNo] Varchar(20) NOT NULL,
	[CartID] Varchar(20) NOT NULL,
	[PurchaseDate] Datetime NULL,
	[DeliveryMethod] Nvarchar(100) NULL,
	[PaymentMethod] Nvarchar(100) NULL,
	[DeliveryAddress] Nvarchar(500) NULL,
	[DeliveryState] Nvarchar(100) NULL
) 
go

Create table [Customer]
(
	[CustomerID] Varchar(20) NOT NULL,
	[CustomerName] Nvarchar(100) NOT NULL,
	[Gender] Nvarchar(10) NOT NULL,
	[DateOfBirth] Datetime NOT NULL,
	[PhoneNumber] Nchar(15) NOT NULL,
	[Email] Nchar(100) NOT NULL,
	[Address] Nvarchar(150) NOT NULL,
Primary Key ([CustomerID])
) 
go

Create table [ShoppingCart]
(
	[CartID] Varchar(20) NOT NULL,
	[CustomerID] Varchar(20) NOT NULL,
Primary Key ([CartID])
) 
go

Create table [CartDetails]
(
	[CartID] Varchar(20) NOT NULL,
	[BookID] Varchar(20) NOT NULL,
	[Amount] Integer NOT NULL,
Primary Key ([CartID],[BookID])
) 
go

Create table [Admin]
(
	[Email] Nvarchar(150) NOT NULL,
	[Username] Char(30) NOT NULL,
	[Password] Char(30) NOT NULL,
Primary Key ([Email])
) 
go


Alter table [Book] add  foreign key([CategoryID]) references [Category] ([CategoryID])  on update no action on delete no action 
go
Alter table [CartDetails] add  foreign key([BookID]) references [Book] ([BookID])  on update no action on delete no action 
go
Alter table [Book] add  foreign key([PublisherID]) references [Publisher] ([PublisherID])  on update no action on delete no action 
go
Alter table [ShoppingCart] add  foreign key([CustomerID]) references [Customer] ([CustomerID])  on update no action on delete no action 
go
Alter table [Account] add  foreign key([CustomerID]) references [Customer] ([CustomerID])  on update no action on delete no action 
go
Alter table [Bill] add  foreign key([CartID]) references [ShoppingCart] ([CartID])  on update no action on delete no action 
go
Alter table [CartDetails] add  foreign key([CartID]) references [ShoppingCart] ([CartID])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


