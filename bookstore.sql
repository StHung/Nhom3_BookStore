USE master
GO
CREATE DATABASE [BookStore]
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[AdminAccount]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[CartDetails]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 7/31/2021 9:00:51 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 7/31/2021 9:00:51 PM ******/
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
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 7/31/2021 9:00:51 PM ******/
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
INSERT [dbo].[AdminAccount] ([Username], [Password], [FullName], [Email], [PhoneNumber]) VALUES (N'hung12345                     ', N'123456                        ', N'Hùng', N'hung@gmail.com', N'0123456789          ')
GO
INSERT [dbo].[Bill] ([BillNo], [CartID], [PurchaseDate], [DeliveryMethod], [PaymentMethod], [DeliveryAddress], [DeliveryState]) VALUES (N'1', N'1', CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'Giao hàng nhanh', N'Thanh toán khi nhận hàng', N'Số 1, đường Cầu Diễn, Hà Nội', N'Đang giao')
GO
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S001', N'1', N'1', N'Từ điển bằng tranh - Thế giới động vật', N'JP Moon', 2020, 28, CAST(69500 AS Decimal(18, 0)), N'Từ Điển Bằng Tranh - Thế Giới Động Vật (Việt Thư) - Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-the-gioi-dong-vat-viet-thu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S002', N'1', N'1', N'Từ điển bằng tranh - Động vật dưới nước', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-dong-vat-duoi-nuoc.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S003', N'1', N'1', N'Từ điển bằng tranh - Hoa, quả, rau củ ', N'JP Moon', 2021, 26, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-hoa-qua-rau-cu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S004', N'1', N'1', N'Từ điển bằng tranh - Chữ cái và số đếm', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-chu-cai-va-so-dem.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S005', N'1', N'1', N'Từ điển bằng tranh - Thế giới loài chim', N'JP Moon', 2021, 28, CAST(69500 AS Decimal(18, 0)), N'Giai đoạn trẻ 0-6 tuổi, trẻ đặc biệt nhạy cảm với màu sắc, hình dạng và sự vật xung quanh mình, ở giai đoạn này trẻ thích tìm tòi, khám phá và tiếp nhận những kiến thức đầu tiên về cuộc sống. 

Làm thế nào để giúp trẻ nhận biết vô vàn những sự vật thú vị và mới lạ trong thế giới tự nhiên một cách chân thực và sống động nhất?

Sách in màu, với kích thước 16 x 23cm bền đẹp và an toàn cho bé.

Cuốn sách được thiết kế dưới dạng từ điển bằng tranh (song ngữ Việt - Anh) tập hợp rất nhiều các ảnh chụp thật, rõ nét và ấn tượng về các loài vật sẽ giúp bé làm quen với thế giới xung quanh và có những từ vựng đầu tiên làm nền tảng cho giao tiếp và tư duy.', N'23 x 16 cm', N'sach-tu-dien-bang-tranh-the-gioi-loai-chim.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S006', N'4', N'2', N'Đàm thoại', N'Võ Phiến', 2000, 332, CAST(106700 AS Decimal(18, 0)), N'"Tập sách này có ba phần.

Phần thứ nhất gồm các bài phỏng vấn: Tác giả đáp lời hoặc của báo chí, hoặc của các đài truyền thanh, truyền hình. Đây là những trao đổi ý kiến, là đối thoại thực sự. Riêng trong trường hợp Mai Thảo, ngoài hai lần đối đáp, còn có một điếu văn đọc trước mộ, tức những câu tiễn biệt không lời đáp.

Phần thứ hai gồm những suy tưởng dưới dạng đối thoại. Ở đây không có người hỏi thực sự: hình thức đối thoại dùng như một kỹ thuật, để mỗi ý kiến được lật qua lật lại, được cứu xét nhiều mặt cho thêm tận tường.

