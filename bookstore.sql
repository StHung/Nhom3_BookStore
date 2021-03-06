USE master
GO
CREATE DATABASE [BookStore]
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[AdminAccount]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminAccount](
	[Username] [char](30) NOT NULL,
	[Password] [char](30) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[PhoneNumber] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillNo] [varchar](20) NOT NULL,
	[CartID] [varchar](20) NOT NULL,
	[PurchaseDate] [datetime] NULL,
	[DeliveryMethod] [nvarchar](100) NULL,
	[PaymentMethod] [nvarchar](100) NULL,
	[DeliveryAddress] [nvarchar](500) NULL,
	[DeliveryState] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [varchar](20) NOT NULL,
	[PublisherID] [varchar](20) NOT NULL,
	[CategoryID] [varchar](20) NOT NULL,
	[Tittle] [nvarchar](150) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[ReleaseYear] [int] NULL,
	[NumberOfPages] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [ntext] NULL,
	[Dimension] [nvarchar](50) NULL,
	[Images] [nvarchar](150) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CartID] [varchar](20) NOT NULL,
	[BookID] [varchar](20) NOT NULL,
	[Amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](20) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryDescription] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[PhoneNumber] [nchar](15) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Lock] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [varchar](20) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 8/8/2021 4:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [varchar](20) NOT NULL,
	[CustomerID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminAccount] ([Username], [Password], [FullName], [Email], [PhoneNumber]) VALUES (N'khuattien                     ', N'1                             ', N'Khuất Bá Tiến', N'khuattien@gmail.com', N'0123456789          ')
