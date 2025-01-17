USE [QLBanHang]
GO
/****** Object:  Table [dbo].[CT_HOA_DON]    Script Date: 3/19/2024 12:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HOA_DON](
	[mahd] [char](10) NOT NULL,
	[masp] [char](10) NOT NULL,
	[soluong] [int] NOT NULL,
	[dongia] [money] NOT NULL,
 CONSTRAINT [PK_CT_HOA_DON] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOA_DON]    Script Date: 3/19/2024 12:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOA_DON](
	[mahd] [char](10) NOT NULL,
	[ngaylap] [datetime] NOT NULL,
	[makh] [char](10) NOT NULL,
 CONSTRAINT [PK_HOA_DON] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 3/19/2024 12:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[makh] [char](10) NOT NULL,
	[hoten] [nvarchar](100) NOT NULL,
	[gioitinh] [nchar](10) NOT NULL,
	[dthoai] [char](11) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAN_PHAM]    Script Date: 3/19/2024 12:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN_PHAM](
	[masp] [char](10) NOT NULL,
	[tensp] [nvarchar](50) NOT NULL,
	[ngaysx] [datetime] NOT NULL,
	[dongia] [money] NOT NULL,
 CONSTRAINT [PK_SAN_PHAM] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'HD001     ', N'0000000002', 2, 6.0000)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'HD002     ', N'0000000003', 1, 14.0000)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'HD003     ', N'0000000005', 4, 4.0000)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'HD004     ', N'0000000001', 5, 10.0000)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'HD006     ', N'0000000004', 1, 9.0000)
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'HD001     ', CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'A0000000B1')
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'HD002     ', CAST(N'2023-11-12T00:00:00.000' AS DateTime), N'A0000000B2')
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'HD003     ', CAST(N'2012-01-07T00:00:00.000' AS DateTime), N'A0000001B3')
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'HD004     ', CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'B0000000C1')
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'HD006     ', CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'C0000001A4')
GO
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (N'A0000000B1', N'Trần Hùng Anh', N'Nam       ', N'0918093215 ', N'KTX B')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (N'A0000000B2', N'Nguyễn Minh Anh', N'Nữ        ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (N'A0000001B3', N'Huấn Bùi', N'Nam       ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (N'B0000000C1', N'Trần Văn Bảy', N'Nam       ', N'0946178115 ', N'Cà Mau')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (N'C0000001A4', N'Nguyễn Trà My', N'Nữ        ', NULL, N'Đầm Dơi')
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'0000000001', N'Giấy ăn', CAST(N'2022-03-22T00:00:00.000' AS DateTime), 2.0000)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'0000000002', N'Bút', CAST(N'2023-11-19T00:00:00.000' AS DateTime), 3.0000)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'0000000003', N'Kem đánh răng', CAST(N'2019-07-22T00:00:00.000' AS DateTime), 14.0000)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'0000000004', N'Bàn chải', CAST(N'2024-01-09T00:00:00.000' AS DateTime), 9.0000)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'0000000005', N'Tăm', CAST(N'2012-06-12T00:00:00.000' AS DateTime), 1.0000)
GO
ALTER TABLE [dbo].[CT_HOA_DON] ADD  CONSTRAINT [DEFAULT_CT_HOA_DON_soluong]  DEFAULT ((1)) FOR [soluong]
GO
ALTER TABLE [dbo].[CT_HOA_DON]  WITH CHECK ADD  CONSTRAINT [FK_CT_HOA_DON_KHACH_HANG] FOREIGN KEY([mahd])
REFERENCES [dbo].[HOA_DON] ([mahd])
GO
ALTER TABLE [dbo].[CT_HOA_DON] CHECK CONSTRAINT [FK_CT_HOA_DON_KHACH_HANG]
GO
ALTER TABLE [dbo].[CT_HOA_DON]  WITH CHECK ADD  CONSTRAINT [FK_CT_HOA_DON_SAN_PHAM] FOREIGN KEY([masp])
REFERENCES [dbo].[SAN_PHAM] ([masp])
GO
ALTER TABLE [dbo].[CT_HOA_DON] CHECK CONSTRAINT [FK_CT_HOA_DON_SAN_PHAM]
GO
ALTER TABLE [dbo].[HOA_DON]  WITH CHECK ADD  CONSTRAINT [FK_HOA_DON_KHACH_HANG] FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[HOA_DON] CHECK CONSTRAINT [FK_HOA_DON_KHACH_HANG]
GO