Phần thứ ba là mấy bức thư. Ở đây sự đối đáp không tiếng nói diễn ra trên trang giấy; các cuộc trao đổi ý kiến đều dùng chữ viết thay cho lời nói. Riêng bài "Cái viết lồng lộn" không phải thư gửi cho ai, mà là một bài viết phát sinh nhân lá thư "Cái viết hững hờ", nên cũng xin được kèm theo để tiện đối chiếu.

Đa số các bài trong sách này đã được in tản mác vào các tác phẩm xuất bản trước đây. Các bài khác chưa từng đưa vào sách nào. Lần đầu tiên, tất cả được xuất bản theo sự phân loại trong bộ toàn tập."

Trích NXB giới thiệu', NULL, N'sach-dam-thoai.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S007', N'4', N'2', N'Đất nước quê hương', N'Võ Phiến', 1973, 279, CAST(106700 AS Decimal(18, 0)), N'Tùy bút - tùy hứng mà phóng bút - là một thể rất tự do, gặp gì chép nấy, nghĩ sao nói vậy. Một cơn mưa, một giọng hát, một hớp trà, một trang sách, một tà áo phất phơ dưới gió, một tiếng ve rỉ rả trong rừng... bất kì một cảnh vật nào, một sự việc nào, hễ gợi hứng cho ta cũng có thể là đề tài một thiên tùy bút. Nó tựa như nhật ký mà không phải là nhật ký, vì nó là "bút" chứ không phải là "ký"; nó tựa như nghị luận mà không phải là nghị luận, vì nó là tùy hứng suy đoán chứ không phải dụng ý biện luận.

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
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S008', N'4', N'2', N'Đi vào cõi thơ', N'Bùi Giáng', 1969, 144, CAST(82000 AS Decimal(18, 0)), N'Đi Vào Cõi Thơ theo lối ngẫu nhiên tao ngộ. Cơ duyên sẽ dun dủi... Chẳng nên gò ép cưỡng cầu.

Người viết sách này có dụng tâm không sắp đặt theo thứ tự thứ loại thường thấy. Những bài thơ đến rồi đi. Lời "nhận định" cũng đi rồi đến...

BÙI GIÁNG

(Trích dẫn trong bài TỰA của tác giả)', NULL, N'sach-di-vao-coi-tho.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S009', N'5', N'2', N'Bay đi những cơn mưa phùn', N'Phạm Công Thiện', 1970, 232, CAST(77600 AS Decimal(18, 0)), N'Hắn thổi những cơn mưa phùn qua khung cửa kính hiệu buôn thuốc lá và cà phê. Chỉ có đất Pháp này mới có những quán thuốc lá chuyên bán đủ loại thuốc hút, đồng thời bán phụ thêm cà phê và rượu đỏ: cà phê đen, rượu đỏ và thuốc bao xanh là ba dấu hiệu của đất Pháp: không có ba thứ này, nhất định nước Pháp sẽ không còn những cơn mưa phùn tháng tư. Hắn ngồi bên cạnh khung cửa kính, quán thuốc lá chỉ mang tên vỏn vẹn là tabac café express; quán thuốc nằm đối diện nghĩa địa. Chung quanh đều im lặng, thỉnh thoảng vài tiếng ho, tiếng cửa đẩy vào, tiếng gió rít vào từ những ngày quá khứ. Bây giờ là tháng tư? Thời gian là những tháng tư còn lại. Không, tháng mười rồi. Mưa bụi và lạnh, những cơn mưa phùn tháng mười ở ngoại ô Paris.

