create database [Book]
USE [Book]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL primary key,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	foreign key (cateID) references Category(cid)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
	foreign key (AccountID) references Account(uID),
	foreign key (ProductID) references Product(id),
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Adam', N'123456', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Admin', N'Admin', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'Katell', N'HWV8ZN', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'Zahir', N'NPX7OF', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Anime')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Kĩ năng sống')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Tiểu sử hồi kí')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Kinh Tế')
SET IDENTITY_INSERT [dbo].[product] ON 
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) 
VALUES 
(9, N'BlueLock - Tập 16', N'https://cdn0.fahasa.com/media/catalog/product/b/l/bluelock_bia_tap-16-1.jpg', 33.250, N'Nhà cung cấp:Nhà Xuất Bản Kim Đồng
', N'HIỆP 2 TRẬN ĐẤU GIỮA BLUELOCK VỚI TUYỂN U-20 LÀ MỘT TRẬN QUYẾT CHIẾN NGANG TÀI NGANG SỨC ĐẾN PHÚT CUỐI CÙNG!!
Để đối phó với đợt tấn công dữ dội từ tuyển U-20 với trọng tâm là trạng thái “FLOW” của Itoshi Sae và Shido Ryusei, phía BLUELOCK đã tung con át chủ bài Baro vào sân. Trận đấu vượt xa mọi kế sách, toan tính và biến thành một trận tử chiến. Trong lúc cả hai đội đang nỗ lực hết mình, sân cỏ thực sự trở thành một chuẩn mực mới của bóng đá Nhật Bản, nơi mỗi cá nhân đều nhắm đến “FLOW” và vươn tới đỉnh cao! Liệu Isagi và đồng đội có sút bay được cánh cửa mở ra thời đại mới!?
', 1, 14)
(10, N'Frieren - Pháp Sư Tiễn Táng - Tập 2', N'https://cdn0.fahasa.com/media/wysiwyg/hieu_kd/2023-08-frame/FrameAds_03_1080X1080.png', 42750, N'Nhà cung cấp:Nhà Xuất Bản Kim Đồng', N'Frieren là một pháp sư yêu tinh trường thọ. Cùng với Fern - học trò của mình, họ lại một lần nữa hướng mục tiêu về lâu đài Quỷ vương, nơi được coi là vùng đất mà linh hồn của các dũng sĩ an nghỉ và cũng là để tìm lại những dấu tích trong chuyến phiêu lưu cùng Himmel và mọi người. Trên đường đi, họ đã gặp Stark, học trò của chiến binh Eisen. Câu chuyện chuyển sang chương mới đầy ắp những kỉ niệm. Mời các bạn thưởng thức tác phẩm hậu phiêu lưu kết nối những thế hệ của các anh hùng!', 1, 15),
(11, N'Hiểu Về Trái Tim (Tái Bản 2023)', N'https://cdn0.fahasa.com/media/catalog/product/z/4/z4118763446785_cf4bc22d353b065bbb37e686de1f9207.jpg', 135880, N'Nhà cung cấp:FIRST NEWS', N'“Hiểu về trái tim” là một cuốn sách đặc biệt được viết bởi thiền sư Minh Niệm. Với phong thái và lối hành văn gần gũi với những sinh hoạt của người Việt, thầy Minh Niệm đã thật sự thổi hồn Việt vào cuốn sách nhỏ này.', 2, 16),
(12, N'Điệp Viên Hoàn Hảo X6 - Phạm Xuân Ẩn', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935086855737.jpg', 124600, N'Nhà cung cấp:FIRST NEWS', N'Ấn bản mới này có bổ sung Lời giới thiệu của tác giả cho lần tái bản 2013 “Sáu năm sau: hồi tưởng về sách Điệp Viên Hoàn Hảo”. Larry Berman viết: “…cuộc đời của Ẩn không chỉ là một câu chuyện chiến tranh mà còn là câu chuyện về hàn gắn, về lòng trung thành với đất nước và bạn bè.', 3, 17),
(13, N'Sử Ký FPT 35 Năm - Từ Tay Trắng Đến Tập Đoàn Toàn Cầu - Bìa Cứng', N'https://cdn0.fahasa.com/media/catalog/product/f/p/fpt_shopee-tru___o______c.jpg', 350000, N'Nhà cung cấp:Rio Book', N'Trên hành trình 35 năm gây dựng và phát triển, từ không vốn liếng, không kinh nghiệm, bạn có tò mò liệu FPT đã làm những gì để vươn lên trở thành tập đoàn công nghệ tư nhân lớn nhất Việt Nam? Cuốn sách này sẽ cho bạn một phác họa chân thực về con đường gian nan mà FPT đã trải qua.', 4, 18);
SET IDENTITY_INSERT [dbo].[product] OFF
