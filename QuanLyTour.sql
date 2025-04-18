USE [QuanLyTour]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/3/2024 11:35:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[MaPhieu] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[NgayThanhToan] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTour]    Script Date: 12/3/2024 11:35:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTour](
	[MaLoaiTour] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTour] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/3/2024 11:35:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](20) NULL,
	[MatKhau] [varchar](20) NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[TrangThai] [bit] NULL,
	[LoaiTaiKhoan] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatTour]    Script Date: 12/3/2024 11:35:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatTour](
	[MaPhieu] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[NgayDatTour] [datetime2](7) NULL,
	[MaTour] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[NgayDi] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 12/3/2024 11:35:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[MaTour] [int] IDENTITY(1,1) NOT NULL,
	[TenTour] [nvarchar](50) NULL,
	[MaLoaiTour] [int] NULL,
	[TrangThai] [bit] NULL,
	[GiaTour] [decimal](18, 0) NULL,
	[HinhAnh1] [varchar](50) NULL,
	[HinhAnh2] [varchar](50) NULL,
	[HinhAnh3] [varchar](50) NULL,
	[MoTa] [nvarchar](4000) NULL,
	[LichTrinh] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [MaPhieu], [TongTien], [NgayThanhToan]) VALUES (1, 2, 8, CAST(7800000 AS Decimal(18, 0)), CAST(N'2024-12-03T10:38:31.5130000' AS DateTime2))
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [MaPhieu], [TongTien], [NgayThanhToan]) VALUES (2, 2, 9, CAST(11700000 AS Decimal(18, 0)), CAST(N'2024-12-03T11:28:17.5570000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiTour] ON 

INSERT [dbo].[LoaiTour] ([MaLoaiTour], [TenLoaiTour]) VALUES (1, N'Trong nước')
INSERT [dbo].[LoaiTour] ([MaLoaiTour], [TenLoaiTour]) VALUES (2, N'Nước ngoài')
SET IDENTITY_INSERT [dbo].[LoaiTour] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (1, N'admin', N'1111', N'Quản trị viên', N'', N'', 1, 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (2, N'tanvu', N'1111', N'Lê Tấn Đạt', N'320 Nguyễn Oanh, Gò vấp, Phường 119', N'0123456789', 1, 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (3, N'ngocdung', N'1111', N'Nguyễn Ngọc Dũng', N'12 Công Thái, Quận 12, phường 12 ....', N'0772345678', 0, 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (4, N'minhngoc', N'1111', N'Lê Ngọc Minh', N'43 Nguyễn Trãi', N'0773123456', 1, 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (5, N'minhhieu', N'1111', N'Lê Minh Hiếu', N'77 Lê Trung Nghĩa', N'01234566879', 1, 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [DiaChi], [SoDienThoai], [TrangThai], [LoaiTaiKhoan]) VALUES (6, N'zzz1', N'1111', N'test', N'test', N'123456789', 1, 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuDatTour] ON 

INSERT [dbo].[PhieuDatTour] ([MaPhieu], [MaNguoiDung], [NgayDatTour], [MaTour], [SoLuong], [NgayDi]) VALUES (8, 2, CAST(N'2024-12-03T10:38:31.5070000' AS DateTime2), 1, 2, CAST(N'2024-12-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[PhieuDatTour] ([MaPhieu], [MaNguoiDung], [NgayDatTour], [MaTour], [SoLuong], [NgayDi]) VALUES (9, 2, CAST(N'2024-12-03T11:28:17.5500000' AS DateTime2), 1, 3, CAST(N'2024-12-10T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[PhieuDatTour] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (1, N'Đà Nẵng', 1, 0, CAST(3900000 AS Decimal(18, 0)), N'danang2.jpg', N'danang1.jpg', N'danang1.jpg', N'check', N'check')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (2, N'Singapore', 1, 1, CAST(4900000 AS Decimal(18, 0)), N'danang1.jpg', N'danang1.jpg', N'danang1.jpg', N'oke ', N'oke')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (3, N'Thái Lan', 2, 1, CAST(4900000 AS Decimal(18, 0)), N'danang1.jpg', N'danang1.jpg', N'danang1.jpg', NULL, NULL)
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (4, N'Campuchia', 2, 1, CAST(4900000 AS Decimal(18, 0)), N'danang1.jpg', N'danang1.jpg', N'danang1.jpg', NULL, NULL)
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (5, N'Nhật Bản', 2, 1, CAST(4900000 AS Decimal(18, 0)), N'danang1.jpg', N'danang1.jpg', N'danang1.jpg', NULL, NULL)
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (6, N'Phố cổ Hội An', 1, 0, CAST(3500000 AS Decimal(18, 0)), N'hoian1.jpg', N'hoian1.jpg', N'hoian1.jpg', NULL, NULL)
INSERT [dbo].[Tour] ([MaTour], [TenTour], [MaLoaiTour], [TrangThai], [GiaTour], [HinhAnh1], [HinhAnh2], [HinhAnh3], [MoTa], [LichTrinh]) VALUES (7, N'Phố cổ Hội An 2', 1, 0, CAST(3500000 AS Decimal(18, 0)), N'danang2.jpg', N'danang2.jpg', N'danang2.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
ALTER TABLE [dbo].[PhieuDatTour] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuDatTour] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuDatTour] ([MaPhieu])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuDatTour]
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatTour_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[PhieuDatTour] CHECK CONSTRAINT [FK_PhieuDatTour_NguoiDung]
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatTour_Tour] FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[PhieuDatTour] CHECK CONSTRAINT [FK_PhieuDatTour_Tour]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_LoaiTour] FOREIGN KEY([MaLoaiTour])
REFERENCES [dbo].[LoaiTour] ([MaLoaiTour])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_LoaiTour]
GO