Hắn ho khan vài tiếng cho đỡ buồn; trời lạnh quá, im lặng quá, nhiều khi mình phải bày đặt ho khan để thấy rằng mình vẫn còn đó, vẫn sống, vẫn thở và thổi những cơn mưa phùn vào nghĩa địa của ngoại ô đầu thu. Đầu thu hay cuối thu? Đầu cuộc sống và cuối sự chết? A, tôi phải đi. Paris chỉ nằm bên kia sự chết: Saigon, Hànội, Huế, Đàlạt chỉ là những thành phố Paris nằm bên kia sự chết. Giết hết tất cả những thành phố, bôi sạch chữ Paris trong tâm hồn mình, bôi tên, quên họ, bỏ quốc tịch, vứt lại đằng sau lưng những con đường rầy, những đêm tối, những mùa xuân, những quê hương. Làm một kẻ phản quốc, phản bội bạn bè, phản bội tổ tiên, phản bội văn chương, phản bội tùy bút, truyện ngắn và truyện dài. Trung thành với nỗi chết xa và gần, nỗi chết long đong, nỗi chết của những cơn ho gượng, ho cho đỡ buồn. Chỉ có những cơn ho khan là quan trọng, tất cả còn lại chỉ là văn chương.

A, tôi phải đi. Vừa đi vừa ho. Tập ho cho thật nhiều, ho như chưa từng biết ho trong đời. Người ta ho lao và người ta muốn ho lao: tôi không muốn ho lao, tôi chỉ muốn ho khan cho bay đi những cơn mưa phùn tưởng tượng. Dưới kia thung lũng là cỏ khô. Một dấu chấm, một dấu phết, một dấu sắc và một dấu huyền. Tất cả còn lại...', N'13 x 18.8 cm', N'sach-bay-di-nhung-con-mua-phun.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S010', N'5', N'2', N'Thomas Edison - Thiên tài bắt đầu từ tuổi thơ', N'Phạm Công Thiện', 2021, 206, CAST(61000 AS Decimal(18, 0)), N'Cuốn sách gồm những câu chuyện viết về cuộc đời của nhà sáng chế thiên tài Thomas Alva Edison. Ông là một trong những nhà phát minh giàu ý tưởng nhất trong lịch sử nhân loại, có tổng cộng đến 1.500 phát minh được cấp bằng sáng chế - một tượng đài khổng lồ.

Thuở thiếu thời, Edison theo học ngôi trường độc nhất trong thị trấn. Sau rất nhiều lần gây “tai họa” ở lớp bởi những tìm tòi thí nghiệm, cô giáo của Edison đã cho rằng cậu là một đứa trẻ hư hỏng, điên khùng và đần độn. Điều này đã khiến bà Nancy, mẹ của Thomas Edison hết sức tức giận, bà quyết định dạy con học tại nhà. Bà không chỉ dạy Edison về học vấn mà còn rèn luyện cho cậu một phẩm chất đạo đức tốt đẹp. Chính bà đã tạo nên một thiên tài phát minh làm thay đổi lịch sử nhân loại.
 ', NULL, N'sach-thomas-edison-thien-tai-bat-dau-tu-tuoi-tho.jpg', 9)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S011', N'1', N'3', N'Hướng dẫn "sử dụng" tình yêu', N'Văn Thụy', 2021, 400, CAST(111000 AS Decimal(18, 0)), N'Hướng Dẫn "Sử Dụng" Tình Yêu  là cuốn “sách lược” tình cảm dành cho bạn, những người đang trên con đường tìm kiếm tình yêu, những người chìm đắm trong tình yêu, và cả những con người đang đau khổ vì tình yêu.
 

Chuyên gia phân tích tình cảm Vãn Thụy đã gài cắm vào mỗi trang trong Hướng Dẫn "Sử Dụng" Tình Yêu những cách thức và kế hoạch để giúp bạn xây dựng “chiến lược” đến với tình yêu ngọt ngào và thoát khỏi những mối quan hệ tình cảm tồi tệ, giúp bạn hiểu rõ những khía cạnh và cả những góc khuất tình yêu, từ đó mở rộng trái tim yêu thương và bao dung hơn để tận hưởng tình yêu, hoặc cho mình một đường lui đúng cách, đúng thời điểm.