INSERT [dbo].[AdminAccount] ([Username], [Password], [FullName], [Email], [PhoneNumber]) VALUES (N'phamhung                      ', N'1                             ', N'Phạm  Thế Hùng', N'hung@gmail.com', N'0123456789          ')
GO
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD0115', N'C6940', CAST(N'2021-08-07T22:36:12.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 66, đường Giải Phóng, quận Hoàng Mai, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD0254', N'C8541', CAST(N'2021-08-07T22:41:03.670' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 200, phường Mai Dịch, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD0571', N'C7515', CAST(N'2021-08-07T21:57:51.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD0737', N'C2786', CAST(N'2021-08-07T22:07:00.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD1204', N'C2227', CAST(N'2021-08-07T22:05:34.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD1359', N'C7638', CAST(N'2021-08-07T21:55:42.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD1552', N'C0778', CAST(N'2021-08-07T22:06:51.120' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2146', N'C0466', CAST(N'2021-08-07T22:00:59.343' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2296', N'C5600', CAST(N'2021-08-07T21:46:44.803' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2393', N'C8021', CAST(N'2021-08-07T21:36:27.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2876', N'C9941', CAST(N'2021-08-07T21:48:11.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2922', N'C2125', CAST(N'2021-08-07T22:01:18.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2927', N'C4627', CAST(N'2021-08-07T21:58:01.157' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2970', N'C0243', CAST(N'2021-08-07T22:01:40.013' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD2993', N'C4202', CAST(N'2021-08-07T22:51:26.807' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 34, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD3067', N'C6717', CAST(N'2021-08-07T22:51:13.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 34, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD3106', N'C1427', CAST(N'2021-08-07T22:37:57.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 100, đường Trần Phú, quận Hà Đông', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD3721', N'C4692', CAST(N'2021-08-07T22:52:26.843' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 43, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD3759', N'C0095', CAST(N'2021-08-07T22:31:29.360' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 100, đường Láng, quận Đống Đa, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD4142', N'C6017', CAST(N'2021-08-07T22:49:23.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 200, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD4486', N'C1044', CAST(N'2021-08-07T21:46:27.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD4653', N'C3497', CAST(N'2021-08-07T21:46:54.327' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD4756', N'C3949', CAST(N'2021-08-07T22:01:29.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD4995', N'C8332', CAST(N'2021-08-07T21:57:35.857' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD5025', N'C2441', CAST(N'2021-08-07T22:32:51.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 200, quận Hoàng Mai, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD5364', N'C9365', CAST(N'2021-08-07T22:46:51.513' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 25, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD5617', N'C5017', CAST(N'2021-08-07T22:53:34.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 98, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6115', N'C8021', CAST(N'2021-08-07T21:34:21.870' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6171', N'C9649', CAST(N'2021-08-07T22:54:33.617' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 100, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6225', N'C4838', CAST(N'2021-08-07T22:06:07.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6227', N'C8021', CAST(N'2021-08-07T21:34:41.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6286', N'C2622', CAST(N'2021-08-07T22:43:54.110' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 12, đường Minh Khai, quận Hai Bà Trưng, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6427', N'C9223', CAST(N'2021-08-07T22:08:07.107' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6618', N'C0718', CAST(N'2021-08-04T10:39:12.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD6670', N'C0182', CAST(N'2021-08-07T21:55:49.787' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD7098', N'C6117', CAST(N'2021-08-07T22:34:16.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 1, đường Hoàng Quốc Việt, phường Mai Dịch, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD7334', N'C8914', CAST(N'2021-08-07T22:05:48.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD7367', N'C8021', CAST(N'2021-08-07T21:34:06.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD7536', N'C0903', CAST(N'2021-08-07T21:56:18.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD8148', N'C5496', CAST(N'2021-08-07T22:06:41.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD8446', N'C9831', CAST(N'2021-08-07T22:56:41.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 33, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD9833', N'C5882', CAST(N'2021-08-08T14:52:49.460' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đang giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD9879', N'C1199', CAST(N'2021-08-07T22:48:16.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 1, đường Tôn Thất Tùng, quận Đống Đa, HN', N'Đã giao')
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'HD9880', N'C0534', CAST(N'2021-08-04T09:52:19.000' AS DateTime), N'Giao hàng nhanh (GHN)', N'Thanh toán khi nhận hàng', N'số 24 Ngõ 136  ngách 51', N'Đã giao')
GO
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S001', N'NXB01', N'DM01', N'Từ điển bằng tranh - Thế giới động vật', N'JP Moon A', 2020, 28, CAST(69500 AS Decimal(18, 0)), N'Từ Điển Bằng Tranh - Thế Giới Động Vật (Việt Thư) - Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-the-gioi-dong-vat-viet-thu.jpg', 0)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S002', N'NXB01', N'DM01', N'Từ điển bằng tranh - Động vật dưới nước', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-dong-vat-duoi-nuoc.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S003', N'NXB01', N'DM01', N'Từ điển bằng tranh - Hoa, quả, rau củ ', N'JP Moon', 2021, 26, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-hoa-qua-rau-cu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S004', N'NXB01', N'DM01', N'Từ điển bằng tranh - Chữ cái và số đếm', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-chu-cai-va-so-dem.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S005', N'NXB01', N'DM01', N'Từ điển bằng tranh - Thế giới loài chim', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-the-gioi-loai-chim.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S006', N'NXB04', N'DM02', N'Đàm thoại', N'Võ Phiến', 2000, 332, CAST(106700 AS Decimal(18, 0)), N'"Tập sách này có ba phần.

Phần thứ nhất gồm các bài phỏng vấn: Tác giả đáp lời hoặc của báo chí, hoặc của các đài truyền thanh, truyền hình. Đây là những trao đổi ý kiến, là đối thoại thực sự. Riêng trong trường hợp Mai Thảo, ngoài hai lần đối đáp, còn có một điếu văn đọc trước mộ, tức những câu tiễn biệt không lời đáp.

Phần thứ hai gồm những suy tưởng dưới dạng đối thoại. Ở đây không có người hỏi thực sự: hình thức đối thoại dùng như một kỹ thuật, để mỗi ý kiến được lật qua lật lại, được cứu xét nhiều mặt cho thêm tận tường.

Phần thứ ba là mấy bức thư. Ở đây sự đối đáp không tiếng nói diễn ra trên trang giấy; các cuộc trao đổi ý kiến đều dùng chữ viết thay cho lời nói. Riêng bài "Cái viết lồng lộn" không phải thư gửi cho ai, mà là một bài viết phát sinh nhân lá thư "Cái viết hững hờ", nên cũng xin được kèm theo để tiện đối chiếu.

Đa số các bài trong sách này đã được in tản mác vào các tác phẩm xuất bản trước đây. Các bài khác chưa từng đưa vào sách nào. Lần đầu tiên, tất cả được xuất bản theo sự phân loại trong bộ toàn tập."

Trích NXB giới thiệu', NULL, N'sach-dam-thoai.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S007', N'NXB04', N'DM02', N'Đất nước quê hương', N'Võ Phiến', 1973, 279, CAST(106700 AS Decimal(18, 0)), N'Tùy bút - tùy hứng mà phóng bút - là một thể rất tự do, gặp gì chép nấy, nghĩ sao nói vậy. Một cơn mưa, một giọng hát, một hớp trà, một trang sách, một tà áo phất phơ dưới gió, một tiếng ve rỉ rả trong rừng... bất kì một cảnh vật nào, một sự việc nào, hễ gợi hứng cho ta cũng có thể là đề tài một thiên tùy bút. Nó tựa như nhật ký mà không phải là nhật ký, vì nó là "bút" chứ không phải là "ký"; nó tựa như nghị luận mà không phải là nghị luận, vì nó là tùy hứng suy đoán chứ không phải dụng ý biện luận.

Nó phóng túng như vậy nên ta tưởng là dễ, nhưng có viết thử mới thấy khó. Trước hết, nó phải thân mật, hấp dẫn như một câu chuyện thanh nhã giữa những bạn đồng điệu lúc ngồi bên một giàn hoa hay một ấm trà. Nó không cần dài - trung bình mươi trang trở lại - nhưng lời phải tự nhiên, có duyên, nội dung phải thay đổi, có ý vị.

Quan trọng nhất vẫn là nghệ thuật. Tiểu thuyết mà dở thì người ta vẫn gọi là tiểu thuyết, thơ mà dở thì cũng vẫn là thơ - thơ Con Cóc; còn tùy bút mà thiếu nghệ thuật thì không có tên để gọi vì lẽ không ai thèm nhắc tới, biết tới. Cho nên lựa thể tùy bút là làm một công việc mạo hiểm: chỉ có thành công hay thất bại; chứ không thể nhì nhằng được.

Ai cũng biết tài viết tiểu thuyết của Võ Phiến, nhưng theo tôi, tùy bút mới là thể dung nạp hết sở trường của ông, mới thật là đất cho ông dụng... văn.

Trong tập Đất Nước Quê Hương này, chúng ta gặp lại tài nhận xét tinh vi, miêu tả sắc bén của ông trong tiểu thuyết. Mấy trang ông tả cách nấu, rót và uống chè Huế làm ta liên tưởng đến Những chiếc ấm đất của Nguyễn Tuân: nghệ thuật không kém mà lại dí dỏm hơn, nhẹ nhàng hơn, có hương vị của quê hương hơn. Nhưng đoạn ông tả một chủ quán ăn bình dân ở Cần Thơ, đọc mới thấy mê. Ông nghe được một tiếng "rồi" câm thừa thãi, như để múa men, biểu diễn sự thích thú sau mỗi cử động của chủ quán, thì tôi phục ông quá.

Rồi những đoạn nên thơ về một đô thị hoang sơ, Gia Nghĩa: những "đàn én rộn ràng quấn quít trên nóc chợ", những tiến ve "rỉ rả thâm trầm như vừa kêu vừa suy ngẫm... bắt đầu phát ra riu rỉu, vươn dần lên; đến một lúc, tự thấy sắp trở nên ồn ào, nó giật mình tự hãm lại".

Tiểu thuyết, dù sao vẫn còn hơi gò bó, không thể dễ dàng chuyện nọ bắt qua chuyện kia được, cho nên chỉ trong tùy bút chúng ta mới được hưởng cái ngạc nhiên nghe Võ Phiến đương khen chiếc áo dài nhụ nữ ngày nay thì quay về chuyện Lê Quý Đôn bút đàm với sứ giả Triều Tiên ở Yên Kinh hai thế kỷ trước; hoặc đương nói về thuật đánh một lần mười hai cái trống ở Bình Định thì chuyển qua cách ăn bánh tráng. Giọng ông dí dỏm mà tình tứ: "Nếu quả Bình Định mất đi một điệu trống, phải đền lại một cái gì chứ? Chiếc bánh tráng nhé?"

Cũng chỉ trong tùy bút, ông mới thỏa chí phóng ngọn bút mỉa mai nhẹ nhàng mà thấm thía của ông được: ông kể lịch trình Nam tiến và Tây tiến của chiếc áo dài phụ nữ, rồi kết: "Thế cho nên chúng ta tin mạnh ở sự thành công cuộc thống nhất đất nước bằng chiếc áo dài. Nó êm thấm, đẹp đẽ hơn những đường lối thống nhất bạo tàn biết bao!; và làm sao chúng ta không mỉm cười khi ông bảo ở miễu bà Chúa Xứ (Châu Đốc) lễ bái đã được "hiện đại hóa"; không đau xót khi thấy ở một miền nọ - từ Cai Lậy tới Mộc Hóa - cờ nhiều hơn nhà, người đâu là có cờ đấy.

Sau cùng, cũng chỉ trong tùy bút ông mới có thể thỉnh thoảng đưa ra những suy đoán mà ông tự nhận trước là "vu vơ, liều lĩnh". Kể ra đôi khi ông cũng hơi "phiêu lưu" thật - thể tùy bút cho phép chúng ta như vậy - nhưng nhiều chỗ phải nhận rằng ông sâu sắc, như khi ông phân tích tâm lý nhà Nguyễn thiên vị với người Nam, cả với cây cỏ trong Nam hoặc khi ông bảo cuộc Nam tiến từ Bình Định vô Phú Yên, Khánh Hòa là "nhì nhằng" cho nên mới có ái tình Bình Phú (Bình Định-Phú Yên) trong ca dao. Nhiều suy diễn của ông về thơ, về ngôn ngữ, về cách đặt tên của người Thượng cũng làm cho tôi ngạc nhiên. Ông quả có óc tò mò, đọc nhiều và đi nhiều.

Năm 1969, vì ký tên trong một bản kiến nghị rất ôn hòa đòi bãi bỏ chế độ kiểm duyệt đối với ngành xuất bản, ông bị giải nhiệm. Về sau, các diễn biến của sự việc đã đưa ông đến một chức vụ khiến ông có dịp đi đây đi đó khắp trong nước. Nhờ vậy, ông ghi lại những cảm tưởng khi ở Bạc Liêu, Mộc Hóa khi ở Ban Mê Thuột, Bình Định... mà viết nên tập tùy bút này, phong phú hơn ba tập trước của ông nhiều. Vậy trong cái rủi vẫn thường có cái may. Và khi một nhà văn biết lợi dụng nghịch cảnh thì chẳng những có ích cho mình, mà còn có ích cho độc giả, cho văn hóa nữa. Đó cũng là một đề tài lý thú để ông viết tùy bút nữa đấy, ông Võ Phiến.

Sài gòn, ngày 25-3-73

Nguyễn Hiến Lê', NULL, N'sach-dat-nuoc-que-huong.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S008', N'NXB04', N'DM02', N'Đi vào cõi thơ', N'Bùi Giáng', 1969, 144, CAST(82000 AS Decimal(18, 0)), N'Đi Vào Cõi Thơ theo lối ngẫu nhiên tao ngộ. Cơ duyên sẽ dun dủi... Chẳng nên gò ép cưỡng cầu.

Người viết sách này có dụng tâm không sắp đặt theo thứ tự thứ loại thường thấy. Những bài thơ đến rồi đi. Lời "nhận định" cũng đi rồi đến...

BÙI GIÁNG

(Trích dẫn trong bài TỰA của tác giả)', NULL, N'sach-di-vao-coi-tho.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S009', N'NXB05', N'DM02', N'Bay đi những cơn mưa phùn', N'Phạm Công Thiện', 1970, 232, CAST(77600 AS Decimal(18, 0)), N'Hắn thổi những cơn mưa phùn qua khung cửa kính hiệu buôn thuốc lá và cà phê. Chỉ có đất Pháp này mới có những quán thuốc lá chuyên bán đủ loại thuốc hút, đồng thời bán phụ thêm cà phê và rượu đỏ: cà phê đen, rượu đỏ và thuốc bao xanh là ba dấu hiệu của đất Pháp: không có ba thứ này, nhất định nước Pháp sẽ không còn những cơn mưa phùn tháng tư. Hắn ngồi bên cạnh khung cửa kính, quán thuốc lá chỉ mang tên vỏn vẹn là tabac café express; quán thuốc nằm đối diện nghĩa địa. Chung quanh đều im lặng, thỉnh thoảng vài tiếng ho, tiếng cửa đẩy vào, tiếng gió rít vào từ những ngày quá khứ. Bây giờ là tháng tư? Thời gian là những tháng tư còn lại. Không, tháng mười rồi. Mưa bụi và lạnh, những cơn mưa phùn tháng mười ở ngoại ô Paris.

Hắn ho khan vài tiếng cho đỡ buồn; trời lạnh quá, im lặng quá, nhiều khi mình phải bày đặt ho khan để thấy rằng mình vẫn còn đó, vẫn sống, vẫn thở và thổi những cơn mưa phùn vào nghĩa địa của ngoại ô đầu thu. Đầu thu hay cuối thu? Đầu cuộc sống và cuối sự chết? A, tôi phải đi. Paris chỉ nằm bên kia sự chết: Saigon, Hànội, Huế, Đàlạt chỉ là những thành phố Paris nằm bên kia sự chết. Giết hết tất cả những thành phố, bôi sạch chữ Paris trong tâm hồn mình, bôi tên, quên họ, bỏ quốc tịch, vứt lại đằng sau lưng những con đường rầy, những đêm tối, những mùa xuân, những quê hương. Làm một kẻ phản quốc, phản bội bạn bè, phản bội tổ tiên, phản bội văn chương, phản bội tùy bút, truyện ngắn và truyện dài. Trung thành với nỗi chết xa và gần, nỗi chết long đong, nỗi chết của những cơn ho gượng, ho cho đỡ buồn. Chỉ có những cơn ho khan là quan trọng, tất cả còn lại chỉ là văn chương.

A, tôi phải đi. Vừa đi vừa ho. Tập ho cho thật nhiều, ho như chưa từng biết ho trong đời. Người ta ho lao và người ta muốn ho lao: tôi không muốn ho lao, tôi chỉ muốn ho khan cho bay đi những cơn mưa phùn tưởng tượng. Dưới kia thung lũng là cỏ khô. Một dấu chấm, một dấu phết, một dấu sắc và một dấu huyền. Tất cả còn lại...', N'13 x 18.8 cm', N'sach-bay-di-nhung-con-mua-phun.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S010', N'NXB05', N'DM02', N'Thomas Edison - Thiên tài bắt đầu từ tuổi thơ', N'Phạm Công Thiện', 2021, 206, CAST(61000 AS Decimal(18, 0)), N'Cuốn sách gồm những câu chuyện viết về cuộc đời của nhà sáng chế thiên tài Thomas Alva Edison. Ông là một trong những nhà phát minh giàu ý tưởng nhất trong lịch sử nhân loại, có tổng cộng đến 1.500 phát minh được cấp bằng sáng chế - một tượng đài khổng lồ.

Thuở thiếu thời, Edison theo học ngôi trường độc nhất trong thị trấn. Sau rất nhiều lần gây “tai họa” ở lớp bởi những tìm tòi thí nghiệm, cô giáo của Edison đã cho rằng cậu là một đứa trẻ hư hỏng, điên khùng và đần độn. Điều này đã khiến bà Nancy, mẹ của Thomas Edison hết sức tức giận, bà quyết định dạy con học tại nhà. Bà không chỉ dạy Edison về học vấn mà còn rèn luyện cho cậu một phẩm chất đạo đức tốt đẹp. Chính bà đã tạo nên một thiên tài phát minh làm thay đổi lịch sử nhân loại.
 ', NULL, N'sach-thomas-edison-thien-tai-bat-dau-tu-tuoi-tho.jpg', 9)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S011', N'NXB01', N'DM03', N'Hướng dẫn "sử dụng" tình yêu', N'Văn Thụy', 2021, 400, CAST(111000 AS Decimal(18, 0)), N'Hướng Dẫn "Sử Dụng" Tình Yêu  là cuốn “sách lược” tình cảm dành cho bạn, những người đang trên con đường tìm kiếm tình yêu, những người chìm đắm trong tình yêu, và cả những con người đang đau khổ vì tình yêu.
 

Chuyên gia phân tích tình cảm Vãn Thụy đã gài cắm vào mỗi trang trong Hướng Dẫn "Sử Dụng" Tình Yêu những cách thức và kế hoạch để giúp bạn xây dựng “chiến lược” đến với tình yêu ngọt ngào và thoát khỏi những mối quan hệ tình cảm tồi tệ, giúp bạn hiểu rõ những khía cạnh và cả những góc khuất tình yêu, từ đó mở rộng trái tim yêu thương và bao dung hơn để tận hưởng tình yêu, hoặc cho mình một đường lui đúng cách, đúng thời điểm.

Dù bạn là nam hay nữ, dù cho bạn trẻ hay già, dù bạn độc thân hay đang yêu đương, cuốn sách này sẽ chắc chắn sẽ “soi rọi” và “mở đường” cho bạn bước đi đến cái đích mang tên “hạnh phúc”.', NULL, N'sach-huong-dan-su-dung-tinh-yeu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S012', N'NXB05', N'DM03', N'Men chase women choose - Chuyện tình yêu bạn biết được bao nhiêu', N'Dawn Maslar', 2021, NULL, CAST(87000 AS Decimal(18, 0)), N'"Làm sao để người ấy chết mê chết mệt tôi?

Làm sao để người ấy không thể dứt bỏ tôi được?"

Khi bạn hiểu được cách mà tình yêu vận hành dưới góc độ khoa học - Men chase women choose, bạn sẽ thôi không đặt những câu hỏi vô nghĩa như vậy nữa, mà sẽ biến những mong ước trong tình yêu của bản thân trở thành sự thật.

Tâm lý sợ bị bỏ rơi, tổn thương từ những đổ vỡ khiến nhiều người lo lắng khi đứng trước tình yêu. Bởi chúng ta nghĩ tình yêu là cảm xúc, thất thường và khó nắm bắt. Nhưng thực ra, tình yêu đầy logic và khoa học.

Giống như tất cả các chu kỳ trong tự nhiên, tình yêu cũng có các giai đoạn phát triển nhất định để đi đến tình yêu đích thực - sự cam kết lâu dài. Chúng ta thường lầm tưởng rằng, não bộ và các hormone trong cơ thể chỉ tác động tới sự đam mê - giai đoạn thu hút và hẹn hò. Nhưng không! Chúng chi phối cả khi chúng ta đã bước vào giai đoạn thấu hiểu và cam kết.

Một khi bạn hiểu được quy luật men chase women choose, việc tìm kiếm và duy trì tình yêu sẽ trở nên dễ dàng hơn nhiều. Bạn sẽ hiểu được:

Tại sao người theo đuổi cần phải là phái mạnh? Phụ nữ có thể thả thính thoải mái nhưng sự chủ động hãy dành phần cho đàn ông! Bởi cảm giác yêu của nam giới chỉ có thể được hình thành qua quá trình chinh phục!

Tại sao nam và nữ lại có cách yêu và những nhu cầu trong tình yêu khác nhau? Hệ thống não Limbic (phụ trách chức năng cảm xúc) của đàn ông nhỏ xíu, bởi vậy nên bản năng của anh ấy là lý trí. Một cô gái thông minh hãy cho anh ấy biết yêu không chỉ là những màn ân ái vồ vập lấy nhau để rồi sau một "cuộc yêu", mỗi người lại trở về với thế giới đơn độc của riêng mình.

Tại sao yêu lâu tình yêu thường nhạt dần? Làm thế nào để giữ mãi ngọn lửa đam mê kể cả khi đã kết hôn lâu năm?

Testosterone và những “hormone tình yêu” khác chi phối tất cả các giai đoạn này! Thạc sĩ sinh học Dawn Maslar đã mang tới cho chúng ta cách áp dụng “khoa học về sự hấp dẫn” trong cuốn sách “Men Chase Women Choose - Chuyện Tình Yêu Bạn Biết Được Bao Nhiêu?" Đây không chỉ là một cuốn sách khoa học tình yêu đơn thuần mà còn là cuốn cẩm nang giúp bạn không còn bị cảm xúc chi phối hay đau khổ vì chuyện tình cảm!', NULL, N'men-chase-women-choose-chuyen-tinh-yeu-ban-biet-duoc-bao-nhieu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S013', N'NXB05', N'DM03', N'Chưa một lần đau sao gọi là tuổi trẻ', N'Từ Lỗi Tuyên', NULL, NULL, CAST(92000 AS Decimal(18, 0)), N'Tuổi trẻ là giai đoạn đẹp nhất của cuộc đời. Từ những cô bé, cậu bé vô lo vô nghĩ, chúng ta dần dần trở thành những thanh niên trưởng thành. Tuổi trẻ là chuyến hành trình một chiều, và những nỗi ưu phiền, rắc rối xoay quanh những vấn đề học tập, tình bạn, tình yêu, các mối quan hệ trong gia đình, nhà trường và ngoài xã hội luôn là một thế giới đầy những thử thách và thú vị. Chúng ta đều như những chú chim nhỏ háo hức bay ra ngoài kia khám phá thế giới, cho dù có bao nhiêu cay đắng, bao nhiêu vấp ngã, thì quá trình này vẫn luôn đầy ý nghĩa và đây chắc chắn sẽ là giai đoạn khó quên nhất trong cuộc đợi bạn.

Hãy mang theo cuốn sách này và lòng can đảm tiến về phía trước để có những trải nghiệm, cảm nhận và tìm ra lới giải cho những nỗi đau đớn mà bạn đang ôm giữ trong lòng.', NULL, N'teen.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S014', N'NXB04', N'DM03', N'Gửi người tôi yêu', N'Vũ Hoa', NULL, 554, CAST(84000 AS Decimal(18, 0)), N'Thời học cấp hai, trong một lần đụng phải xe đạp địa hình mà Hứa An Ly gặp Đường Lý Dục, một cậu học sinh học trên mình mấy lớp. Tình cảm trong trẻo lớn dần theo năm tháng.

Đường Lý Dục vào đại học B, tại Thanh Đảo. Hứa An Ly cũng nỗ lực thi vào đại học B. Tình yêu mà Hứa An Ly dành cho Đường Lý Dục vẫn tràn trề, nhưng phía Đường Lý Dục sau thời gian xa cách đã tìm thấy tình yêu với Thẩm Anh Xuân, một cô gái xinh đẹp, xuất thân trong gia đình giàu có, cha mẹ của Thẩm Anh Xuân đang sống bên Mỹ.

Hứa An Ly vì muốn quên Đường Lý Dục nên đã yêu Tần Ca. Nhưng đó chỉ là mối tình lấp đầy khoảng trống. Để chứng tỏ sự cao thượng của mình với Thẩm Anh Xuân, Hứa An Ly đã nhiều lần đấu tranh tư tưởng để quên Đường Lý Dục. Nhưng càng nỗ lực, cô càng thấy đau khổ.

Hứa An Ly đã quyết định dâng hiến cho Tần Ca để "dứt tình” với Đường Lý Dục. Có lẽ cuộc đời của Hứa An Ly đã yên phận và trở nên đẹp đẽ nếu Đường Lý Dục không bị tai nạn, nguy hiểm đến tính mạng, anh bị mất trí nhớ. Hứa An Ly đã bất chấp tất cả để quay về chăm sóc Đường Lý Dục, cô nhận ra tình yêu mình dành cho Đường Lý Dục thật mãnh liệt.

Đúng lúc cô và Đường Lý Dục đang ở bên nhau, Thẩm Anh Xuân từ Mỹ trở về.

Hứa An Ly, Thẩm Anh Xuân, liệu ai sẽ là người chiếm được trái tim Đường Lý Dục ở phần kết câu chuyện hấp dẫn này?', NULL, N'gui-nguoi-toi-yeu-biatruoc.gif', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S015', N'NXB01', N'DM01', N'Hồ ly biết yêu', N'Diệp Lạc Vô Tâm', NULL, 476, CAST(107000 AS Decimal(18, 0)), N'Nàng là hồ ly, vốn thuộc về ma giới - nơi quanh năm suốt tháng chìm trong mây mù, dù thần tiên cũng không thể đi vào; chàng là thần tiên, là mặt trời chiếu sáng cho muôn loài, được thế gian muôn đời sùng bái.

Luật trời viết rằng, thần tiên và yêu ma không thể ở bên nhau. Nhưng trái tim nàng mách bảo rằng, ngoài chàng ra, nàng không muốn ở bên bất cứ một người nào khác.

Số mệnh đã định, rằng nàng sinh ra để làm chủ nhân của ma giới, nhưng nàng chỉ muốn làm chủ nhân của trái tim chàng.

Liệu có một ngày, vầng dương kia thôi chiếu sáng, để trở thành một phu quân bình thường của hồ ly? Liệu có một ngày, hồ ly kia không còn chống lại số mệnh nữa, chấp nhận làm phu nhân của ma vương? Liệu có một ngày, ma giới kia không còn u ám nữa, để ánh dương chiếu tỏ?

Bất kể thế nào, hồ ly cũng tin rằng, dù nàng không còn gì cả, ánh dương vẫn chỉ thuộc về mình nàng mà thôi. Có hồ ly, ánh dương kia càng thêm rực rỡ. Có vầng dương, hồ ly… lần đầu biết yêu…', NULL, N'ho-ly-biet-yeu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S016', N'NXB03', N'DM05', N'Bí ẩn mãi mãi là bí ẩn - Nền văn minh cổ đại', N'Tony Hưng', NULL, NULL, CAST(46000 AS Decimal(18, 0)), N'Quá khứ nhân loại với bao bí ẩn chưa khám phá, tồn tại quanh ta. Giới khảo cổ quan tâm đến việc tìm ra lời đáp lịch sử của nhân loại và nghiên cứu bí ẩn của quá khứ. Chúng ta nghiên cứu về con người, địa điểm và sự kiện qua huyền thoại và truyền thuyết đã không còn nữa - hoặc có lẽ đã không hề tồn tại ngoại trừ trong khả năng tưởng tượng của con người. Tổ tiên lâu đời của chúng ta từ nơi nào đến, chúng ta tiến hóa và phát triển ra sao? Chúng ta tự hỏi điều gì đã diễn ra đối với các đế quốc thành công và rõ ràng bất khả chiến bại lại có thể đột nhiên sụp đổ và biến mất, chúng ta cũng không thể hiểu ông cha của mình đã xây dựng các công trình tưởng niệm đồ sộ nhất bằng cách nào và tại sao.Cuốn sách cung cấp đầy đủ các thông tin về các bí ẩn lớn của thế giới cổ đại như: Thành Troy, văn minh Chan Chan, nền văn minh Hy Lạp, v.v... và các thông tin về các cổ vật bí ẩn.', NULL, N'trat-tu-the-gioi-12.jpg', 1000)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S017', N'NXB02', N'DM01', N'Kỳ quan thế giới', N'Joan Ricart', NULL, NULL, CAST(424000 AS Decimal(18, 0)), NULL, NULL, N'sach-ky-quan-the-gioi.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S018', N'NXB05', N'DM05', N'Bí ẩn của lịch sử', N'Nuria Cicero', NULL, 255, CAST(424150 AS Decimal(18, 0)), NULL, NULL, N'sach-bi-an-cua-lich-su.jpg', NULL)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S019', N'NXB03', N'DM05', N'Lịch sử thế giới', N'Nguyễn Hiền Lê, Thiên Giang Trần Kim Bảng', NULL, 848, CAST(175000 AS Decimal(18, 0)), N'Bộ Lịch Sử Thế Giớicó trên tay bạn đọc là một tác phẩm hợp soạn của hai tác giả: Nguyễn Hiền Lê (1912-1984), Thiên Giang Trần Kim Bảng (1911-1985) xuất bản từ những năm 1954-1955 tại Sài Gòn - sách chỉ in có một lần - và gần 9 năm sau (1964) mới được tái bản bởi vì "vài uẩn khúc" của nó. Hiện nay bộ sách gần như tuyệt bản. 

Đây là một bộ sách phổ thông được viết bởi một sử quan khoáng đạt mà nhiệt tâm, cộng với phương pháp khoa học chính xác. Bởi các lý do vừa nêu, nhà xuất bản chúng tôi xin phép gia đình tác giả cho in lại bộ sách này nhằm giúp độc giả có thêm tài liệu tham khảo.', NULL, N'lich-su-the-gioi.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S020', N'NXB02', N'DM05', N'Trật tự thế giới', N'Henry Kissinger', NULL, 474, CAST(167000 AS Decimal(18, 0)), N'Trong tác phẩm, Kissinger xuất phát từ Hòa ước Westphalia để phân tích về tương quan giữa các nước, chủ yếu là các cường quốc và các khu vực giữ một vai trò đặc biệt đối với bức tranh địa chính trị thế giới, với những khác biệt trong thế giới quan và vị trí địa lý đã ảnh hưởng đến chính sách ngoại giao của mỗi nước như thế nào. Tác giả dành chương cuối (chương 9) để bàn về vấn đề toàn cầu hoá trong thời đại khoa học công nghệ, đặc biệt là tin học và truyền thông đại chúng lan tràn đã tác động mạnh mẽ đến dư luận, các nhà lãnh đạo và các quyết định chính trị hiện nay.

Theo cách nhìn của Kissinger thì trật tự thế giới ngày nay cần được đặt trên hai yếu tố căn bản:

1. Nguyên tắc tôn trọng chủ quyền của mỗi quốc gia có tính chính danh dựa trên căn bản của các hiệp ước và tổ chức quốc tế;
2. Và để đảm bảo duy trì hòa bình và ổn định trên thế giới cũng như các khu vực, cần phải dựa trên một sự cân bằng quyền lực mà chủ yếu phụ thuộc vào các cường quốc thế giới và khu vực.

Để có một trật tự quốc tế tồn tại và bền vững, Kissinger cho rằng nó phải liên quan đến “quyền lực có tính chính danh.” Tới cuối cùng, Kissinger, con người thực tế và nổi tiếng, lại có vẻ duy tâm đến mức ngạc nhiên. Thậm chí khi có những sự xung đột giữa các giá trị Mỹ và các mục tiêu khác, ông khích lệ chúng ta hãy tiếp tục đứng lên vì những giá trị đó, không lẩn tránh; đi đầu trong việc trợ giúp các quốc gia dân tộc, các lực lượng chính danh, chứ không chỉ các chính phủ đơn độc, nếu những sự trợ giúp ấy đảm bảo cho cán cân quyền lực có thể chống đỡ trật tự quốc tế, cũng như những giá trị và nguyên tắc của chúng ta có thể được những người khác chấp nhận và hấp dẫn họ.', NULL, N'trat-tu-the-gioi-12.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S021', N'NXB06', N'DM01', N'Đồng dao cho bé', N'Nhã Uyên', 2021, 128, CAST(95000 AS Decimal(18, 0)), N'Đồng dao cho bé tập nói, giúp bé phát triển ngôn ngữ, khả năng tư duy, khả năng nhận biết xung quanh.

Ngay từ năm đầu đời, bé có thể bập bẹ những tiếng nói đầu tiên. Theo thời gian, ngôn ngữ của bé càng được hoàn thiện và phát triển. Đọc sách cho bé nghe để khuyến khích bé tập nói là một trong những phương pháp tối ưu giúp bé phát triển ngôn ngữ.

Cuốn đồng dao là thơ ca dân gian truyền truyện dành cho trẻ em, gồm nhiều thể loại như các câu hát trẻ em, hát ru, hát vè… Các bài đồng dao gắn liền với các trò chơi trẻ em, mang tính tập thể. Không chỉ là trò chơi vui mang tính rèn luyện thể chất, óc phán đoán mà đồng dao còn có giai điệu tươi vui, giàu hình ảnh ẩn chứa nhiều giá trị giáo dục. Đồng dao giúp trẻ phát triển khả năng ngôn ngữ, góp phần giáo dục nhân cách, tăng khả năng quan sát, rèn luyện trí thông minh, nhận biết xung quanh, tăng năng lực miêu tả và diễn đạt. Cuốn sách với nhiều hình ảnh minh họa sinh động cùng với các bài đồng dao được chọn lọc sẽ giúp trẻ phát triển khả năng ngôn ngữ và hiểu biết thêm về cuộc sống xung quanh.', N'27 x 19', N'sach1.jpg', 14)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S022', N'NXB06', N'DM01', N'Thế giới khủng long', N'Hải Phạm', 2021, 36, CAST(46000 AS Decimal(18, 0)), N'Trong tiếng Anh, từ vựng Thế giới khủng long rất phong phú, đã bao giờ bé nghĩ mình đã biết từ vựng về động vật một cách đầy đủ chưa. Với các loài động vật chắc hẳn ai cũng nhìn thấy chúng, nhưng các bé có nhớ tên chúng bằng tiếng Anh không?

Những bức ảnh sặc sỡ cùng các khung hình sống động sẽ tái hiện lại cuộc sống Thế giới khủng long, đồng thời giúp bé phát triển kĩ năng quan sát, xây dựng vốn từ vựng tiêng Anh phong phú về Thế giới khủng long.

Bé sẽ yêu thích việc học tiếng Anh khi những bài bài học và hình ảnh minh họa vô cùng lôi cuốn, vì vậy cuốn sách Từ Điển Bằng Hình - Thế Giới Khủng Long được thiết kế vô cùng sáng tạo, hình ảnh bắt mắt sống động, để truyền tải các bài học một cách sinh động, dễ thương, hấp dẫn... tuyệt vời phải không các bé?', N'29.5 x 20.5 ', N'sach2.jpg', 31)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S023', N'NXB06', N'DM01', N'10  vạn câu hỏi vì sao', N'Trịnh Diên Tuệ', 2020, 320, CAST(132000 AS Decimal(18, 0)), N'Tuổi thơ là khoảng thời gian đẹp nhất trong cuộc đời của mỗi con người. Đứng trước thế giới với muôn điều kỳ diệu chúng ta luôn khát khao được khám phá bằng vô vàn những câu hỏi “Vì sao”. Vì sao bạn chuồn chuồn khi bay lại hay chạm mặt nước? Vì sao trời lại mưa? Vì sao chỉ trời  mưa mới có sấm và chớp mà trời nắng lại không có? Vì sao mặt trăng lúc thì giống lưỡi liềm, lúc lại giống chiếc đĩa tròn? Vì sao chim lại có thể bay được mà con thì không? Vì sao cá lại có thể bơi dưới nước?...

Tất cả các câu trả lời sẽ có trong bộ 10 cuốn 10 vạn câu hỏi vì sao dành cho thiếu nhi, với các chủ đề khác nhau:

- Ô tô, tên lửa và người máy

- Chim yến, chuồn chuồn và đom đóm

- Cá ngựa, chim cánh cụt và cá sấu

- Mặt trời, mặt trăng và gió mưa

- Đại dương, sông ngòi và núi cao

- Bạn bè, trường mầm non và ngày lễ

- Đôi mắt, mồ hôi và giấc mơ

- Cây cỏ, lá và hoa

- Gấu trúc, voi và kiến

- Vệ sinh, sức khỏe và thói quen tốt', N'23 x 17', N'sach3.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S024', N'NXB06', N'DM01', N'Trẻ con hát, trẻ con chơi', N'Ngô Mạnh Quỳnh', 2018, 28, CAST(21000 AS Decimal(18, 0)), N'Dung dăng dung dẻ,
Dắt trẻ đi chơi.
Đến cửa nhà trời,
Lạy cậu lạy mợ,
Cho cháu về quê,
Cho dê đi học,
Cho cóc ở nhà,
Cho gà bới bếp,
Ngồi xệp xuống đây!

Những bài đồng dao gắn với trò chơi dân gian quen thuộc trong cuốn sách nhỏ đáng yêu này sẽ mang đến cho các em nhỏ những giờ chơi thú vị. Phần hướng dẫn chơi và tranh minh họa giúp các em hình dung cụ thể về mỗi trò để có thể thực hành chơi cùng bè bạn.', N'19x26', N'sach4.jpg', 16)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S025', N'NXB06', N'DM01', N'Tớ là nhà chế tạo robot', N'Bob Katovich', 2021, 140, CAST(100000 AS Decimal(18, 0)), N'Với các thí nghiệm thú vị như “Robot tập vẽ”, “Robot dọn dẹp”, “Robot đi bằng hai chân…, các nhà khoa học nhí không chỉ học được cách thiết kế, chế tạo, lắp ráp các mô hình robot để tạo ra những sản phẩm thú vị, mà các em còn học được cách để phát triển khả năng tư duy.

Với việc áp dụng phương pháp học STEAM hiện đại, các em sẽ được học và thực hành ở 5 lĩnh vực: Science – Khoa học, Technology – Công nghệ, Engineering – Kỹ thuật, Arts – Nghệ thuật và Mathematics – Toán học. Việc học kết hợp nhiều môn giúp các em nắm được kiến thức đa dạng mà không bị nhàm chán, đồng thời phát huy được khả năng sáng tạo để vận dụng trong học tập cũng như cuộc sống.', N'20.5 x 20.5', N'sach5.jpg', 5)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S026', N'NXB07', N'DM14', N'Con rồng cháu tiên', N'Trần Bạch Đằng', 2021, 78, CAST(115000 AS Decimal(18, 0)), N'Hai huyền sử đời Hùng là Con rồng cháu tiên và Thánh Gióng, được thể hiện qua giọng văn kể chuyện và tranh màu.', N'không', N'sach6.jpg', 17)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S027', N'NXB07', N'DM05', N'Bí ẩn các địa danh', N'Hoàng Thuý ,  Trần Thọ Xương', 2021, 32, CAST(25000 AS Decimal(18, 0)), N'"Tủ sách khám phá" mang đến cho các em thiếu nhi những kiến thức tuyệt vời và thú vị, qua đó các em sẽ biết thêm những điều bổ ích, làm phong phú vốn kiến thức cho mình.
', N'17x24', N'sach7.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S028', N'NXB08', N'DM02', N'Tục ngữ ca dao Việt Nam', N'Mã Giang Lân', 2019, 254, CAST(60000 AS Decimal(18, 0)), N'Kho tàng tục ngữ cao dao Việt Nam luôn là cái nôi gửi gắm bao điều hay lẽ phải của ông cha ta đối với thế hệ sau này. Tục ngữ ca dao miểu tả những phong tục tập quán và nết ăn ở của ông cha ta qua lời ăn tiếng nói bằng nhịp điệu, những vần thơ khắc họa tình tình còn người,khơi dậy trong con người tình cảm lứa đôi,tình yêu gia đình và đặc biệt là tình yêu quê hương đất nước.

Với ngôn ngữ mộc mạc, rất đời thường nhưng tô điểm rất đậm nét các vấn đề xã hội được thể hiện qua sự truyền miệng, xuất hiện nhiều dị bản khác nhau, nhưng ca dao tục ngữ vẫn không mất ý nghĩa vốn có của nó', N'14 x 21', N'sach8.jpg', 30)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S029', N'NXB09', N'DM03', N'50 típ hẹn hò', N'Mộc Miên', 2017, 50, CAST(44000 AS Decimal(18, 0)), N'50 tips for girls gồm các cuốn: 50 tips du lịch dành cho các bạn gái, 50 tips giúp bạn gái vượt qua thất tình, 50 tips hẹn hò thành công, 50 tips cho những người yêu lần đầu được biên soạn như một món quà dành tặng cho các bạn gái, với một mong muốn là giúp các bạn gái thực sự biết trân trọng mình, biết cách khiến mình hạnh phúc và tận hưởng những điều cuộc sống đã ban tặng cho mình.

“Phụ nữ nên hiểu rằng, mọi chuyện đều phải dựa vào bản thân, đừng bao giờ hoang đường cho rằng có thể dựa dẫm bất kỳ ai. Tiền, tự mình làm ra. Yêu, tự bản thân yêu lấy chính mình. Hạnh phúc, tự mình cảm nhận. Nếu như có ai đó tặng tiền, tặng tình yêu, tặng hạnh phúc cho bạn, vậy thì cũng tốt. Nhưng bạn vẫn phải tự mình tạo lập cuộc sống cho bản thân. Cuộc đời của bạn, chính là thuộc về bạn. Về mặt tinh thần, tốt nhất đừng để người khác chi phối. Và tuyệt đối đừng bao giờ trao quyền làm chủ cuộc đời bạn vào tay bất kỳ ai.”

Trong cuộc hẹn, đương nhiên bạn và người ấy sẽ trao đổi, chia sẻ nhiều vấn đề để tìm hiểu lẫn nhau. Bạn cần ghi nhớ: đừng như chiếc loa phát thanh với phương thức truyền thông một chiều. Bạn sẽ làm cho người kia cảm thấy choáng ngợp và mệt mỏi.

Lần đầu hẹn hò, ai cũng cần thể hiện bản thân, song muốn người ấy có thiện cảm với mình không đồng nghĩa với việc bạn cứ “thao thao bất tuyệt” mà không để ý đến thái độ của người khác. Nếu bạn nói quá nhiều, lấn lướt anh ấy, anh ấy sẽ cho rằng bạn là một người theo “chủ nghĩa cá nhân”, cảm thấy khó chịu và dần mất hứng, không muốn đối thoại cùng bạn nữa. Cuộc hẹn sẽ thất bại hoàn toàn. Do đó, cách tốt nhất là bạn không nên độc thoại và nói quá nhiều trong lần hẹn đầu tiên.', N'15 x 15', N'sach9.gif', 45)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S030', N'NXB08', N'DM03', N'Yêu là đủ', N'Tizi Đích Lép', 2019, 176, CAST(88000 AS Decimal(18, 0)), N'“Em không cần người tuyệt vời nhất thế giới, em chỉ cần anh, người khiến cả thế giới của em trở nên tuyệt vời”

Cho những ai từng mất đi niềm tin vào tình yêu
Cho những hạnh phúc tưởng chừng không còn nữa
Cho một mùa hè đầy ngọt ngào và yêu thương

Đôi khi bạn nghĩ rằng “Yêu là đủ” để người ta có thể cùng nhau đi đế cuối đời nhưng lại giật mình khi người bên cạnh đã bỏ đi mất.
Đôi khi bạn cảm thấy hoang mang không biết liệu có đủ can đảm để đi tìm một tình yêu mới sau những đổ vỡ của quá khứ.', N'12,5x20', N'sach10.gif', 5)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S031', N'NXB10', N'DM04', N'Từ điển Tiếng Việt', N'Thái Xuân Đệ', 2020, 744, CAST(49000 AS Decimal(18, 0)), N'Từ Điển Tiếng Việt (65000 Từ) là cuốn từ điển giúp người học và sử dụng Tiếng Việt thêm hiểu biết, trân trọng, yêu mến tiếng Việt. Đồng thời nâng cao khả năng sử dụng tiếng Việt trong học tập cũng như trong thực tiễn và viết.

Chúng tôi hi vọng rằng cuốn từ điển này sẽ là tài liệu thiết thực, là người bạn đồng hành với tất cả những ai đang hằng ngày sử dụng  tiếng Việt, cũng như với những ai đang trên đường học tập, trau dồi tiếng Việt mỗi ngày một tốt hơn.', N'10 x 15', N'sach11.jpg', 14)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S032', N'NXB10', N'DM04', N'Từ điển Oxford', N'Oxford University', 2015, 852, CAST(432000 AS Decimal(18, 0)), N'Oxford American Dictionary For Learners Of English With CD-ROM Pack offer students a dictionary that is just right for their level. Written specifically for students working to improve their English language skills, these dictionaries support English learners, struggling readers, and special education students with Basic to Advanced levels. Based on extensive research with U.S. teachers and language-learning experts, these three new dictionaries help students

Transition from picture dictionaries more easily by using words they can understand for definitions and using illustrations for more difficult words.

Learn content area words from math, chemistry, biology, geography, etc.', N'không', N'sach12.jpg', 120)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S033', N'NXB10', N'DM04', N'Từ điển Anh - Việt', N'The Oxford Dictionary', 2018, 1128, CAST(86000 AS Decimal(18, 0)), N'
► Trong cuộc sống hội nhập ngày nay, ngoài kỹ năng thành thạo trong công việc, mỗi người nên trang bị cho mình vốn ngoại ngữ cơ bản để phục vụ tốt hơn cho công việc cũng như giao tiếp. Tiếng Anh đã trở thành ngôn ngữ chung mà nhiều quốc gia sử dụng. Vì vậy việc học tập tiếng Anh là điều rất cần thiết. Cuốn sách này sẽ cung cấp đến bạn đọc:
Từ ngữ thông dụng.
Bổ sung nhiều từ chuyên ngành.
Trình bày đơn giản, rõ ràng.
Tiện dụng trong tra cứu, dịch thuật.
►Để phục vụ cho nhu cầu học ngoại ngữ, từ điển là công cụ hữu dụng tuyệt vời, không thể thiếu cho việc tra cứu và học tập.
►Hy vọng cuốn từ điển này sẽ đáp ứng được nhu cầu học tập ngày càng cao của độc giả.', N'không', N'sach13.jpg', 28)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S034', N'NXB10', N'DM06', N'Ôn luyện Tiếng Anh lớp 9', N'Lâm Quốc Phát ,  Vũ Vạn Xuân', 2020, 247, CAST(102000 AS Decimal(18, 0)), N'Nhằm mục đích cũng cố vững chắc nền tảng kiến thức tiếng Anh bậc THCS cho các em học sinh, giúp các em chuẩn bị tốt cho Kỳ thi Tuyển sinh vào lớp 10 năm học 2018-2019, nhóm tác giả đã biên soạn bổ sung cuốn sách Ôn Luyện Tiếng Anh Lớp 9 Theo Hướng Ứng Dụng Thực Tế

Cuốn sách có những cải tiếng đáng chú ý như sau:

- Nội dung sách được trình bày hoàn toàn bằng tiếng anh, nhằm mục đích nâng cao năng lực của chính quý thầy cô trên lớp, qua đó truyền tải được cảm hứng học tập cho học sinh để mọi người cùng ý thức được việc học là quá trình phấn đấu suốt cuộc đời.
- Các bảng từ vựng ở mỗi bài được thiết kế theo hướng học tập chủ động, mức độ từ nhận biết đến thông hiểu và vận dụng, loại bỏ hoàn toàn cách học theo kiểu "truy bài", giúp các bậc phụ huynh xác định được đúng năng lực của học sinh để có chiến thuật phù hợp khi đăng ký các nguyện vọng vào các trường THPT.
- Số lượng đề tham khảo nhiều và chất lượng, phù hợp cả hai đối tượng học sinh dự thi THPT và THPT chuyên của thành phố Hồ Chí Minh.', N'19 x 26', N'sach14.jpg', 150)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S035', N'NXB10', N'DM06', N'Đường mưa mây trắng', N'Thích Nhất Hạnh', 2017, 30, CAST(104000 AS Decimal(18, 0)), N'Tác phẩm kể chuyện về cuôc đời Đức Phật Thích Ca qua con mắt của chú bé chăn trâu Svasti, sau xuất gia trở thành 1 vị đệ tử của Phật. Đây là một thiên hùng ca  bày tỏ lòng ngưởng mộ đối trước lối sống gương mẩu đầy những hành vi và mục đích cao cả, to lớn . thu hút bạn đọc bởi nhân cách vĩ đại của Đức Phật Thích Ca qua con mắt nhìn của thầy Thích Nhất Hạnh. 
Cuốn sách này là cuốn sách bán chạy ở Bắc Mĩ và được dịch  ra hơn 20 thứ tiếng trên thế giới trong đó có Hindu. Vì vậy Tỉ Phú Ấn Độ Bhupendra Kuman Modi sau khi đọc qua cuốn Đường Xưa Mây Trắng đã trả lời với phóng viên báo Hollywood Reporter :''tôi tìm được Đường Xưa Mây Trắng  từ 2 năm nay , cuốn sách đã thay đổi cuộc đời tôi nên tôi phải chia sẻ hạnh phúc ấy cho cả thế giới''. và ông tài trợ 120 triệu USD để các nhà sản xuất dựng cuốn sách này thành phim. ', N'không', N'sach15.jpg', 205)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S036', N'NXB11', N'DM06', N'Khéo ăn nói sẽ có được thiên hạ', N'Trác Nhã', 2017, 344, CAST(88000 AS Decimal(18, 0)), N'Trong xã hội hiện đại ngày nay, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. 

"không biết ăn nói, đụng đâu hỏng đấy"
"Biết ăn nói, làm gì thuận đấy"
"Khéo ăn nói, muốn gì được đấy"

Vậy thế nào là biết ăn nói, có phải là bạn nói năng lưu loát, không ấp a ấp úng thì được gọi là biết ăn nói hay không. Cuốn sách này sẽ giúp bạn tìm được câu trả lời. Điểm cốt lõi là nói chuyện cho có hồn, đúng trọng tâm và đúng thời điểm. ', N'16x23', N'sach16.jpg', 68)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S037', N'NXB11', N'DM14', N'Sherlock Homles toàn tập', N'Arthur Conan Doyle', 2017, 1818, CAST(310000 AS Decimal(18, 0)), N'Sherlock Holmes là một nhân vật thám tử hư cấu vào cuối thể kỉ 19 và đầu thế kỉ 20, xuất hiện lần đầu trong tác phẩm của nhà văn Arthur Conan Doyle xuất bản năm 1887. Ông là một thám tử tư ở Luân Đôn nổi tiếng nhờ trí thông minh, khả năng suy diễn logic và quan sát tinh tường trong khi phá những vụ án mà cảnh sát phải bó tay. Nhiều người cho rằng Sherlock Holmes là nhân vật thám tử hư cấu nổi tiếng nhất trong lịch sử văn học và là một trong những nhân vật văn học được biết đến nhiều nhất toàn thế giới.Sherlock Holmes đã xuất hiện trong 4 tiểu thuyết và 56 truyện ngắn của nhà văn Conan Doyle. Hầu như tất cả các tác phẩm đều được viết dưới dạng ghi chép của bác sĩ John H. Watson, người bạn thân thiết và người ghi chép tiểu sử của Sherlock Holmes, chỉ có 2 tác phẩm được viết dưới dạng ghi chép của người thứ ba. Hai tác phẩm đầu tiên trong số này là 2 tiểu thuyết ngắn và được xuất hiện lần đầu tiên trên tờ Beeton''s Christmas Annual vào năm 1887 và tời Lippincott''s Monthly Magazine vào văm 1890. Thám tử Holmes trở nên cực kì nổi tiếng khi loạt truyện ngắn của Conan Doyle được xuất bản trên tạp chí The Strand Magazine năm 1891. Các tác phẩm được viết xoay quanh thời gian từ năm 1878 đến năm 1903 với vụ án cuối cùng vào năm 1914.', N'13.5 x 20.5', N'sach17.jpg', 36)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S038', N'NXB11', N'DM09', N'Tâm lý học tính cách', N'Trâu Hoành Minh', 2021, 312, CAST(87000 AS Decimal(18, 0)), N'Quyển sách giúp bạn đọc khám phá ngay:
 
Nhập môn chín kiểu hình tính cách
Giúp phán đoán kiểu hình tính cách của chính mình
Nhìn thấu bản thân trong công việc, tình yêu và các mối quan hệ xã hội.

Trên thế giới này, có ai không quan tâm tới tính cách của mình? Chúng ta luôn muốn biết về tính cách của mình càng nhiều càng tốt.

Chắp bút bởi chuyên gia trong lĩnh vực tâm lý học - tiến sĩ Trâu Hoàng Minh, cuốn sách sẽ giới thiệu tới bạn đọc những tri thức và kĩ năng cần thiết trong việc phân tích tính cách con người.', N'14.5 x 20.5', N'sach18.jpg', 39)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S039', N'NXB12', N'DM11', N'Giải mã', N'Lê Hoài Ân ,  Peter Pham', 2020, 140, CAST(132000 AS Decimal(18, 0)), N'Giải Mã là sự bổ sung và cập nhật những kiến thức mới phù hợp với sự thay đổi thực tế của thị trường. Tất cả điều này kết hợp với sự thành công về nội dung trong cuốn sách "Giải mã" (xuất bản 2019) đã tạo nên một tác phẩm hoàn chỉnh, thức thời với mỗi sự thay đổi của nền kinh tế, và có ý nghĩa về nhiều mặt đối với mỗi nhà đầu tư.

“Giải mã”  hân hạnh mang đến cho độc giả:

-    Sự thay đổi trong nhận thức, mô hình phân tích giúp bạn nhìn nhận tường tận một vấn đề qua lăng kính tư duy đa chiều.

-    Góc nhìn nhạy bén, chuyên sâu về cấu trúc nền kinh tế các quốc gia Châu Á, trong đó có Việt Nam.

-    Khám phá độc đáo, thú vị về sự kết hợp giữa tư duy phân tích kinh tế và quá trình ra quyết định đầu tư.

-    Mối liên hệ mật thiết giữa kinh doanh, đầu tư và để lại di sản gia đình sẽ được kết nối xoay quanh vấn đề quản lý nợ.', N'15 x 23', N'sach22.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S040', N'NXB11', N'DM09', N'Trở thành CEO của cuộc đời mình', N'	 Thôi Thôi', 2021, 208, CAST(73000 AS Decimal(18, 0)), N'Rất nhiều người lí giải “quản lí” là một cách tiến lên, thể hiện sức mạnh. Cảm giác này khiến cho rất nhiều người chùn bước. 

Hoàn toàn trái ngược, quản lí được nói đến trong cuốn sách này lại là nghệ thuật lùi bước. Trong rất nhiều trường hợp, mất kiểm soát, mâu thuẫn không thể đối mặt thì hãy dừng lại, lùi một bước, dùng tư duy “quản lí”, chúng ta sẽ có thể nhìn nhận ra nhiều điều hơn, từ đó mọi thứ trở nên cân bằng, tốt đẹp hơn. Thế giới luôn ngập tràn những điều bất ngờ, có khi nó ưu ái chúng ta, có khi lại rất tàn nhẫn, cách đối phó duy nhất chính là nỗ lực nâng cao sự chắc chắn trong tiềm thức của mình.  ', N'20.5 x 14.5', N'sach19.jpg', 14)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S041', N'NXB12', N'DM16', N'Đồ giải kinh lạc huyệt vị nam giới', N'Hoàng Anh Tuấn ,  Hoàng Duy Tân', 2020, 65, CAST(96000 AS Decimal(18, 0)), N'Đồ Giải Kinh Lạc Huyệt Vị Nam Giới giới thiệu hệ thống kinh mạch ở nam giới gồm 12 đường kinh chính xếp theo thứ tự tuần hoàn kinh khí. Ngoài ra còn có hệ thống huyệt bên ngoài đường kinh: Kinh ngoại kỳ huyệt, Nhĩ huyệt, Khu phản xạ ở bàn tay.

Trong mỗi hệ thống kinh lạc, toàn bộ huyệt vị đều được giới thiệu trên các phương diện tên gọi, vị trí và chủ trị, đồng thời kèm theo hình ảnh minh họa rõ nét.', N'38.5 x 26.5', N'sach20.jpg', 41)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S042', N'NXB12', N'DM16', N'Tỳ vị trong đông y', N'Hoàng Anh Tuấn ,  Hoàng Duy Tân', 2020, 372, CAST(164000 AS Decimal(18, 0)), N'Tỳ Vị Trong Đông Y, thường người ta chỉ nghĩ đến chức năng tiêu hoá , theo đó , thức ăn từ ngoài đưa vào dạ dày ( Vị ), được nghiền nát thành dưỡng chất , sau đó chuyển đi nuôi các cơ quan tạng phủ trong cơ thể . Nếu chỉ có như vậy thì quá đơn giản . Thế nhưng , nhiều loại bệnh xuất huyết ,chảy máu ,... khi điều trị , điều chỉnh ở Tỳ lại có kết quả hết sức tốt đẹp- đó là nhờ ý " Tỳ nhiếp huyết "....Như vậy , Tỳ Vị giữ vai trò rất quan trọng trong cuộc sống mà ít người chú ý và biết đến. Nhiều góc độ khác nhau của Tỳ Vị được cả YHCT lẫn YHHĐ nghiên cứu rất sâu . Tuy nhiên, không phải ai cũng có thể biết được những điều kỳ diệu này . Đơn giản nhất là chúng ta thiếu thông tin, thiếu tài liệu để nghiên cứu , học hỏi. Vì vậy , chúng tôi muốn dành nguyên chuyên đề để tìm hiểu sau và có hệ thống đối với Tỳ Vị để giúp người đọc dễ tra cứu , nghiên cứu khi cần . Chúng tôi chỉ nêu một số bệnh liên quan đến Tỳ Vị , các bệnh khác sẽ được giới thiệu chi tiết và đầy đủ hơn trong sách bệnh học chuyên đề về hệ tiêu hoá. ', N'24 x 16', N'sach21.jpg', 57)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S043', N'NXB12', N'DM05', N'Cách mạng và hành động', N'Nghiêm Xuân Hồng', 1969, 403, CAST(111000 AS Decimal(18, 0)), N'Nội dung sách là những diễn trình biện chứng của những cuộc cách mạng lớn cận đại: 1789 - 1917 - 1933 - 1949.

- Cách mạng Pháp 1789 - là cuộc cách mạng lớn đầu tiên trong thời cận đại đã làm phát hiện ý thức đấu tranh giai cấp do mâu thuẫn giữa các tầng lớp, các thế hệ, các chủng tộc.

- Cách mạng Nga năm 1917 là cuộc cách mạng nhằm phá hủy nền đế chế tập trung của giòng giõi Bourbons và của Nga hoàng do sự bóc lột bởi hoàng tộc Nga hoàng cùng quý tộc lại rất sâu dầy, như một quý tộc bậc trung tại nước Nga hồi đó cũng sống cuộc đời rất vương giả và tài sản của quý tộc thường được ước lượng theo nhân số của bọn dân cày nô lệ.

- Cách mạng vô sản tại Trung hoa - là cuộc cách mạng bằng Hồng quân - Diễn trình khai triển của lực lượng vô sản hay cuộc xunng đột cuốc cộng từ năm 1927 - 1949. Căn cứ địa Giang Tây và cuộc Vạn Lý Trường chinh - Chiến tranh Hoa - Nhật là cơ hội ngàn năm một thủa cho họ Mao - Lý do chiến tranh của Tưởng Giới Thạch - Chính sách vô sản chuyên chính tại Trung quốc: giai đoạn 1949 - 1952, 1952 - 1955, 1955 - 1962 - Chiến dịch trăm hoa đua nở và nhân dân công xã.

- Cách mạng Đức quốc xã 1933 - Tinh thần chủng tộc cố hữu cùng bản năng quyền lực của dân tộc Đức: Clausewitz, Hégel, Nietzsche, Wagner, H.S. Chamberlain - Hoàn cảnh hậu chiến và con đường của Hitler - Tính chất của cuộc cách mạng quốc xã: sức sống thuần túy và bối cảnh ý thức hệ', N'13.2 x 19.5', N'sach23.jpg', 42)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S044', N'NXB12', N'DM05', N'Văn miếu Việt Nam', N'Dương Văn Hoàn ,  Trịnh Khắc Mạnh', 2021, 448, CAST(368000 AS Decimal(18, 0)), N'
Văn miếu ở Việt Nam lưu dấu nhiều giá trị truyền thống, về lịch sử, văn hóa, giáo dục, kiến trúc, vv... Mỗi ngành khoa học đều có thể khai thác theo hướng chuyên ngành, đa ngành hoặc liên ngành nhằm phát huy giá trị trường tồn của hệ thống di tích này với những thông tin đa dạng của quá khứ, phục vụ văn hóa đương đại và định hướng tương lai cho một nền văn hóa phát triển bền vững.

Về Văn miếu ở Việt Nam đã có nhiều công trình nghiên cứu, xin nêu một số ví dụ: Văn miếu Quốc tử giám, một biểu tượng của nền văn hóa Việt Nam (Đặng Đức Siêu & Nguyễn Quang Lộc), Trung tâm Hoạt động Văn hóa Khoa học Văn miếu Quốc tử giám, Hà Nội, 1993; Văn miếu - Quốc tử giám - Thăng Long Hà Nội (Nguyễn Quang Lộc - Phạm Thúy Hằng), Hà Nội, 1998; Bảo tồn, tôn tạo và xây dựng Khu di tích lịch sử - Văn hóa Đường Lâm, NXB Khoa học xã hội, 2005; 290 năm Văn miếu Trấn Biên (Thành ủy - UBND thành phố Trấn Biên), NXB Đồng Nai, 2005; Di sản văn chương Văn miếu Quốc tử giám (Phan Văn Các - Trần Ngọc Vương đồng chủ trì), NXB Hà Nội, 2010; Văn bia Tiến sĩ Văn miếu Quốc tử giám Thăng Long (Ngô Đức Thọ), NXB Hà Nội, 2010; Hội nghị Khoa học các đơn vị quản lý di tích Nho học Việt Nam (Kỷ yếu), Trung tâm Hoạt động Văn hóa Khoa học Văn miếu - Quốc tử giám, Hà Nội, 2011; Hệ thống di tích Nho học Việt Nam và các Vănmiếu tiêu biểu ở Bắc Bộ (Dương Văn Sáu), NXB Thông tin và Truyền thông, Hà Nội, 2014, vv...', N'17x24', N'sach24.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S045', N'NXB12', N'DM05', N'Quyển sách kì thú về động vật', N'Nhiều Tác Giả', 2019, 158, CAST(160000 AS Decimal(18, 0)), N'Nào cùng phiêu lưu vào thế giới kỳ thú của các loài động vật. Từ những loài vật to lớn sống ở lớp đáy đại dương đến những loài bay lượn tự do trên bầu trời. Từ loài khủng long chúa tể tồn tại hàng trăm triệu năm trước đến những loài vật quen thuộc xuất hiện quanh vườn nhà... Mỗi loài đều có những đặc tính riêng, với bao điều bất ngờ thú vị chờ đợi chúng ta cùng khám phá.', N'22.8 x 29.7', N'sach25.jpg', 55)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S046', N'NXB13', N'DM12', N'Miền tháp cổ', N'Vũ Hùng', 2021, 292, CAST(174000 AS Decimal(18, 0)), N'Về Tác Giả Vũ Hùng Và Miền Tháp Cổ

Anh Vũ Hùng là đồng môn tiền bối với tôi. Anh học khóa 2, tôi học khóa 9, khoa Sử trường Đại học Tổng hợp Huế.

Khi tôi về Đà Nẵng làm việc, được giao nhiệm vụ thành lập tạp chí Phát triển Kinh tế Xã hội Đà Nẵng, làm TBT trong gần 10 năm (2010 - 2019), thì anh Vũ Hùng là một trong những người tôi mời cộng tác từ những số đầu tiên của tạp chí này.

Hai bài viết anh gửi tôi, và tôi đã dành thời gian để biên tập và trao đổi với anh cho đến khi đồng thuận, rồi mới cho đăng trên tạp chí Phát triển Kinh tế Xã hội Đà Nẵng, là bài: “Vùng đất 160 năm ‘sổ sách chỉ chép tên suông’” và bài “Trầm tích Cu Đê”, đã được Vũ Hùng đưa vào đầu tập biên khảo này.', N'13,5 x 20,5', N'sach26.jpg', 27)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S047', N'NXB13', N'DM12', N'Bí quyết vẽ ký họa', N'Huỳnh Phạm Hương Trang', 2018, 144, CAST(92000 AS Decimal(18, 0)), N'Vẽ ký hoạ rất thú vị, thậm chí có thể xem như một công việc có tính giải trí nhưng điều quan trọng hơn là khi đã làm chủ được kỹ thuật vẽ ký hoạ thì mới đảm bảo việc thực hiện thành công các loại hình nghệ thuật hội hoạ khác nhau. Đây chính là kinh nghiệm mà mọi hoạ sĩ đều thống nhất.
Ký hoạ sẽ giúp các bạn nắm bắt nhanh hình dáng, sắc thái và sắc độ, cũng như cách dựng hình và bố cục. Những kinh nghiệm quý báu này sẽ giúp bạn hiểu được việc các hoạ sĩ đã thực hiện những ký hoạ của họ như thế nào để dẫn đến những danh tác mỹ thuật.', N'19 x 27', N'sach27.jpg', 52)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S048', N'NXB13', N'DM12', N'Phương pháp phê bình điện ảnh', N'Trần Luân Kim', 2020, 260, CAST(75000 AS Decimal(18, 0)), N' 
Con đường tiếp cận, nghiên cứu điện ảnh thông qua lý luận - phê bình là con đường dài nhiều chặng, xuyên suốt các lĩnh vực hoạt động tổng hợp của điện ảnh; từ các yếu tố liên quan đến văn học, nghệ thuật tạo hình, dàn dựng cảnh, xử lý không gian thời gian, chọn lọc âm thanh, nghệ thuật diễn xuất... đến các vấn đề thuộc về tài chính, thương mại, cùng các lĩnh vực khác như vật liệu ghi hình, kỹ thuật tiền kỳ, hậu kỳ, phương thức quảng bá, v.v... Riêng lĩnh vực nghệ thuật, để nghiên cứu thấu suốt nghệ thuật điện ảnh, người ta không thể không đề cập tới hàng loạt vấn đề liên quan trực tiếp như mỹ học điện ảnh, tâm lý điện ảnh, ký hiệu điện ảnh, lịch sử điện ảnh, xã hội học điện ảnh,... Phạm vi rộng lớn của nội hàm điện ảnh đặt công tác lý luận phê bình điện ảnh vào một vị thế vừa chông chênh khó nhọc, vừa tinh vi lý thú.

Lý luận điện ảnh và phê bình điện ảnh là hai phạm trù gắn kết, hỗ trợ nhau chặt chẽ, không thể tách rời. Chính vì vậy, trước khi đề cập sâu lĩnh vực phê bình điện ảnh, thiết tưởng, tìm hiểu một số vấn đề lý luận cơ bản về nghệ thuật điện ảnh có mối liên quan trực tiếp đến phương pháp phê bình điện ảnh, là việc cần thiết.', N'14 x 20', N'sach28.jpg', 42)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S049', N'NXB13', N'DM12', N'Mỹ thuật Nguyễn', N'Nguyễn Hữu Thông', 2019, 3000, CAST(630000 AS Decimal(18, 0)), N'Sách MỸ THUẬT NGUYỄN (Tác giả: Nguyễn Hữu Thông)

Nxb Tổng hợp Thành phố Hồ Chí Minh xuất bản năm 2019.

Khổ: 23x35 cm;

Số trang: 300 trang;

Bìa: cứng, giấy mỹ thuật, ép kim. Áo bìa in 4 màu.

Ruột: 300 trang, in 4 màu. Giấy couches maat đl 150

Thành phẩm: may chỉ, vô bìa, đóng thùng.

Sách có lời giới thiệu bằng tiếng Anh.

Cuốn sách mà theo tác giả "là những chắt lọc sau hơn 40 năm nghiên cứu về lịch sử, văn hóa và mỹ thuật thời Nguyễn để viết ra, và là cuốn sách tâm huyết nhất trong số 13 cuốn sách mà tôi đã viết hoặc chủ biên. Đây là cuốn sách tôi ưng ý nhất trước khi ''rửa tay gác kiếm''".', N'không', N'sach29.jpg', 6)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S050', N'NXB14', N'DM17', N'Tự học hình tọa độ OXYZ', N'Lê Văn Tuấn ,  Đặng Công Đức ,  Nguyến Thế Duy', 2018, 50, CAST(160000 AS Decimal(18, 0)), N'Dưới ứng dụng của cuộc cách mạng công nghệ 4.0 và trí tuệ nhân tạo, tác giả hy vọng rằng đây là cuộc cách mạng sách, hướng tới mục tiêu giúp các bạn học sinh rèn luyện cho mình kỹ năng học và tự học mọi lúc, mọi nơi để có thật nhiều kiến thức không chỉ phục vụ cho những kỳ thi ở trên ghế nhà trường mà xa hơn là khả năng tự học những kiến thức từ cuộc sống, công việc của chính mình, trở thành một người làm chủ kiến thức và có ích cho xã hội.
Nội dung cuốn sách viết về chương Hình tọa độ không gian Oxyz với khoảng 3000 bài toán trắc nghiệm điển hình, bao quát tất cả các dạng toán, được sưu tầm, trích dẫn từ các khóa học chính thức của hệ thống giáo dục Moon.vn, các sách tham khảo tự luận, các đề thi thử của các trường THPT trên khắp cả nước trong những năm vừa qua, các tài liệu dưới dạng ebook trên internet, các bài toán hay trên nhóm học tập Facebook….. Trong mỗi chủ đề, tác giả viết theo một cấu trúc thống nhất và tin chắc rằng với trình tự sắp xếp này sẽ giúp độc giả dễ dàng tiếp cận và từng bước nắm chắc toàn bộ kiến thức mỗi chuyên đề', N'không', N'sach30.jpg', 60)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S051', N'NXB14', N'DM17', N'Bồi dưỡng học sinh giỏi lượng giác', N'ĐH Quốc Gia Hà Nội', 2016, 50, CAST(30000 AS Decimal(18, 0)), N'Bồi Dưỡng Học Sinh Giỏi Lượng Giác là quyến sách mở đầu trong bộ sách viết cho học sinh chuyên toán và bồi dưỡng học sinh giỏi về môn Toán của nhóm giáo viên trường THPT Quốc Gia Chu Văn An.Cuốn sách Lượng Giác này gồm 5 chương:- Chương 1 : Đẳng Thức Lượng Giác.- Chương 2 : Bất đẳng thức lượng giác.- Chương 3 : Đẳng thức lượng giác trong tam giác.- Chương 4 : Vài ứng dụng của lượng giác trong việc giải các bài toán sơ cấp.Cuốn sách Bồi Dưỡng Học Sinh Giỏi Lượng Giác này sẽ cung cấp cho bạn đọc một lượng rất lớn các bài toán chọn lọc gồm đủ thể loại. Mỗi phần của cuốn sách bồi dưỡng lượng giác này có thể xem như một chuyên đề riêng trình bày trọn vẹn một vấn đề một cách hoàn chỉnh (riêng phần phương trình lượng giác sẽ được đề cập trong cuốn sách khác).', N'không', N'sach31.jpg', 40)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S052', N'NXB14', N'DM17', N'Chuyên đề ngữ văn', N'Nguyễn Đức Hùng - Vũ Mai Nam - Huỳnh Nghĩa', 2018, 62, CAST(40000 AS Decimal(18, 0)), N'Chuyên Đề Ngữ Văn', N'không', N'sach32.jpg', 61)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S053', N'NXB14', N'DM17', N'Combo tự học đột phá tiếng anh', N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', 2018, 40, CAST(292000 AS Decimal(18, 0)), N'Bộ sách video chuyên đề Tiếng Anh đầu tiên dành cho THPT lớp 10,11,12  là một trong những cuốn sách tiếng anh sử dụng cấu trúc theo phương pháp tự học quốc tế (học bằng sách kết hợp video bài giảng).

TỰ HỌC ĐỘT PHÁ CHUYÊN ĐỀ NGỮ PHÁP
Rèn kỹ năng làm bài tập ngữ pháp tiếng Anh qua các bộ đề trắc nghiệm với các dạng bài tập: điền từ còn trống, ghi nhớ từ mới – cấu trúc câu từ cơ bản đến phức tạp...
Sau mỗi đề đều có thống kê cụ thể về số lượng từ mới, các dạng ngữ pháp cần nhớ, ví dụ đoạn hội thoại giúp học sinh tổng hợp kiến thức làm bài trắc nghiệm tiếng Anh nhanh nhất.
Kèm 5 Video Bài Giảng chuyên sâu
TỰ HỌC ĐỘT PHÁ TRỌNG ÂM - PHÁT ÂM:
Gồm lý thuyết về từ vựng và hướng dẫn cách đọc từng âm tiết trong ngôn ngữ tiếng Anh
Phân tích, lý thuyết hóa những phương thức xác định trọng âm trong từng từ tiếng Anh ngắn/dài…
Bài tập áp dụng lý thuyết vào luyện đề, tạo phản ứng nhanh trước các dạng bài tập tiếng Anh trọng âm – phát âm.
Kèm 5 Video Bài Giảng chuyên sâu
TỰ HỌC ĐỘT PHÁ CHUYÊN ĐỀ ĐỌC HIỂU:
Rèn kĩ năng đọc những bài viết dài trên 1000 từ
Kinh nghiệm để “đọc lướt” cũng có thể rút ra ý chính từng đoạn; chỉ biết 60% từ vựng trong đoạn những vẫn hiểu ý chính; cách trả lời những câu trắc nghiệm “mẹo”; rèn thêm từ mới qua các đoạn văn phức tạp…
Kèm 5 Video Bài Giảng chuyên sâu', N'20.5 x 29.5', N'sach33.jpg', 60)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S054', N'NXB14', N'DM18', N'Luyện viết và từ vựng tiếng anh', N'Hà Thanh Uyên ,  Mai Lan hương', 2019, 124, CAST(48000 AS Decimal(18, 0)), N'Luyện viết và học từ vựng tiếng anh lớp 3, là vở bài tập được biên soạn theo giáo trình Family and  Friends (special edition) của nhà xuất bản Giáo Dục Việt Nam kết hợp với nhà sản xuất Oxford.

Cuốn sách được biên soạn nhằm giúp các em học sinh lớp 3 làm quen với các từ vựng tiếng anh đơn giản. Các em sẽ luyện viết và học từ tiếng anh bằng các hình ảnh minh họa sinh động. Sau phần luyện viết từ vựng là các hoạt động chọn từ đúng, điền từ, ghép từ với hình thích hợp, sắp xếp từ,v.v. Nhằm giúp các em ôn luyện từ vựng đã học. Sau mỗi 3 đơn vị bài học có phần ôn tập (Review) với các hoạt động lý thú giúp các em củng cố kiến thức.', N'19 x 26.5', N'sach34.jpg', 46)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S055', N'NXB14', N'DM18', N'Chinh phục đỉnh Olympia', N'Bùi Văn Vinh', 2021, 224, CAST(163000 AS Decimal(18, 0)), N'
Vai trò của Tiếng Anh trong các kì thi là hết sức quan trọng, Đường Lên Đỉnh Olympia là một cuộc thi kiến thức trên truyền hình dành cho học sinh Trung học phổ thông. Trải qua hơn 20 năm, các vòng thi trong cuộc thi này ngày càng đổi mới và toàn diện với hệ thống các câu hỏi đa lĩnh vực. Trong đó không thể thiếu các câu hỏi tiếng Anh được đưa ra bởi các chuyên gia trong và ngoài nước. Với mong muốn giúp các em học sinh hiểu và nắm bắt được cấu trúc của các vòng thi trong sân chơi tri thức này, cuốn Chinh Phục Đỉnh Olympia Ngân Hàng Câu Hỏi Có Đáp Án Và Giải Thích Tiếng Anh được biên soạn. Cuốn sách này sẽ giúp các em học sinh từ bậc Tiểu học tới Trung học phổ thông trau dồi và rèn luyện kiến thức. Nội dung cuốn sách gồm 4 phần, mỗi phần đều có 4 vòng', N'19 x 27', N'sach35.jpg', 36)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S056', N'NXB14', N'DM18', N'Bàn tay nhỏ vẽ tranh', N'Minh Thư', 2021, 43, CAST(23000 AS Decimal(18, 0)), N'"Nếu bé yêu thích vẽ tranh và ham học hỏi thì cha mẹ nên tìm mua cho bé trọn bộ sách Bàn Tay Nhỏ Vẽ Tranh (gồm 6 cuốn). Bộ sách tập hợp những hình vẽ thú vị và ngộ nghĩnh về các loài động vật, phong cảnh, những nhân vật đáng yêu và những đồ vật nho nhỏ thân thuộc của cuộc sống hàng ngày. Nét vẽ đơn giản, hình ảnh sinh động, màu sắc tươi sáng.

Với hình ảnh rõ ràng và nét vẽ trau chuốt, trong lúc tập tô, bé  vừa có thể tham khảo mẫu, vừa thỏa sức sáng tạo theo ý của mình. Đồng thời, với phần chữ chú thích đơn giản ở trên mỗi hình vẽ, bé còn có thể học cách đánh vần, tập đọc vô cùng hữu ích."', N'20,5 x 28', N'sach36.jpg', 15)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S057', N'NXB14', N'DM19', N'Món ăn cho bà mẹ sau sinh', N'Mai Oanh', 2015, 62, CAST(32000 AS Decimal(18, 0)), N'Chuẩn bị thức ăn cho sản phụ sau sinh cần chú trọng để phục hồi thể lực người; tăng tiết và đảm bảo chất lượng sữa. Cuốn sách giới thiệu cách chế biến những món ăn ngon, đầy đủ dinh dưỡng:

- Bắp chuối bao tử hầm giò heo

- Gà nấu hèm chua ngọt

- Đu đủ hầm móng giò bò

- Tim heo hầm trái vả

- Vả hầm sườn non

- Nấm nấu thịt gà và rau củ

- Lưỡi heo hầm chua ngọt

- Bò nấu nấm kim châm

- Thịt dê nấu hẹ

- Dê hầm tỏi

- Vả hầm móng giò bò

- Rau ngót nấu cá khoai

- Thịt gà rim nước mắm

- Thịt bắp heo kho nghệ

- Cánh gà rang muối', N'14.5 x 20.5', N'sach37.jpg', 8)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S058', N'NXB14', N'DM19', N'Thực đơn ăn dặm kiểu Nhật', N'Junko Ueda ,  Reiko Ueda', 2020, 192, CAST(134000 AS Decimal(18, 0)), N'Ăn dặm là bước đệm đầu đời giúp trẻ tiếp cận với các món ăn đa dạng ngoài sữa mẹ để được phát triển toàn diện và hoàn thiện khả năng ăn uống sau này. Thời kì ăn dặm của trẻ diễn ra từ khoảng 5 ~ 18 tháng tuổi nhưng lại được chia thành bốn giai đoạn nhỏ. Thực phẩm được khuyên dùng và phương pháp chế biến các món ăn ở các giai đoạn cũng khác nhau để phù hợp với quá trình phát triển của trẻ, chính vì vậy các mẹ không tránh khỏi những bỡ ngỡ, bối rối trong lần đầu làm đầu bếp riêng của con với mong muốn thời kì ăn dặm của con mình diễn ra suôn sẻ nhất.

Cuốn sách Thực Đơn Ăn Dặm Kiểu Nhật là một bộ sưu tập các thực phẩm hữu ích và công thức chế biến các món ăn dặm phong phú nhưng lại đơn giản và tiết kiệm thời gian mà bất kì bà mẹ nào cũng có thể làm được. Ngoài ra, cuốn sách cũng đưa ra những nguyên tắc cần đảm bảo trong thời kì ăn dặm của bé và những ý tưởng chế biến món ăn giúp các mẹ hiểu hơn về ăn dặm để sáng tạo và biến tấu thêm nhiều món ăn mới cho trẻ.', N'23 x 16', N'sach38.jpg', 15)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S059', N'NXB14', N'DM19', N'Khởi sự ăn chay', N'Đức Nguyễn', 2019, 256, CAST(161000 AS Decimal(18, 0)), N'Khởi Sự Ăn Chay - Dinh Dưỡng Dành Cho Người Ắn Chay Và 14 Ngày Để Bạn Bắt Đầu không chỉ là một cuốn sách hướng dẫn nấu ăn, càng không phải đơn thuần là tuyển tập các món chay. Cuốn sách là sự dẫn dắt đầy cảm hứng, sáng tỏ và khoa học dành cho bạn, từ tác giả Đức Nguyễn - một người ăn chay văn minh và khoẻ mạnh. Bạn có thể tìm thấy trong cuốn sách này lời giải đáp cho những băn khoăn cơ bản nhất khi bắt đầu ăn chay. Bạn cũng có thể ồ lên thích thú khi phát hiện ra ăn chay quả là một nghệ thuật, thứ nghệ thuật giờ đây được sáng tỏ dưới góc nhìn khoa học dinh dưỡng. Và rồi bạn háo hứng khám phá những món chay ngon, lành, đẹp như một bài thơ. Bạn sẽ thấy hành trình ăn chay thật vui và thú vị!

Đó là hành trình tìm đến sự cân bằng và bình yên giữa ẩm thực và cuộc sống, giữa những lựa chọn cá nhân đến những mục tiêu bền vững hơn cho chính bạn, cho môi trường hay cho Trái Đất. Dù thế nào đi nữa, hãy thử lần giở bất cứ trang sách nào, hẳn bạn sẽ đồng ý với tôi, rằng mỗi trang sách đều là một pho tâm huyết của tác giả - với trọn vẹn tấm lòng, tri thức và tình yêu của anh ấy, là dành cho bạn!', N'17 x 24', N'sach39.jpg', 27)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S060', N'NXB14', N'DM19', N'Bánh mì lang thang', N'	 Hương Thảo', 2019, 264, CAST(170000 AS Decimal(18, 0)), N'Các bạn độc giả yêu thương!

Được gặp lại các bạn trong cuốn sách này là điều tôi đã ấp ủ và mong chờ rất lâu nhưng cảm xúc vẫn vẹn nguyên như lần đầu vậy.

Cảm ơn các bạn đã yêu mến “Khu vườn dâu đỏ” để tôi tiếp tục có thêm động lực viết cuốn sách này.

Vô tình biết đến bánh mì làm từ men tự nhiên, tôi đã bị “chết chìm” bởi vẻ đẹp hoang dã của loại bánh mì đồng quê này và việc tìm hiểu về lịch sử của nó càng làm tôi bị thu hút hơn. Nhưng trên tất cả, những giá trị mà Sourdough đem lại cho nhân loại mới thực sự là điều chinh phục hoàn toàn trái tim tôi. Tôi đã quyết tâm giải mã bằng được dòng bánh mì Sourdough này để có thể hiểu vì sao món bánh mì này lại có nhiều lợi ích như vậy, tại sao nó vẫn có thể tồn tại hàng ngàn năm qua?

Trong cuốn sách Bánh Mì Lang Thang này, tôi có chia sẻ một số kiến thức nho nhỏ về khoa học và dinh dưỡng liên quan đến bánh mì Sourdough. Nguồn kiến thức này đã được tôi tìm tòi, chọn lọc, nghiền ngẫm, tìm dẫn chứng, sau đó là thực hành và làm đi làm lại.', N'17x24', N'sach40.jpg', 31)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S061', N'NXB14', N'DM20', N'Liệu trình dinh dưỡng tối ưu', N'Thomas M. Campbell', 2021, 129, CAST(246000 AS Decimal(18, 0)), N'Ăn uống theo chế độ Thực Vật Toàn Phần (Whole Foods Plant Based) đang là xu hướng của thế giới. Điều này không những giúp cho chúng ta khoẻ mạnh hơn, mà còn có thể cứu được Trái Đất đang ngày càng nóng lên một phần do ảnh hưởng của việc chăn nuôi động vật. Hơn nữa, một số lại hướng đến yếu tố nhân đạo, quyền được sống, quyền được yêu thương của động vật cũng nên được đối xử công bằng.

Chế độ ăn uống thực vật không những giúp bạn khoẻ mạnh hơn, chống được nhiều bệnh tật mà còn có thể đảo ngược được hầu hết các loại bệnh trong đó có cả tim mạch; tiểu đường; cholesterol; gout.. và các bệnh mãn tính khác. Không những thế, đây là phương pháp giảm cân an toàn và hiệu quả được mọi người hưởng ứng.

Chín năm sau khi Bác sĩ Thomas cùng với cha của mình, Tiến sĩ T.Collin Campbell viết cuốn Sách The China Study (Bí mật dinh dưỡng cho sức khoẻ toàn diện). Bác sĩ Thomas thấy rằng: cần phải đưa thông tin chi tiết hơn về việc làm thế nào để thay đổi chế độ ăn hiện tại của bạn sang chế độ ăn thực vật toàn phần dễ dàng; đảm bảo đầy đủ chất dinh dưỡng thông qua hướng dẫn mua sắm; phân biệt các loại thực phẩm “tốt – không tốt”; thực phẩm cần có trong gia đình; công thức nấu ăn tuyệt vời. Đó là lý do cuốn sách “Liệu trình dinh dưỡng” được ra đời.', N'không', N'sach41.jpg', 30)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S062', N'NXB14', N'DM20', N'3 phút sơ cứu', N'BS. Ngô Đức Hùng', 2019, 204, CAST(112000 AS Decimal(18, 0)), N'3 phút là khoảng thời gian để cơ thể tiết ra adrenalin, hormon sống còn giúp máu về tim tốt hơn. Nếu bạn sơ cứu không đúng cách, máu về tim sẽ tồi hơn và các tế bào sẽ rối loạn chuyển hóa.

3 phút là thời gian chảy máu trước khi cơ thể khởi động quá trình cầm máu. Nếu bạn sơ cứu không đúng cách, quá trình cầm máu sẽ tồi hơn và giết chết các tế bào được mạch máu đó nuôi dưỡng.

3 phút là thời gian tế bào não có thể chịu đựng được khi thiếu oxy trước khi tổn thương vĩnh viễn. Nếu bạn sơ cứu không đúng cách, tế bào não sẽ tổn thương vĩnh viễn và lúc ấy các can thiệp y khoa sẽ trở thành vô nghĩa.', N'15 x 20.5', N'sach42.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S063', N'NXB14', N'DM20', N'Cải thiện năng lực trí não', N'Tony Buzan', 2018, 150, CAST(58000 AS Decimal(18, 0)), N'Trong tập 1, tác giả Tony Buzan đã chỉ ra: bộ não cũng giống như bất cứ bộ phận nào khác trong cơ thể, cần được quan tâm chăm sóc để có thể duy trì hoạt động ở mức tốt nhất. Điều này được ông nhắc lại ở tập 2, như một lời khẳng định quan trọng trong việc chăm sóc bộ não của chúng ta. Theo Tony Buzan, trước đây không ít người vẫn cho rằng khả năng nhận thức và tình trạng thể chất là hai phạm trù hoàn toàn khác nhau. Nhưng nhiều nghiên cứu gần đây đang bắt đầu chứng minh cho điều mà một số người vẫn thường tranh cãi, đó là: sức khỏe thể chất có tác động cực kỳ lớn đến sức khỏe tinh thần, và ngược lại. Nói cách khác, để duy trì năng lực não bộ, chúng ta cần chú ý chăm sóc tốt cơ thể và nuôi dưỡng cả tinh thần.', N'không', N'sach43.jpg', 36)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S064', N'NXB15', N'DM20', N'Sống khỏe không rủi ro', N'Frédéric Saldmann', 2019, 348, CAST(106 AS Decimal(18, 0)), N'Nên rửa tay trước hay sau khi đi vệ sinh, đá lạnh có thể giúp giảm cân, ôm giúp cắt cơn đói, tiểu đứng hay tiểu ngồi có lợi, đạp xe nhiều làm giảm nhu cầu tình dục,...? Bằng cách cung cấp những quy tắc vệ sinh đáng ngạc nhiên, những cách cắt cơn đói tự nhiên, danh sách những loại thực phẩm chống tăng cân,... Sống khỏe không rủi ro sẽ trang bị cho độc giả bí kíp để có được bụng phẳng, eo thon, đời sống tình dục hoàn hảo và những giấc ngủ trên cả tuyệt vời! Hãy cùng bác sĩ kiêm tác giả best-seller Frédéric Saldmann học cách trở thành bác sĩ của chính bản thân bạn để có được một sức khỏe hoàn hảo mà không tốn một xu!', N'14 x 20.5', N'sach44.jpg', 40)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S065', N'NXB15', N'DM06', N'Chữa bệnh tiểu đường và biến chứng', N'Đỗ Đức Ngọc', 2020, 174, CAST(52000 AS Decimal(18, 0)), N'Khoa học nói chung và y học nói riêng luôn phát triển không ngừng. Tuy nhiên, không bao giờ có cái gì hoàn thiện tuyệt đối, vì thế con người luôn tìm mọi cách hoàn thiện những khiếm khuyết của các thành quả do mình sáng tạo ra để đưa xã hội loài người tiến lên.

Đông y càng cổ càng giỏi vì ngày xưa chẳng có máy móc thiết bị gì nhưng các vị danh y chẩn đoán và chữa bệnh như thần. Tây y càng mới càng tinh, những thiết bị máy móc hiện đại của Tây y đã giúp chẩn đoán bệnh được chính xác hơn và do đó việc chữa bệnh có hiệu quả hơn.

Ngày nay, Đông y và Tây y phát triển ở đỉnh cao, tuy vậy không phải là không có những nhược điểm  trong chẩn bệnh và chữa bệnh. Một ngành y học ra đời để bổ sung cho Đông y và Tây y đó là môn khí công y đạo Việt Nam.
Cuốn sách cung cấp cho bạn những kiến thức về dấu hiệu của người sắp bị bệnh tiểu đường, phân loại bệnh chứng, điều dưỡng, những món ăn thay thuốc phòng và chữa bệnh tiểu đường, những bài thuốc kinh nghiệm chữa bệnh tiểu đường của Đông y.', N'13.5 x 21', N'sach45.jpg', 204)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S066', N'NXB15', N'DM06', N'Chuyên khảo phương trình hàm', N'Nguyễn Tài Chung ,  Lê Hoành Phò', 2021, 89, CAST(118000 AS Decimal(18, 0)), N'Phương Trình hàm là 1 chuyên đề quan trọng trong chương trình học Toán. Các bài toán, dạng toán trong chương này đa số cũng là những bài tập khó. vì vậy chúng ta cần phải nắm bắt được vấn đề và xữ lí chúng một cách hiệu quả nhất.

Cuốn sách Chuyên Khảo Phương Trình Hàm là nguồn tài liệu tham khảo hữu ích cho tất cả các em học sinh cũng như các vị giáo viên bộ môn Toán và đây cũng là nguồn tài liệu phục vụ cho tất  cả các kì thi.', N'không', N'sach46.jpg', 84)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S067', N'NXB15', N'DM06', N'Mật mã Da Vinci', N'Dan Brown', 2006, 534, CAST(144000 AS Decimal(18, 0)), N'Dan Brown sinh ngày 22 tháng 6 năm 1964 và gia đình ở Exeter, New Hampshire, ông là con trưởng trong một gia đình có 3 anh em. Mẹ ông, Constance (Connie) là một nhạc sĩ chuyên nghiệp, chơi đàn organ trong nhà thờ. Cha ông, Richard G. Brown là một thầy giáo dạy toán khá nổi tiếng, từng viết sách giáo khoa và dạy toán tại trường Trung học tư thục Phillips Exeter từ năm 1962 và nghỉ hưu năm 1997. 

Trường Trung học tư thục Phillips Exeter là một trường nội trú độc nhất với yêu cầu các giáo viên cũng phải sống nội trú trong nhiều năm, vì vậy anh em nhà Dan Brown đã được nuôi dạy dưới mái trường này. Môi trường xã hội tại Exeter thời đó hầu như là môi trường Cơ đốc giáo. 

Dan Brown hát thánh ca trong nhà thờ, tham gia vào trường đạo và dành cả mùa hè để tham dự các cuộc cắm trại của nhà thờ. Tới năm lớp 9, Dan Brown bắt đầu ghi danh học tại trường công lập Phillips Exeter (khóa 1982), sau này, vào các năm 1985 và 1993, em gái Valerie và em trai Gregory của Dan cũng ghi danh học tại đây.', N'16x24', N'sach47.jpg', 63)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S068', N'NXB15', N'DM06', N'Trạch nhật', N'Võ văn Ba', 2018, 129, CAST(72000 AS Decimal(18, 0)), N'Chọn ngày giờ tốt xấu theo âm dương ngũ hành rất thông dụng trong dân gian từ bao đời nay, vốn đã ăn sâu trong tâm thức người Việt chúng ta nói riêng và các dân tộc Đông Á chịu ảnh hưởng văn hóa Trung Hoa nói chung. Những việc đại sự như làm nhà, cưới hỏi, an táng, khai trương... người ta thường chọn ngày kiết, tránh ngày hung. Hiện nay, sách về đề tài này khá nhiều nhưng không biết đâu là chính thư, đâu là ngụy thư. Nhiều sách viết, dịch khá rối rắm khó hiểu, khó áp dụng.

Hiểu được điều đó, tác giả Võ Văn Ba (Tuệ Minh) đã cho ra đời cuốn sách TRẠCH NHẬT. Cuốn sách này sẽ hướng dẫn các bạn cách xem ngày lành, tháng tốt và xem giờ cho những sự kiện quan trọng như đám cưới, đám hỏi, ngày khai trương,... theo văn hóa phương Đông cổ đại.', N'14x20', N'sach48.jpg', 58)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S069', N'NXB15', N'DM06', N'Sống đời hành phúc', N'Dale Carnegie', 2018, 232, CAST(52000 AS Decimal(18, 0)), N'Bản thân bạn đã là một điều mới mẻ trên thế gian này rồi. Hãy mừng vì điều đó. Hãy tận dụng tất cả những gì mà tạo hoá đã ban tặng cho bạn. Bởi xét đến cùng, nghệ thuật cũng chỉ là tự thuật mà thôi. Bạn chỉ hát những gì bạn suy nghĩ, chỉ vẽ những gì bạn trông thấy. Bạn chỉ có thể là một con người duy nhất được tạo nên nhờ những yếu tố di truyền riêng. Dù tốt xấu thế nào, bạn cũng phải chịu khó làm lụng trên chính mảnh vườn nhỏ của mình. Dù hay dở thế nào, bạn cũng phải chơi cây đàn bé nhỏ của mình trong bản hoà ca muôn điệu của cuộc đời.

Với mỗi một thế hệ mới, thông điệp của Carnegie lại chỉ ra một khả năng kì lạ có thể tự đánh giá bản thân để phù hợp với sự thay đổi của thế giới. Giao tiếp có hiệu quả, khuyến khích họ đạt được và khám phá được khả năng lãnh đạo tiềm ẩn trong bản thân mỗi người là vấn đề được quan tâm hàng đầu của Dale Carnegie. Với một thế giới đang ở trong tình tạng hỗn loạn như hiện nay thì thời đại của ông lại xuất hiện một lần nữa.Trong những trang tiếp theo, những nguyên tắc của Carnegie về quan hệ của con người được áp dụng cho một loạt những thách thức mà ngày nay con người phải đối mặt.', N'	 13.5 x 20.5', N'sach49.jpg', 251)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S070', N'NXB01', N'DM07', N'Chế độ ăn bổ não giảm stress', N'Nguyễn Thị Minh Kiều', 2021, 199, CAST(46000 AS Decimal(18, 0)), N'Cuốn sách này sẽ tư vấn cho bạn những cách thức nuôi dưỡng trí não, nhất là trong tình trạng stress, lần lượt theo 6 bước sau đây:

Bước 1: Tầm soát mức độ tiếp xúc với tác nhân gây stress

Bước 2: Đánh giá mức độ não và cơ thể bị ảnh hưởng do stress

Bước 3: Cách ăn uống để bổ trí não - giảm stress

Bước 4: Những cách trợ lực khác cho não

Bước 5: Lập kế hoạch cuộc sống giàu năng lượng cho não và cơ thể

Bước 6: Tư vấn món ăn bỗ trí não - giảm tress.', N'20.5 x 14.5', N'sach50.jpg', 160)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S071', N'NXB02', N'DM07', N'Mặt trời vẫn tỏa sáng', N'Lara Love Hardin ,  Anthony Ray Hinton', 2021, 336, CAST(138000 AS Decimal(18, 0)), N'TRÊN ĐỜI NÀY, KHÔNG CÓ NƠI NÀO BUỒN HƠN NƠI KHÔNG CÓ HY VỌNG

Một câu chuyện về đức tin và khát vọng sống.

Một câu chuyện khai sáng và giàu cảm xúc.

Một câu chuyện đơn giản và phức tạp.

Trong cuốn hồi ký lay động lòng người Mặt Trời Vẫn Tỏa Sáng, Anthony Ray Hinton đã thuật lại cơn ác mộng kéo dài suốt ba thập kỷ của mình: những tháng ngày thấp thỏm chờ đến lịch hành quyết do những tội ác anh chưa từng phạm phải.', N'24 x 16', N'sach51.jpg', 73)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S072', N'NXB03', N'DM07', N'Siêu trí tuệ IQ - toán học', N'Lê Quang', 2020, 120, CAST(54000 AS Decimal(18, 0)), N'Bộ sách Siêu Trí Tuệ là tập hợp những câu đố đòi hỏi sự rèn luyện và tập trung của bạn. Mỗi cuốn sách có những chủ đề khác nhau.

• Mỗi câu đố có quy luật tính toán riêng, bạn hãy suy luận để tìm ra số cần điền vào vị trí dấu chấm hỏi.
• Mỗi bức tranh đều có một điểm bất hợp lý, không theo logic, đòi hỏi bạn phải tập trung và tinh mắt.
• Trong 150 giây, liệu bạn có thể hoàn thành 10 câu đố IQ đề cập đến nhiều lĩnh vực từ toán, địa lý đến Tiếng Anh không?
• Bạn cần vận dụng khả năng tính toán, tư duy logic để tìm ra quy luật và điền số còn thiếu vào dấu chấm hỏi trong vòng một phút.
•  Bạn cần quan sát, suy luận logic để tìm ra quy luật của dãy hình, dãy số đã cho để đưa ra dáp án đúng.', N'	 20.5 x 13', N'sach52.jpg', 72)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S073', N'NXB04', N'DM07', N'Truyện phạm công đức hoa', N'Bùi Thức Phước', 2015, 80, CAST(33000 AS Decimal(18, 0)), N'
Với mục đích lưu truyền các tác phẩm truyện Nôm khuyết danh và những tác gia văn học cổ điển dành cho các bạn trẻ đọc thêm để giữ gìn và phát huy những tinh túy của văn học Việt Nam, đồng thời hiểu biết thêm một số tiếng Nôm thường gặp trong thơ văn cổ.

Biên soạn theo cấu trúc thống nhất:

Bối cảnh lịch sử
Thân thế - sự nghiệp của tác giả
Ý kiến các nhà nghiên cứu - phê bình
Tổng luận
Tác phẩm, chú thích', N'không', N'sach53.jpg', 27)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S074', N'NXB05', N'DM07', N'Đơn giản hóa cuốc sống của bạn', N'Mary Conroy', 2021, 246, CAST(92000 AS Decimal(18, 0)), N'Đây là cuốn sách thực sự cần thiết được xây dựng theo phong cách dễ tiếp cận rất độc đáo trong thời điểm phức tạp và đầy thử thách này. Tác giả khuyến khích người đọc nhìn lại lối sống hiện tại một cách không phán xét và hài hước, đồng thời thực hiện lối sống tối giản để loại bỏ bớt gánh nặng cả về mặt vật chất lẫn tinh thần.

Lối sống tối giản có ý nghĩa nhiều hơn là việc chỉ đơn thuần dọn dẹp bớt đồ đạc dư thừa. Cuốn sách được tác giả chấp bút với mục đích giúp các độc giả trân trọng và biết ơn nhiều hơn những điều mình đang có, tìm thấy sự giàu có và giá trị của cuộc sống sau khi bạn dọn dẹp cả không gian sống lẫn tâm trí mình để dành chỗ cho sự thỏa mãn, mục đích sống và niềm vui. Khi bạn loại bỏ tất cả những vật dụng không hữu ích, những thói quen và tư duy không mang lại giá trị nào trong cuộc sống, thì đó là lúc bạn có thêm không gian và tâm trí để kết nối với những điều phù hợp với những giá trị và mục tiêu của riêng bạn. Tối giản là chìa khóa giúp chúng ta có những lựa chọn có ý nghĩa, qua đó có thể kiểm soát cuộc sống một cách ý thức hơn.', N'20.5 x 14.5', N'sach54.jpg', 38)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S075', N'NXB06', N'DM08', N'Từ điểm Hàn - Việt', N'Khắc Trí', 2013, 575, CAST(32000 AS Decimal(18, 0)), N'Từ Điển Việt Hàn giúp các bạn dễ dàng và thuận tiện tra cứu tiếng Việt sang tiếng Hàn, tác giả đã biên soạn quyển sách từ điển này, thiết kế nhỏ gọn, dễ sử dụng, cầm tay và bỏ túi.', N'19.5 x 13.5', N'sach99.jpg', 26)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S076', N'NXB07', N'DM01', N'Hỏi nhỏ biết to - thực vật', N'Nhiều Tác Giả', 2020, 71, CAST(25600 AS Decimal(18, 0)), N'Có phải củ cà rốt luôn có màu cam không?
Cây cối làm thế nào để sống qua mùa đông giá lạnh?
Vì sao không nên để cây cối trong phòng ngủ?

Với những câu hỏi thú vị về thế giới thực vật, phần trả lời ngắn ngon, súc tích cùng hình ảnh minh họa sinh động, ngộ nghĩnh, bộ sách Hỏi Nhỏ Biết To - Thực Vật mở ra cho các bạn nhỏ cả một kho tri thức diệu kì và thú vị về thế giới thực vật.  Không chỉ là những kiến thức thú vị về thực vận, có nhiều kiến thức bé có thể áp dụng hữu ích vào cuộc sống thường ngày nữa đấy.', N'21 x 18', N'sach98.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S077', N'NXB08', N'DM10', N'Chính trị luận', N'Aristotle', 2018, 440, CAST(135000 AS Decimal(18, 0)), N'Aristotle là biểu tượng của trí tuệ tư duy triết học. Mặc dù nội dung rất sâu sắc nhưng cách trình bày của ông lại rất dễ hiểu. Ông viết những suy nghĩ của mình một cách rõ ràng với độ chính xác siêu phàm. Học thuyết của ông có ảnh hưởng lớn đến những lĩnh vực hiện đại như : khoa học, chủ nghĩa duy thực và logic học.

Đây là tác phẩm nổi tiếng viết về các khái niệm mà từ đó định hình các quốc gia và chính phủ. Mặc dù, Aristotle cổ vũ mạnh mẽ cho chế độ nô lệ lạc hậu, quan điểm của ông về Hiến pháp và cách điều hành chính phủ lại rất kinh điển. Dù chỉ thảo luận về nhà nước và các định chế thời Hy Lạp cổ nhưng tác phẩm này của ông đã đặt nền tảng cho khoa học chính trị hiện đại.

Một số vấn đề được đề cập đến trong Chính Trị Luận:

- Aristotle tán thành ý kiến của Plato là con người không thể không có quốc gia và mục đích căn bản của chính khách là xây dựng một quốc gia “tốt nhất” - chứ không phải một quốc gia “lý tưởng”;

- Aristotle chú trọng vào sự cải tổ quốc gia đương thời thay vì xây dựng một quốc gia mới hoàn toàn. Theo ông, quốc gia cung cấp cho con người nhiều ích lợi về mặt vật chất nhưng, quan trọng hơn hết, là về mặt luân lý, đạo đức. Ông tin là nhân loại lúc nào cũng cố gắng tìm kiếm những gì tốt đẹp cho nên tổ chức quốc gia có khả năng giúp cho nhân loại tiến bộ;
', N'14 x 20.5', N'sach87.jpg', 26)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S078', N'NXB09', N'DM19', N'Cộng hòa', N'Đỗ Khánh Hoan', 2018, 188, CAST(204000 AS Decimal(18, 0)), N'Cùng với Socrates, có thể nói Plato là một trong các triết gia có ảnh hưởng nhất của lịch sử triết học phương Tây. Ralph Waldo Emerson (1803 - 1882) - nhà viết tiểu luận, nhà thơ, triết gia nổi tiếng người Mỹ - đã nhận xét về con người đa tài này rằng: "Plato chính là triết học, triết học chính là Plato. Ông không vợ, không con nhưng tất cả các nhà tư tưởng của tất cả các dân tộc văn minh đều là hậu duệ của ông. Biết bao nhiêu con người vĩ đại tự nhiên đang không ngừng sản sinh ra đều là môn đệ của ông - những người theo chủ nghĩa Plato." Không nhiều - không muốn nói là rất hiếm thấy - một tác phẩm thể hiện rõ nét con người và tài năng của Plato được dịch sang tiếng Việt và Cộng hòa (The Republic) là một trong số đó.

Tác phẩm vĩ đại nhất của Plato bàn về nhiều lĩnh vực: thần học, đạo đức học, siêu hình học, tâm lý học, giáo dục học, chính trị học, và lý thuyết về nghệ thuật. Những vấn đề của triết học hiện đại đều được đặt ra tại đây: từ những vấn đề của Nietzsche về đạo đức và quý tộc, những vấn đề về trở lại với thiên nhiên và giáo dục tự do của Rousseau, élan vital của Bergson và phân tâm học của Freud. Trong số các tác phẩm phi tôn giáo, dường như chỉ có Cộng Hòa là xứng đáng lời ca ngợi của Omar dành cho kinh Koran, "Hãy đốt hết các thư viện đi, giá trị của chúng đã nằm hết trong quyển sách này rồi"...', N'14 x 20.5', N'sach86.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S079', N'NXB10', N'DM11', N'AI trong Marketing', N'Eric Verzuh', 2020, 360, CAST(151000 AS Decimal(18, 0)), N'Trong những năm gần đây, AI đã thúc đẩy sự phát triển nhảy vọt của các phương thức kinh doanh. Khi mà tối ưu hóa, tự động hóa quy trình sản xuất và hậu cần đang trở thành trọng tâm của Công nghiệp 4.0, AI ngày càng mở rộng phạm vi ảnh hưởng khi xâm nhập vào các quy trình quản lý, lập kế hoạch trong marketing và bán hàng, từ đó tạo tiền đề để công ty hướng đến ứng dụng dữ liệu và tự động hóa.

Trong cuốn sách AI Trong Marketing, Peter Gentsch sẽ cung cấp cho chúng ta những thông tin về lịch sử phát triển của AI, cũng như cách áp dụng nó vào các lĩnh vực như thu thập dữ liệu khách hàng và ước lượng rủi ro, từ đó tối ưu hóa hiệu quả kinh doanh và đem lại lợi nhuận lớn nhất cho doanh nghiệp.', N'23 x 16 ', N'sach85.jpg', 140)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S080', N'NXB11', N'DM12', N'Kinh doan online', N'Thanh Thịnh Bùi', 2020, 352, CAST(336000 AS Decimal(18, 0)), N'Cuốn sách Kinh Doanh Online - Ai Cũng Có Thể Bắt Đầu ra đời với mong muốn mang tới một cái nhìn tổng quan về một mô hình kinh doanh online toàn diện, từ đó giúp bạn định hướng và tự xây dựng một kế hoạch kinh doanh phù hợp.

Chúng tôi không hướng tới một cuốn sách dày tính học thuật mà hướng tới tính ứng dụng, đơn giản, dễ hiểu cho người mới bắt đầu kinh doanh. Cuốn sách được triển khai qua 4 chương chính, đi từ tổng quan về kinh doanh online tới hướng dẫn những bước cơ bản, chi tiết. 

Chương 1: Những kiến thức cơ bản về kinh doanh online 
Chương 2: Kinh doanh online bắt đầu từ đâu? Mô hình kinh doanh online hoàn chỉnh qua từng bước 
Chương 3: Tự tay thiết lập kênh bán hàng online của bạn Chi tiết cách thức triển khai bán hàng trên các kênh: Facebook, Zalo, Tiki, Sendo,.....
Chương 4: Các tư duy phát triển cho hoạt động kinh doanh online bền vững', N'24.2 x 19', N'sach84.jpg', 16)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S081', N'NXB12', N'DM12', N'Tự học nhạc lý cơ bản', N'Trương Ngọc Bích ,  Phạm Phương Hoa', 2017, 208, CAST(73000 AS Decimal(18, 0)), N' 
Nắm được rõ vai trò của lí thuyết âm nhạc đối với người yêu thích âm nhạc và những người mong muốn có một kiến thức cơ bản nhất của nhạc lí.
Cuốn sách sẽ giúp bạn không còn phải thấy khó khăn hay thắc mắc về những mặt như: khuông nhạc, nốt nhạc, khóa nhac, cung, nửa cung,... hay bạn sẽ hiểu và phân biệt rõ được: nốt đen - nốt trắng, móc kép- móc đơn, dấu thăng- dấu giáng.

Hãy đồng hành cùng Newshop  để tìm hiểu nhiều hơn về thế giới âm nhạc nhé!', N'19x27', N'sach83.gif', 36)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S082', N'NXB13', N'DM12', N'Tả ao địa lý toàn thư', N'Cao Trung', 2016, 762, CAST(144999 AS Decimal(18, 0)), N'Khoa Địa lý khởi nguồn từ Trung Hoa có lịch sử hàng ngàn năm, phối hợp thuyết Âm Dương - Ngũ Hành với sự quan sát các thế đất, hình thể các mạch đất cùng dòng chảy của sông, suối, ngòi, lạch mà tìm ra nơi có chứa tụ khí mạch của đất, coi nơi đó là đất kết (đất phát). Người Trung Hoa xưa quan niệm rằng nơi có đất kết âm phần có thể chôn xương người chết, và có thể làm nhà cửa, làng mạc, đô thị nếu là đất kết dương cơ, thì người sống ở đó được thịnh vượng, phát đạt nhờ tụ khí của vùng đất kết đó.

Khoa Địa lý đã được minh chứng kết quả từ hàng ngàn năm nay, ảnh hưởng đến nhiều lĩnh vực trong đời sống hàng ngày. Thật ra, xưa nay, khoa Địa lý có ảnh hưởng lớn lao đến sự thịnh suy của cả một dòng họ nên các thầy Địa lý chân chính rất thận trọng khi chỉ cuốc đất, sợ tổn hao âm đức của mình, và sợ chính kẻ thiếu đức bị hại vì công danh bổng lộc cao mà đức mỏng, nên chỉ bí truyền. Do việc bí truyền của các thầy Địa lý - chỉ truyền dạy kiến thức Địa lý cho con hoặc học trò "ruột" - nên khoa Địa lý chính tông ngày càng mai một. May sao, trong di sản văn hóa Việt Nam còn có được bộ sách Địa lý của cụ Tả Ao, còn gọi là Địa lý Tả Ao. Sách viết tương đối giản dị nhưng súc tích chứ không rắc rối, mông lung như các sách Địa lý của Trung Hoa. Sách Địa lý Tả Ao chính tông nói thẳng đến phần gốc - phần căn bản, giúp cho người đọc, học Địa lý mau tìm được Long Chân Huyệt Đích.', N'14.5 x 20.5', N'sach82.gif', 15)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S083', N'NXB13', N'DM13', N'Nuôi heo hướng nạc', N'Việt Chương, KS. NGUYỄN VIỆT THÁI', 2015, 96, CAST(28000 AS Decimal(18, 0)), N'Giống tốt đã sẵn, nhưng muốn nuôi heo để có nhiều lời thì người chăn nuôi cần phải am tường cách chọn giống, cách lập chuồng trại, chọn khẩu phần ăn thích hợp và cả cách phòng ngừa bệnh cho vật nuôi…Tất cả những điều liên quan đến kỹ thuật chăn nuôi heo để đạt hiệu quả cao nhất này đã được soạn giả hướng dẫn tường tận trong sách.', N'không', N'sach81.jpg', 0)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S084', N'NXB14', N'DM13', N'Phương pháp nuôi gà tây', N'Việt Chương', 2017, 84, CAST(13000 AS Decimal(18, 0)), N'Gà tây, còn gọi là gà lôi, tên khoa học là Meleagris Gallopavo, do người Ấn Độ và người Pháp du nhập và nuôi tại nước ta khoảng bảy tám chục năm nay. Gà tây dễ thuần hoá, hiền lành với chủ nuôi, không kén ăn. Những năm gần đây nghề chăn nuôi gà tây bắt đầu phát triển mạnh ở nhiều nơi trong cả nước...
Chúc các bạn thành công! ', N'không', N'sach80.jpg', NULL)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S085', N'NXB15', N'DM14', N'Tuyển tập Vũ Trọng Phụng', N'Vũ Trọng Phụng', 2016, 1204, CAST(192000 AS Decimal(18, 0)), N'Ngòi bút sắc sảo của Vũ Trọng Phụng tung hoành trên nhiều thể loại nhưng tư tưởng, tài năng và những đóng góp to lớn của ông được thể hiện chủ yếu ở phóng sự và tiểu thuyết, nhất là tiểu thuyết hiên thực. Ông có những đóng góp nổi bật cho thành tựu của văn học hiện thực Việt Nam giai đoạn 1930-1945 trên các phương diện: khái quát được bức tranh xã hội phong phú, phức tạp, rộng lớn, sức mạnh tố cáo, phê phán mãnh liệt; sáng tạo những nhân vật điển hình bất hủ; lời văn nghệ thuật đặc sắc... Bằng ngòi bút độc đáo của một tài năng lớn, một bản lĩnh nghệ thuật vững vàng, Vũ Trọng Phụng đã có những đóng góp to lớn vào sự phát triển của nền văn xuôi Việt Nam hiện đại. Ông là một "ông vua phóng sự", một "nhà tiểu thuyết trác tuyệt", một bậc thầy của nghệ thuật trào phúng của văn học Việt Nam thế kỉ XX.', N'14.5 x 20.5', N'sach70.png', 26)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S086', N'NXB01', N'DM14', N'Vượt qua rào cản', N'JEFFREY MAKOFF, Rhoda Makoff', 2015, 150, CAST(63000 AS Decimal(18, 0)), N'Trong khi, giữa thành công và thất bại chỉ là ranh giới mong manh; dẫu biết rằng, cuộc sống luôn có đủ thời gian để bạn sửa chữa sai lầm, nhưng nó vô cùng ngắn ngủi nếu bạn mãi lạc lối, đi từ sai lầm này đến sai lầm khác…
Với tư duy giản dị, độc đáo và thực tế, cuốn sách sẽ giới thiệu đến bạn 10+1 bí quyết – giúp bạn vượt qua những tình huống nan giải trong cuộc sống. Qua đó, bạn sẽ:
- Không còn cảm giác cô độc, tức giận, bối rối mỗi khi gặp chuyện nan giải, mà sẽ tự tin với những quyết định của mình.
- Học được các phương cách mà những người thành công và những nhà thông thái trong lịch sử đã sử dụng để ra các quyết định quan trọng.
- Tốn ít thời gian suy nghĩ hơn, nhưng vẫn vượt qua được trở ngại, để dành nhiều tâm sức theo đuổi những mục tiêu tốt đẹp. ', N'không', N'sach69.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S087', N'NXB02', N'DM15', N'Không bao giờ là thất bại, tất cả là thử thách', N'Chung Ju Yung', 2017, 73, CAST(39000 AS Decimal(18, 0)), N'Người viết cuốn tự truyện độc đáo này là một con người kiên định, với ý chí tự lập của mình dám đương đầu với mọi thử thách, trở ngại trong cuộc đời, dám nghĩ dám làm, dám ước mơ và dám vượt qua những khó khăn thử thách để thực hiện những ước mơ và dự định tưởng chừng không thể của mình.

Đây là một minh chứng sống về ý chí và năng lực không giới hạn của con người khi đã có lòng nhiệt huyết, say mê - một người đã xem những thất bại - cho dù là thất bại cay đắng nhất - không phải là thất bại - mà chỉ là thử thách của cuộc sống tôi rèn bản lĩnh của chính mình. Tác giả và nhân vật trong cuốn tự truyện này là một người Hàn Quốc nổi tiếng: Chung Ju Yung - người đã sáng lập và là cố chủ tịch của tập đoàn Huyndai.

Qua từng trang sách chúng ta sẽ cùng khám phá cuộc đời thăng trầm rất thực và tính cách thú vị của cậu thanh niên vùng nông thôn với ước mơ lớn từ hai bàn tay trắng đã trở thành một trong những doanh nhân nổi tiếng nhất trong lịch sử các tập đoàn công nghiệp hàng đầu Hàn Quốc và châu Á.', N'14 x 20.5', N'sach68.gif', 62)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S088', N'NXB03', N'DM16', N'Thiền chữa lành thân và tâm', N'Tulku Thondup', 2020, 285, CAST(76000 AS Decimal(18, 0)), N'Chắc hẳn trong chúng ta ai cũng có những phút giây trong đời say đắm trước một vẻ đẹp hay bị cuốn vào một việc nào đó đến nỗi quên cả thời gian lẫn không gian. Những khoảnh khắc ấy là báu vật, là sự biến đổi đột ngột sang một dạng tồn tại khác – nơi mà những ưu tư, phiền muộn ngày qua ngày vơi đi, nơi mà bằng cách nào đó, chúng ta thoát khỏi gánh nặng thường ngày.


Trạng thái đó được các nhà tâm lý học gọi dưới cái tên dòng tư tưởng (flow), một từ dùng để chỉ sự lưu chuyển của tư tưởng mà ta trải qua vào giây phút đó. Dưới góc độ phân tích  về cảm xúc của con người, dòng tư tưởng lên đến đỉnh cao khi chúng ta ở trong trạng thái tốt nhất: tâm an bình. Những trạng thái này không thể có được từ thói quen hay do ta thiết lập, mà là những món quà ta được ban tặng.

Món quà ấy chính là một tâm thức cùng với một trái tim an bình. Gần đây, ngày càng có nhiều bằng chứng cho thấy mối liên hệ giữa tâm trí và cơ thể, và việc đi vào những trạng thái cực điểm đó khiến cho sức khỏe thể chất được tăng cường. Người ta dường như không còn nghi ngờ rằng tâm trạng tích cực sẽ tang cường sức đề kháng của hệ miễn dịch và làm giảm nguy cơ về tim mạch.', N'24 x 15.5', N'sach67.jpg', 158)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S089', N'NXB05', N'DM16', N'Châm cứu bàn tay', N'Soon Ae Kwak', 2020, 207, CAST(88000 AS Decimal(18, 0)), N'Kể từ sau khi được xuất bản tại Hàn Quốc vào năm 2012 cho đến nay, cuốn Châm cứu bàn tay - vừa dễ vừa hay thực sự đã nhận được sự quan tâm và yêu mến từ rất nhiều độc giả.

Nếu trước đây, ở Hàn Quốc, phương pháp chữa trị các loại bệnh đều được hiểu chung là “Tây y” thì thời gian gần đây, những khái niệm như y học thay thế, y học bổ sung đang dần được nhắc đến nhiều hơn trên các phương tiện truyền thông đại chúng. Những phương pháp chữa bệnh có tác động trực tiếp đến cơ thể con người – một vũ trụ thu nhỏ kỳ diệu và thần bí – khi áp dụng lên người bệnh cần phải “tuyệt đối” không có tác dụng phụ hay sự nguy hiểm, đồng thời phải dễ thực hiện. Vì vậy, để ngày càng nhiều người có cơ hội tiếp cận với phương pháp châm cứu bàn tay, chúng tôi đã tập trung chọn ra những phương pháp châm cứu cần thiết nhất trong sinh hoạt hằng ngày.', N'24 x 15.5', N'sach66.jpg', 51)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S090', N'NXB06', N'DM17', N'Tích hợp toán, tin, vật lý', N'TS. Nguyễn Ngọc Giang', 2019, 99, CAST(144000 AS Decimal(18, 0)), N'Tích hợp hiện đang là xu hướng chủ đạo trong dạy học và nghiên cứu ờ bậc phổ thông. Cuốn Tích Hợp Toán, Tin Và Vật Lý sẽ nghiên cứu vấn đề trên, cuốn sách gồm 3 chương và phần phụ lục:
Chương I. Cơ sở lý luận về tích hợp
Chương II. Tích hợp Toán, Tin và Vật lý qua các bài toán đại số và giải tích
Chương III. Tích hợp Toán, Tin và Vật lý qua các bài toán hình học

Tích Hợp Toán, Tin Và Vật Lý giúp đọc giả nắm bắt được và hình thành cho mình cách nhận thức tích hợp Toán, Tin và Vật Lý qua các bài toán và vận dụng cuốn sách trong tích hợp các định lý, quy tắc, khái niệm.', N'19x27', N'sach65.gif', 62)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S091', N'NXB08', N'DM17', N'Bộ đề bứt phá điểm thi lịch sử', N'Ths. Hồ Như Hiền, Hà Thái Sơn', 2019, 258, CAST(118000 AS Decimal(18, 0)), NULL, N'19x26', N'sach64.jpg', 25)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S092', N'NXB09', N'DM19', N'70 món ăn bài thuốc', N'Quỳnh Hương', 2019, 160, CAST(250000 AS Decimal(18, 0)), N'Cuốn sách 70 Món Ăn Bài Thuốc giới thiệu đến độc giả các món ăn thực sự bổ dưỡng tăng cường sinh lực cho các cặp vợ chồng, món ăn cho phụ nữ mang thai và sau khi sinh. Ngoài ra sách còn có hướng dẫn một cách chi tiết cách nấu và lựa chọn các món ăn nhằm giữ sắc đẹp, ngăn ngừa lão hóa cho chị em, thêm nữa là các món ăn bồi bổ cơ thể, các cách chế biến, lựa chọn các loại rượu bổ dưỡng cho đàn ông và phụ nữ.', N'14.5 × 20.5', N'sach63.jpg', 0)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S093', N'NXB10', N'DM18', N'Bộ đề kiểm tra tiếng anh lớp 4', N'Đại Lợi ,  Hương Giang', 2016, 157, CAST(48000 AS Decimal(18, 0)), N'Hiện nay chương trình học tiếng anh của chúng ta đang dần theo xu hướng hiện đại hóa. Việc học tập và thi cử cũng từ đó thay đổi theo.

Cuốn sách BỘ ĐỀ KIỂM TRA TIẾNG ANH LỚP 4 - TẬP 2 bao gồm các đề kiểm tra: Đề kiểm tra 15 phút, đề kiểm tra giữa kì, đề kiểm tra cuối kì và đề thi học sinh giỏi. Các đề kiểm tra này được biên soạn cẩn thận và bám sát chương trình sách giáo khoa mới, có kèm lời giải và đáp án chi tiết để các em dễ dàng đối chiếu kết quả.

Bên cạnh đó, nhà sách trực tuyến Newshop.vn xin giới thiệu đến các bạn đọc giả những cuốn sách học tiếng anh khác củaThe Windy', N'17 x 24', N'sach62.jpg', 27)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S094', N'NXB11', N'DM18', N'Các bài văn tả người tả cảnh', N'Nguyên Lý', 2017, 80, CAST(25000 AS Decimal(18, 0)), N'Trên thị trường các bậc phụ huynh và các em học sinh dễ dàng bắt gặp vô vàn những sách văn hay, sách tham khảo, các bài văn chọn lọc…, tuy nhiên tuyển tập các bài văn tả theo chương trình tiểu học lớp 4, lớp 5 này sẽ do chính các bạn học sinh được tác giả hướng dẫn qua cách phân tích, đề lập dàn ý với giọng văn còn ngây thơ, trong sáng, cách nhìn nhận vấn đề còn đơn giản, câu, chữ chưa chau chuốt, nhưng đây chính là sự cố gắng của các con mà tác giả rất ghi nhận.

Vì lời đã hứa với các thế hệ học sinh trước đấy sẽ in các bài văn của chính các con cho các em năm sau tham khảo, thôi thúc tác giả hoàn thành tuyển tập các bài văn này', N'16 x 24', N'sach61.png', 57)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S095', N'NXB12', N'DM01', N'Truyện kể trước giờ đi ngủ', N'Philip Hawthorn ,  Stephen Cartwright', 2018, 195, CAST(36000 AS Decimal(18, 0)), N'Truyện Kể Trước Giờ Đi Ngủ: Ba Điều Ước
Biết tìm đâu một miền cổ tích
Nơi bà tiên kể chuyện, ngâm thơ
Trong đêm tối, người tí hon khâu vá
Ông Kẹ lùn thua trí bác nông dân
Có chú bé to bằng ngón tay cái...', N'19X24', N'sach60.gif', 36)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S096', N'NXB07', N'DM01', N'Hoàng tử bé', N'Nhiều Tác Giả', 2017, 60, CAST(39000 AS Decimal(18, 0)), N'Hoàng Tử Bé đã trở lại hành tinh B612 của cậu ấy. Ở đây, cậu trải qua ngày tháng yên bình với những người bạn Hoa Hồng và Cáo, đắm chìm trong những giấc mơ giữa bầu trời đầy sao lấp lánh… Nhưng rồi một ngày kia những ngôi sao vụt tắt, Rắn, kẻ thủ thù cũ của cậu quay trở lại xâm chiếm vũ trụ! Hoàng Tử Bé là người duy nhất có thể chống lại hắn, kẻ phá vỡ những giấc mơ… Từ đây, cuộc phiêu lưu của Hoàng Tử Bé và người bạn Cáo bắt đầu.

Khi Hoàng Tử Bé đến hành tinh này, em làm quen với người Gió (họ được gọi tên như vậy vì năng lượng duy nhất của họ là gió). Gió giúp làm nóng hành tinh của họ đang bị đe doạ đóng băng. Nhưng gần đây họ gặp phải một vấn đề: gió yếu dần đi. Hoàng Tử Bé đã tìm ra nguyên nhân của vấn đề đến từ mâu thuẫn giữa Người cai quản gió và con trai Zéphyr của ông ta.', N'16x22', N'sach59.gif', 41)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S097', N'NXB08', N'DM09', N'20 phút làm chủ thời gian', N'Harvard Business Review Press', 2016, 104, CAST(39000 AS Decimal(18, 0)), N'Bạn có quá nhiều việc để làm nhưng lại có quá ít thời gian. Điều đó khiến bạn mệt mỏi, căng thẳng và gây ảnh hưởng không nhỏ đến thành công của mỗi người. Mặc dù không có phép màu nào để thêm giờ cho một ngày, nhưng mỗi người có thể học cách quản lý thời gian của bản thân thật hiểu quả, bất kể thời gian của chúng ta có hạn hẹp đến thế nào đi chăng nữa. Những kỹ năng được giới thiệu trong 20 Phút Làm Chủ Thời Gian sẽ giúp bạn thực hiện điều đó.', N'12 x 18', N'sach55.gif', 14)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S098', N'NXB08', N'DM09', N'Con đường thăng tiến', N'Matsushita Konosuke', 2016, 144, CAST(63000 AS Decimal(18, 0)), N'Con Đường Thăng Tiến là cuốn sách tổng kết những điều tâm đắc trong sự nghiệp của Matsushita Konosuke trên con đường từ một nhân viên bình thường trở thành ông chủ của tập đoàn điện tử hàng đầu thế giới.

Thông qua cuốn sách, các bạn sẽ mau chóng khám phá ra những bí quyết để thành công, trong đó bao gồm kỹ năng, sự rèn luyện, những mối quan hệ với đồng nghiệp, cấp trên... và quan trọng hơn cả chính là tình yêu với công việc. Con Đường Thăng Tiến chắc chắn sẽ mang lại cho người đọc những bài học quý giá nhằm vượt qua những khó khăn đồng thời phát triến sự nghiệp của bản thân lên một tầm cao mới.', N'13 x 20.5', N'sach54.gif', 4)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S099', N'NXB01', N'DM09', N'Nền giáo dục của người giàu', N'Michael Ellsberg', 2013, 324, CAST(68000 AS Decimal(18, 0)), N'Phải học đại học thì sau này mới thành công? Điều đó chưa chắc đã đúng! Một số người thông minh nhất, thành công nhất trên thế giới chưa từng có bằng đại học. Vậy những kiến thức họ học được, những kỹ năng họ sử dụng, họ đã lấy từ đâu? Cuốn sách Nền giáo dục của người giàu được Alpha Books xuất bản trong tháng 5 này sẽ cho bạn biết điều đó và giúp bạn tìm ra một con đường mới để đi tới thành công.

Thành công là thứ mà tất cả chúng ta đều muốn có. Nhưng nó không dễ dàng đến như chúng ta mong muốn. Thực tế cho thấy có rất nhiều người có bằng cấp, học lực tốt nhưng vẫn thất nghiệp, hoặc đi làm với mức thu nhập không cao. Bên cạnh đó, bạn cũng có thể thấy trên khắp thế giới cũng như ngay ở Việt Nam có hàng trăm, hàng ngàn tỉ phú, triệu phú, những vị giám đốc, họ thành công mà không có bằng đại học, thậm chí là trình độ học vấn rất thấp. Đại học không phải là con đường duy nhất để đến thành công. Bạn hoàn toàn có thể gây dựng nên sự nghiệp mà không cần đến tấm bằng đại học. Sự thành công trên ghế nhà trường không đảm bảo cho sự thành công trong sự nghiệp. Vậy, những gì bạn cần làm là gì ?', N'13 x 20.5', N'sach53.gif', 15)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S100', N'NXB14', N'DM09', N'Bí quyết học đâu nhớ đó', N'Nhiều Tác Giả', 2015, 443, CAST(88000 AS Decimal(18, 0)), N'Quyển sách này sẽ thay đổi cuộc đời bạn. Nó sẽ giúp bạn học hành tấn tới, học đâu nhớ đó hay xuất sắc vượt qua các kỳ thi, nhưng lợi ích thật sự từ quyển sách vượt xa hơn thế nhiều - một khi vận dụng tốt các phương pháp trong sách này, bạn sẽ khai thác triệt để tiềm năng của bộ não mình.Rèn luyện trí nhớ đồng nghĩa với việc tổ chức lại cách thức tư duy, phát triển sự sáng tạo, mài dũa các kỹ năng học tập - đồng thời nâng cao dần những chuẩn mực cuộc sống và những đỉnh cao bạn có thể chinh phục. Bởi thế, luyện trí não không chỉ đơn thuần là cách để học tốt hơn mà còn là bước khởi đầu cho một cuộc đời mới.', N'13x20.5', N'sach26.gif', 140)
GO
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S101', N'NXB03', N'DM01', N'Bé nói giỏi - Đọc thơ tài - Ngôi nhà yêu thương', N'Nhóm Sóc Nâu', 2021, 26, CAST(39200 AS Decimal(18, 0)), N'Tiềm năng của trẻ có được phần lớn nhờ công vun đắp mỗi ngày của cha mẹ. Với sức mạnh thiềm thức, cha mẹ có thể giúp bé ghi nhớ, kích thích tư duy não bộ, khả năng sáng tạo của trẻ thông qua hình ảnh, trò chơi và các câu chuyện ý nghĩa từ thời thơ bé.

Những hình ảnh ăn sâu vào tiềm thức của trẻ sẽ là nền tảng phát triển trí tưởng tượng, nhân cách cao đẹp và trí thông minh ngôn ngữ cho đến khi trẻ trưởng thành. Với bộ sách này, những câu chuyện nho nhỏ sẽ là công cụ hỗ trợ cha mẹ đồng hành cùng bé mỗi ngày.

Chúc bố mẹ và các bé có những giờ thư giãn vui vẻ cùng nhau!', N'19 x 22 cm', N'sach-be-noi-gioi-doc-tho-tai-ngoi-nha-yeu-thuong.jpg', 100)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S102', N'NXB03', N'DM01', N'Áo giáp sầu riêng', N'Nguyễn Trần Thiên Lộc', 2021, 32, CAST(31200 AS Decimal(18, 0)), N'“Truyện tranh cho trẻ nhỏ cần “dễ hiểu, dễ thương và dễ giáo dục hướng thiện”. Bộ sách tranh này đang làm được những điều như vậy. Đây là những đóng góp thật đáng quý cho sự nghiệp giáo dục trẻ nhỏ.” - Tiến sỹ Nguyễn Hồng Vũ, City of Hope, USA. Bố của một bé gái 9 tuổi.

“Bộ sách sẽ khiến bạn mất nhiều thời gian nếu muốn sử dụng một cách tối đa giá trị của nó, bởi vì nó có quá nhiều giá trị! Phụ huynh thường lúng túng với việc: “Chơi gì cùng con? Làm sao để con buông bớt thiết bị thông minh?” Bộ sách này cung cấp cho chúng ta rất nhiều câu trả lời thỏa đáng. Kể chuyện con nghe, cùng con trả lời “vì sao lại thế” và đắm chìm với con vào những mảng màu thật sự tươi, thật sự sống động. Đồng hành cùng con, khó nhưng không phải không có cách!” - Tô Nhi A, Tiến sỹ Tâm lý học', N'20 x 20 cm', N'sach-ao-giap-sau-rieng.jpg', 20)
GO
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0095', N'S006', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0182', N'S016', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0243', N'S034', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0466', N'S055', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0534', N'S001', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0718', N'S003', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0778', N'S013', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0903', N'S018', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C0903', N'S092', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C1044', N'S010', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C1044', N'S011', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C1044', N'S014', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C1199', N'S082', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C1427', N'S016', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2125', N'S015', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2125', N'S018', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2227', N'S015', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2441', N'S011', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2622', N'S100', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C2786', N'S058', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C3497', N'S023', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C3949', N'S025', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C4202', N'S013', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C4627', N'S061', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C4692', N'S015', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C4838', N'S038', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C4838', N'S041', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C5017', N'S071', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C5496', N'S015', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C5496', N'S034', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C5600', N'S013', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C5882', N'S002', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C6017', N'S032', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C6117', N'S049', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C6717', N'S001', 2)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C6717', N'S066', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C6940', N'S053', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C7515', N'S046', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C7515', N'S097', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C7638', N'S042', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C8021', N'S001', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C8332', N'S077', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C8541', N'S013', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C8914', N'S011', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C8914', N'S013', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C9223', N'S001', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C9365', N'S050', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C9649', N'S030', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C9831', N'S011', 1)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'C9941', N'S014', 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM01', N'Sách thiếu nhi', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM02', N'Sách văn học', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM03', N'Sách tình yêu', N'16+')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM04', N'Từ điển', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM05', N'Sách kiến thức bách khoa', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM06', N'Sách bán chạy', N'top sales')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM07', N'Sách mới', N'new')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM08', N'Sách ngoại ngữ', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM09', N'Sách kĩ năng sống', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM10', N'Sách chính trị - luật pháp', N'triết học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM11', N'Sách quản lý - kinh doanh', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM12', N'Sách nghệ thuật - kiến trúc', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM13', N'Sách nông nghiệp', N'bonsai')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM14', N'Sách giảm giá', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM15', N'Sách cũ', N'giảm giá')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM16', N'Sách y học', N'tdtt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM17', N'Sách luyện thi', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM18', N'Sách tham khảo', N'luyện thi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM19', N'Sách nữ công gia chánh', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'DM20', N'Sách thưởng thức đời sống', N'không')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH1088', N'Vũ Thị Hà', N'Nữ', CAST(N'2021-07-26T00:00:00.000' AS DateTime), N'0234234324     ', N'havu@gmail.com                                                                                      ', N'số 25, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH1185', N'Nguyễn Thị Yến', N'Nữ', CAST(N'2021-03-07T00:00:00.000' AS DateTime), N'0151548454     ', N'yennguyen@gmail.com                                                                                 ', N'số 200, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH1666', N'Trần Văn Lương', N'Nam', CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'0432421321     ', N'luongvan@gmail.com                                                                                  ', N'số 12, đường Trần Duy Hưng, quận Cầu Giấy, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH2141', N'Trần Đức Việt', N'Nam', CAST(N'2021-08-16T00:00:00.000' AS DateTime), N'0785442124     ', N'viet@gmail.com                                                                                      ', N'số 12, đường Minh Khai, quận Hai Bà Trưng, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH2793', N'Nguyễn Thanh Duy', N'Nữ', CAST(N'2021-07-26T00:00:00.000' AS DateTime), N'0321548418     ', N'duynguyen@gmail.com                                                                                 ', N'số 43, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH3225', N'Hoàng Thành', N'Nam', CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'0372287521     ', N'hoangthanh@gmail.com                                                                                ', N'số 24 Ngõ 136  ngách 51', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH3388', N'Nguyễn Hữu Đạt', N'Nam', CAST(N'2021-03-09T00:00:00.000' AS DateTime), N'0312451545     ', N'datnguyen@gmail.com                                                                                 ', N'số 100, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH4358', N'Vũ Thị Thảo', N'Nữ', CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'0243243432     ', N'thaovu@gmail.com                                                                                    ', N'số 100, đường Láng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH4608', N'Hùng', N'Nam', CAST(N'2021-08-01T00:00:00.000' AS DateTime), N'0372287521     ', N'phamthehung2212000@gmail.com                                                                        ', N'số 24 Ngõ 136  ngách 51', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH4884', N'Nguyễn Thị Hải', N'Nữ', CAST(N'2020-08-13T00:00:00.000' AS DateTime), N'0354154854     ', N'hainguyen@gmail.com                                                                                 ', N'số 34, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH5351', N'Đặng Quỳnh Liên', N'Nữ', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'0131321321     ', N'quynhlien@gmail.co                                                                                  ', N'số 1, đường Hoàng Quốc Việt, phường Mai Dịch, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH6238', N'Đỗ Thị Loan', N'Nữ', CAST(N'2020-12-28T00:00:00.000' AS DateTime), N'0327875447     ', N'loando@gmail.com                                                                                    ', N'số 33, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH6638', N'Nguyễn Minh Thư', N'Nữ', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'0363453453     ', N'minhthu@gmail.com                                                                                   ', N'số 200, quận Hoàng Mai, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH6763', N'Khuất Tiến', N'Nam', CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'0372287521     ', N'tien@gmail.com                                                                                      ', N'số 24 Ngõ 136  ngách 51', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH6890', N'Phạm Thanh Tùng', N'Nam', CAST(N'2021-05-03T00:00:00.000' AS DateTime), N'0131232123     ', N'thanhtung@gmail.com                                                                                 ', N'số 1, đường Tôn Thất Tùng, quận Đống Đa, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH8119', N'Trần Quốc Bảo', N'Nam', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'0424324233     ', N'baotran@gmail.com                                                                                   ', N'số 100, đường Trần Phú, quận Hà Đông', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH8136', N'Vũ Đức Hoàng', N'Nam', CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'0312545617     ', N'hoangvu@gmail.com                                                                                   ', N'số 200, phường Mai Dịch, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH8267', N'Vũ Lương Bằng', N'Nam', CAST(N'2021-07-26T00:00:00.000' AS DateTime), N'0123223232     ', N'bangvu@gmail.com                                                                                    ', N'sô 1, đường Cầu Diễn, quận Bắc Từ Liêm, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH8730', N'Khuất Bá Tiến', N'Nam', CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'0123245678     ', N'khuattien@gmail.com                                                                                 ', N'số 24 Ngõ 136  ngách 51', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH8821', N'Phạm Văn Mạnh', N'Nam', CAST(N'2021-05-17T00:00:00.000' AS DateTime), N'0315451545     ', N'phammanh@gmail.com                                                                                  ', N'số 98, đường Tôn Thất Tùng, quận Đống Đa, HN', N'123', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH9206', N'Nguyễn Thị Ánh', N'Nữ', CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'0432432423     ', N'anhnguyen@gmail.com                                                                                 ', N'số 66, đường Giải Phóng, quận Hoàng Mai, HN', N'1', 0)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password], [Lock]) VALUES (N'KH9273', N'Minh Châu', N'Nữ', CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'0123456789     ', N'chaunguyen@gmail.com                                                                                ', N'số 24 Ngõ 136  ngách 51', N'1', 0)
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB01', N'Nhà xuất bản Kim Đồng', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB02', N'Nhà xuất bản Thanh Niên ', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB03', N'Nhà xuất bản Phụ Nữ', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB04', N'Nhà sách Hồng Ân', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB05', N'Nhà sách Tinh Hoa', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB06', N'Việt Thư Books', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB07', N'Tủ sách thiếu nhi', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB08', N'Nhà xuất bản văn hóa', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB09', N'Hoa học trò', N'Hà Nội')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB10', N'Nhà sách Khai Tâm', N'Thái Bình')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB11', N'Nhà sách Minh Lâm', N'Nam Định')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB12', N'Sài Gòn books', N'Sài Gòn')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB13', N'Hải Đăng books', N'Hải Phòng')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB14', N'Nhà sách Đông Á', N'Ninh Bình')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'NXB15', N'Minh Long books', N'Thái Nguyên')
GO
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0095', N'KH4358')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0182', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0243', N'KH9273')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0466', N'KH9273')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0534', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0718', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0778', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C0903', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C1044', N'KH6763')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C1199', N'KH6890')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C1427', N'KH8119')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C2125', N'KH9273')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C2227', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C2441', N'KH6638')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C2622', N'KH2141')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C2786', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C3497', N'KH6763')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C3949', N'KH9273')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C4202', N'KH4884')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C4627', N'KH3225')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C4692', N'KH2793')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C4838', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C5017', N'KH8821')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C5496', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C5600', N'KH6763')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C5882', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C6017', N'KH1185')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C6117', N'KH5351')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C6717', N'KH4884')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C6940', N'KH9206')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C7515', N'KH3225')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C7638', N'KH4608')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C8021', N'KH6763')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C8332', N'KH3225')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C8541', N'KH8136')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C8914', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C9223', N'KH8267')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C9365', N'KH1088')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C9649', N'KH3388')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C9831', N'KH6238')
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'C9941', N'KH6763')
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[ShoppingCart] ([CartID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[ShoppingCart] ([CartID])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