Dù bạn là nam hay nữ, dù cho bạn trẻ hay già, dù bạn độc thân hay đang yêu đương, cuốn sách này sẽ chắc chắn sẽ “soi rọi” và “mở đường” cho bạn bước đi đến cái đích mang tên “hạnh phúc”.', NULL, N'sach-huong-dan-su-dung-tinh-yeu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S012', N'5', N'3', N'Men chase women choose - Chuyện tình yêu bạn biết được bao nhiêu', N'Dawn Maslar', 2021, NULL, CAST(87000 AS Decimal(18, 0)), N'"Làm sao để người ấy chết mê chết mệt tôi?

Làm sao để người ấy không thể dứt bỏ tôi được?"

Khi bạn hiểu được cách mà tình yêu vận hành dưới góc độ khoa học - Men chase women choose, bạn sẽ thôi không đặt những câu hỏi vô nghĩa như vậy nữa, mà sẽ biến những mong ước trong tình yêu của bản thân trở thành sự thật.

Tâm lý sợ bị bỏ rơi, tổn thương từ những đổ vỡ khiến nhiều người lo lắng khi đứng trước tình yêu. Bởi chúng ta nghĩ tình yêu là cảm xúc, thất thường và khó nắm bắt. Nhưng thực ra, tình yêu đầy logic và khoa học.

Giống như tất cả các chu kỳ trong tự nhiên, tình yêu cũng có các giai đoạn phát triển nhất định để đi đến tình yêu đích thực - sự cam kết lâu dài. Chúng ta thường lầm tưởng rằng, não bộ và các hormone trong cơ thể chỉ tác động tới sự đam mê - giai đoạn thu hút và hẹn hò. Nhưng không! Chúng chi phối cả khi chúng ta đã bước vào giai đoạn thấu hiểu và cam kết.

Một khi bạn hiểu được quy luật men chase women choose, việc tìm kiếm và duy trì tình yêu sẽ trở nên dễ dàng hơn nhiều. Bạn sẽ hiểu được:

Tại sao người theo đuổi cần phải là phái mạnh? Phụ nữ có thể thả thính thoải mái nhưng sự chủ động hãy dành phần cho đàn ông! Bởi cảm giác yêu của nam giới chỉ có thể được hình thành qua quá trình chinh phục!

Tại sao nam và nữ lại có cách yêu và những nhu cầu trong tình yêu khác nhau? Hệ thống não Limbic (phụ trách chức năng cảm xúc) của đàn ông nhỏ xíu, bởi vậy nên bản năng của anh ấy là lý trí. Một cô gái thông minh hãy cho anh ấy biết yêu không chỉ là những màn ân ái vồ vập lấy nhau để rồi sau một "cuộc yêu", mỗi người lại trở về với thế giới đơn độc của riêng mình.

Tại sao yêu lâu tình yêu thường nhạt dần? Làm thế nào để giữ mãi ngọn lửa đam mê kể cả khi đã kết hôn lâu năm?

Testosterone và những “hormone tình yêu” khác chi phối tất cả các giai đoạn này! Thạc sĩ sinh học Dawn Maslar đã mang tới cho chúng ta cách áp dụng “khoa học về sự hấp dẫn” trong cuốn sách “Men Chase Women Choose - Chuyện Tình Yêu Bạn Biết Được Bao Nhiêu?" Đây không chỉ là một cuốn sách khoa học tình yêu đơn thuần mà còn là cuốn cẩm nang giúp bạn không còn bị cảm xúc chi phối hay đau khổ vì chuyện tình cảm!', NULL, N'men-chase-women-choose-chuyen-tinh-yeu-ban-biet-duoc-bao-nhieu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S013', N'5', N'3', N'Chưa một lần đau sao gọi là tuổi trẻ', N'Từ Lỗi Tuyên', NULL, NULL, CAST(92000 AS Decimal(18, 0)), N'Tuổi trẻ là giai đoạn đẹp nhất của cuộc đời. Từ những cô bé, cậu bé vô lo vô nghĩ, chúng ta dần dần trở thành những thanh niên trưởng thành. Tuổi trẻ là chuyến hành trình một chiều, và những nỗi ưu phiền, rắc rối xoay quanh những vấn đề học tập, tình bạn, tình yêu, các mối quan hệ trong gia đình, nhà trường và ngoài xã hội luôn là một thế giới đầy những thử thách và thú vị. Chúng ta đều như những chú chim nhỏ háo hức bay ra ngoài kia khám phá thế giới, cho dù có bao nhiêu cay đắng, bao nhiêu vấp ngã, thì quá trình này vẫn luôn đầy ý nghĩa và đây chắc chắn sẽ là giai đoạn khó quên nhất trong cuộc đợi bạn.

Hãy mang theo cuốn sách này và lòng can đảm tiến về phía trước để có những trải nghiệm, cảm nhận và tìm ra lới giải cho những nỗi đau đớn mà bạn đang ôm giữ trong lòng.', NULL, N'teen.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S014', N'4', N'3', N'Gửi người tôi yêu', N'Vũ Hoa', NULL, 554, CAST(84000 AS Decimal(18, 0)), N'Thời học cấp hai, trong một lần đụng phải xe đạp địa hình mà Hứa An Ly gặp Đường Lý Dục, một cậu học sinh học trên mình mấy lớp. Tình cảm trong trẻo lớn dần theo năm tháng.

Đường Lý Dục vào đại học B, tại Thanh Đảo. Hứa An Ly cũng nỗ lực thi vào đại học B. Tình yêu mà Hứa An Ly dành cho Đường Lý Dục vẫn tràn trề, nhưng phía Đường Lý Dục sau thời gian xa cách đã tìm thấy tình yêu với Thẩm Anh Xuân, một cô gái xinh đẹp, xuất thân trong gia đình giàu có, cha mẹ của Thẩm Anh Xuân đang sống bên Mỹ.

Hứa An Ly vì muốn quên Đường Lý Dục nên đã yêu Tần Ca. Nhưng đó chỉ là mối tình lấp đầy khoảng trống. Để chứng tỏ sự cao thượng của mình với Thẩm Anh Xuân, Hứa An Ly đã nhiều lần đấu tranh tư tưởng để quên Đường Lý Dục. Nhưng càng nỗ lực, cô càng thấy đau khổ.

Hứa An Ly đã quyết định dâng hiến cho Tần Ca để "dứt tình” với Đường Lý Dục. Có lẽ cuộc đời của Hứa An Ly đã yên phận và trở nên đẹp đẽ nếu Đường Lý Dục không bị tai nạn, nguy hiểm đến tính mạng, anh bị mất trí nhớ. Hứa An Ly đã bất chấp tất cả để quay về chăm sóc Đường Lý Dục, cô nhận ra tình yêu mình dành cho Đường Lý Dục thật mãnh liệt.

Đúng lúc cô và Đường Lý Dục đang ở bên nhau, Thẩm Anh Xuân từ Mỹ trở về.

Hứa An Ly, Thẩm Anh Xuân, liệu ai sẽ là người chiếm được trái tim Đường Lý Dục ở phần kết câu chuyện hấp dẫn này?', NULL, N'gui-nguoi-toi-yeu-biatruoc.gif', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S015', N'1', N'1', N'Hồ ly biết yêu', N'Diệp Lạc Vô Tâm', NULL, 476, CAST(107000 AS Decimal(18, 0)), N'Nàng là hồ ly, vốn thuộc về ma giới - nơi quanh năm suốt tháng chìm trong mây mù, dù thần tiên cũng không thể đi vào; chàng là thần tiên, là mặt trời chiếu sáng cho muôn loài, được thế gian muôn đời sùng bái.

Luật trời viết rằng, thần tiên và yêu ma không thể ở bên nhau. Nhưng trái tim nàng mách bảo rằng, ngoài chàng ra, nàng không muốn ở bên bất cứ một người nào khác.

Số mệnh đã định, rằng nàng sinh ra để làm chủ nhân của ma giới, nhưng nàng chỉ muốn làm chủ nhân của trái tim chàng.

Liệu có một ngày, vầng dương kia thôi chiếu sáng, để trở thành một phu quân bình thường của hồ ly? Liệu có một ngày, hồ ly kia không còn chống lại số mệnh nữa, chấp nhận làm phu nhân của ma vương? Liệu có một ngày, ma giới kia không còn u ám nữa, để ánh dương chiếu tỏ?

Bất kể thế nào, hồ ly cũng tin rằng, dù nàng không còn gì cả, ánh dương vẫn chỉ thuộc về mình nàng mà thôi. Có hồ ly, ánh dương kia càng thêm rực rỡ. Có vầng dương, hồ ly… lần đầu biết yêu…', NULL, N'ho-ly-biet-yeu.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S016', N'3', N'5', N'Bí ẩn mãi mãi là bí ẩn - Nền văn minh cổ đại', N'Tony Hưng', NULL, NULL, CAST(46000 AS Decimal(18, 0)), N'Quá khứ nhân loại với bao bí ẩn chưa khám phá, tồn tại quanh ta. Giới khảo cổ quan tâm đến việc tìm ra lời đáp lịch sử của nhân loại và nghiên cứu bí ẩn của quá khứ. Chúng ta nghiên cứu về con người, địa điểm và sự kiện qua huyền thoại và truyền thuyết đã không còn nữa - hoặc có lẽ đã không hề tồn tại ngoại trừ trong khả năng tưởng tượng của con người. Tổ tiên lâu đời của chúng ta từ nơi nào đến, chúng ta tiến hóa và phát triển ra sao? Chúng ta tự hỏi điều gì đã diễn ra đối với các đế quốc thành công và rõ ràng bất khả chiến bại lại có thể đột nhiên sụp đổ và biến mất, chúng ta cũng không thể hiểu ông cha của mình đã xây dựng các công trình tưởng niệm đồ sộ nhất bằng cách nào và tại sao.

Cuốn sách cung cấp đầy đủ các thông tin về các bí ẩn lớn của thế giới cổ đại như: Thành Troy, văn minh Chan Chan, nền văn minh Hy Lạp, v.v... và các thông tin về các cổ vật bí ẩn.', NULL, N'sach-bi-an-mai-mai-la-bi-an-nen-van-minh-co-dai.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S017', N'2', N'1', N'Kỳ quan thế giới', N'Joan Ricart', NULL, NULL, CAST(424000 AS Decimal(18, 0)), NULL, NULL, N'sach-ky-quan-the-gioi.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S018', N'5', N'5', N'Bí ẩn của lịch sử', N'Nuria Cicero', NULL, 255, CAST(424150 AS Decimal(18, 0)), NULL, NULL, N'sach-bi-an-cua-lich-su.jpg', NULL)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S019', N'3', N'5', N'Lịch sử thế giới', N'Nguyễn Hiền Lê, Thiên Giang Trần Kim Bảng', NULL, 848, CAST(175000 AS Decimal(18, 0)), N'Bộ Lịch Sử Thế Giớicó trên tay bạn đọc là một tác phẩm hợp soạn của hai tác giả: Nguyễn Hiền Lê (1912-1984), Thiên Giang Trần Kim Bảng (1911-1985) xuất bản từ những năm 1954-1955 tại Sài Gòn - sách chỉ in có một lần - và gần 9 năm sau (1964) mới được tái bản bởi vì "vài uẩn khúc" của nó. Hiện nay bộ sách gần như tuyệt bản. 

Đây là một bộ sách phổ thông được viết bởi một sử quan khoáng đạt mà nhiệt tâm, cộng với phương pháp khoa học chính xác. Bởi các lý do vừa nêu, nhà xuất bản chúng tôi xin phép gia đình tác giả cho in lại bộ sách này nhằm giúp độc giả có thêm tài liệu tham khảo.', NULL, N'lich-su-the-gioi.jpg', 10)
INSERT [dbo].[Book] ([BookID], [PublisherID], [CategoryID], [Tittle], [Author], [ReleaseYear], [NumberOfPages], [Price], [Description], [Dimension], [Images], [Quantity]) VALUES (N'S020', N'2', N'5', N'Trật tự thế giới', N'Henry Kissinger', NULL, 474, CAST(167000 AS Decimal(18, 0)), N'Trong tác phẩm, Kissinger xuất phát từ Hòa ước Westphalia để phân tích về tương quan giữa các nước, chủ yếu là các cường quốc và các khu vực giữ một vai trò đặc biệt đối với bức tranh địa chính trị thế giới, với những khác biệt trong thế giới quan và vị trí địa lý đã ảnh hưởng đến chính sách ngoại giao của mỗi nước như thế nào. Tác giả dành chương cuối (chương 9) để bàn về vấn đề toàn cầu hoá trong thời đại khoa học công nghệ, đặc biệt là tin học và truyền thông đại chúng lan tràn đã tác động mạnh mẽ đến dư luận, các nhà lãnh đạo và các quyết định chính trị hiện nay.

Theo cách nhìn của Kissinger thì trật tự thế giới ngày nay cần được đặt trên hai yếu tố căn bản:

1. Nguyên tắc tôn trọng chủ quyền của mỗi quốc gia có tính chính danh dựa trên căn bản của các hiệp ước và tổ chức quốc tế;
2. Và để đảm bảo duy trì hòa bình và ổn định trên thế giới cũng như các khu vực, cần phải dựa trên một sự cân bằng quyền lực mà chủ yếu phụ thuộc vào các cường quốc thế giới và khu vực.

Để có một trật tự quốc tế tồn tại và bền vững, Kissinger cho rằng nó phải liên quan đến “quyền lực có tính chính danh.” Tới cuối cùng, Kissinger, con người thực tế và nổi tiếng, lại có vẻ duy tâm đến mức ngạc nhiên. Thậm chí khi có những sự xung đột giữa các giá trị Mỹ và các mục tiêu khác, ông khích lệ chúng ta hãy tiếp tục đứng lên vì những giá trị đó, không lẩn tránh; đi đầu trong việc trợ giúp các quốc gia dân tộc, các lực lượng chính danh, chứ không chỉ các chính phủ đơn độc, nếu những sự trợ giúp ấy đảm bảo cho cán cân quyền lực có thể chống đỡ trật tự quốc tế, cũng như những giá trị và nguyên tắc của chúng ta có thể được những người khác chấp nhận và hấp dẫn họ.', NULL, N'trat-tu-the-gioi-12.jpg', 10)
GO
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'1', N'S001', 3)
INSERT [dbo].[CartDetails] ([CartID], [BookID], [Amount]) VALUES (N'1', N'S002', 2)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'1', N'Sách thiếu nhi', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'2', N'Sách văn học', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'3', N'Sách tình yêu', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'4', N'Từ điển', N'không')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'5', N'Sách kiến thức bách khoa', N'không')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password]) VALUES (N'1', N'Bằng', N'Nam', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'0123456789     ', N'bang@gmail.com                                                                                      ', N'Hà Nội', N'123456')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password]) VALUES (N'KH6763', N'Phạm Thế Hùng', N'Nam', CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'0372287521     ', N'tien@gmail.com                                                                                      ', N'số 24 Ngõ 136  ngách 51', N'123456')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Gender], [DateOfBirth], [PhoneNumber], [Email], [Address], [Password]) VALUES (N'KH7070', N'Phạm Thế Hùng', N'Nam', CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'0372287521     ', N'phamthehung2212000@gmail.com                                                                        ', N'số 24 Ngõ 136  ngách 51', N'123456')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'1', N'Nhà xuất bản Kim Đồng', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'2', N'Nhà xuất bản Thanh Niên ', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'3', N'Nhà xuất bản Phụ Nữ', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'4', N'Nhà sách Hồng Ân', N'Việt Nam')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address]) VALUES (N'5', N'Nhà sách Tinh Hoa', N'Việt Nam')
GO
INSERT [dbo].[ShoppingCart] ([CartID], [CustomerID]) VALUES (N'1', N'1')
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
