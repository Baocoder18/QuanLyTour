USE [master]
GO
/****** Object:  Database [QuanLyTour]    Script Date: 4/13/2025 12:28:44 AM ******/
CREATE DATABASE [QuanLyTour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTour', FILENAME = N'E:\ProgramFile\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyTour.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyTour_log', FILENAME = N'E:\ProgramFile\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyTour_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyTour] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTour] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTour] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTour] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTour] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTour] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyTour] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTour] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyTour] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyTour] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyTour] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyTour] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyTour]
GO
/****** Object:  Table [dbo].[ChuyenBay]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenBay](
	[IdChuyenBay] [int] IDENTITY(1,1) NOT NULL,
	[IdHangHangKhong] [int] NOT NULL,
	[MaChuyenBay] [nvarchar](50) NOT NULL,
	[DiemDi] [nvarchar](255) NOT NULL,
	[DiemDen] [nvarchar](255) NOT NULL,
	[GioKhoiHanh] [datetime] NOT NULL,
	[GioHaCanh] [datetime] NOT NULL,
	[ThoiGianBay]  AS (datediff(minute,[GioKhoiHanh],[GioHaCanh])),
	[CoTheDoiVe] [bit] NULL,
	[CoTheHoanVe] [bit] NULL,
	[PhiDoiVe] [decimal](18, 2) NULL,
	[PhiHoanVe] [decimal](18, 2) NULL,
	[LoaiChuyenBay] [int] NOT NULL,
	[GioKhoiHanhVe] [datetime] NULL,
	[GioHaCanhVe] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdChuyenBay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaChuyenBay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHangKhong]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHangKhong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](255) NOT NULL,
	[LogoUrl] [nvarchar](500) NULL,
	[HanhLyXachTayKg] [int] NULL,
	[HanhLyKyGuiKg] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/13/2025 12:28:44 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonKhachSan]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonKhachSan](
	[MaHoaDonKhachSan] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[TongTien] [decimal](18, 0) NOT NULL,
	[NgayThanhToan] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDonKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoTro]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoTro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[Message] [nvarchar](max) NOT NULL,
	[NgayTao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachSan]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachSan](
	[MaKhachSan] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachSan] [nvarchar](50) NULL,
	[MaloaiKhachSan] [int] NULL,
	[TrangThai] [bit] NULL,
	[SoNgay] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](255) NULL,
	[GiaKhachSan] [decimal](18, 0) NULL,
	[HinhAnh1] [varchar](50) NULL,
	[HinhAnh2] [varchar](50) NULL,
	[HinhAnh3] [varchar](50) NULL,
	[MoTa] [nvarchar](4000) NULL,
	[LichTrinh] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhachSan]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhachSan](
	[MaLoaiKhachSan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiKhachSan] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTour]    Script Date: 4/13/2025 12:28:44 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 4/13/2025 12:28:44 AM ******/
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
	[Email] [nvarchar](255) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatTour]    Script Date: 4/13/2025 12:28:44 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 4/13/2025 12:28:44 AM ******/
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
	[SoNgay] [nvarchar](255) NULL,
	[DiaDiem] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VeMayBay]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VeMayBay](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[IdChuyenBay] [int] NOT NULL,
	[HangVe] [nvarchar](50) NOT NULL,
	[GiaNet] [decimal](18, 2) NOT NULL,
	[ThuePhi] [decimal](18, 2) NOT NULL,
	[TongTien]  AS ([GiaNet]+[ThuePhi]) PERSISTED,
	[HanhLyXachTayKg] [int] NULL,
	[HanhLyKyGuiKg] [int] NULL,
	[TrangThai] [bit] NULL,
	[SoLuongVe] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VeMayBayBooking]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VeMayBayBooking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaVe] [int] NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[HoTenKhachHang] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[NgayDat] [datetime] NULL,
	[SoLuongVe] [int] NOT NULL,
	[GiaTaiThoiDiemDat] [decimal](18, 2) NOT NULL,
	[ThuePhiTaiThoiDiemDat] [decimal](18, 2) NOT NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChuyenBay] ADD  DEFAULT ((1)) FOR [CoTheDoiVe]
GO
ALTER TABLE [dbo].[ChuyenBay] ADD  DEFAULT ((0)) FOR [CoTheHoanVe]
GO
ALTER TABLE [dbo].[ChuyenBay] ADD  DEFAULT ((1)) FOR [LoaiChuyenBay]
GO
ALTER TABLE [dbo].[HangHangKhong] ADD  DEFAULT ((7)) FOR [HanhLyXachTayKg]
GO
ALTER TABLE [dbo].[HangHangKhong] ADD  DEFAULT ((0)) FOR [HanhLyKyGuiKg]
GO
ALTER TABLE [dbo].[HoTro] ADD  DEFAULT (CONVERT([date],getdate())) FOR [NgayTao]
GO
ALTER TABLE [dbo].[KhachSan] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  DEFAULT ('example@example.com') FOR [Email]
GO
ALTER TABLE [dbo].[PhieuDatTour] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[VeMayBay] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[VeMayBay] ADD  DEFAULT ((0)) FOR [SoLuongVe]
GO
ALTER TABLE [dbo].[VeMayBayBooking] ADD  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[VeMayBayBooking] ADD  DEFAULT (N'Chờ xác nhận') FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChuyenBay]  WITH CHECK ADD FOREIGN KEY([IdHangHangKhong])
REFERENCES [dbo].[HangHangKhong] ([Id])
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
ALTER TABLE [dbo].[HoTro]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
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
ALTER TABLE [dbo].[VeMayBay]  WITH CHECK ADD FOREIGN KEY([IdChuyenBay])
REFERENCES [dbo].[ChuyenBay] ([IdChuyenBay])
GO
ALTER TABLE [dbo].[VeMayBayBooking]  WITH CHECK ADD FOREIGN KEY([MaVe])
REFERENCES [dbo].[VeMayBay] ([MaVe])
GO
ALTER TABLE [dbo].[VeMayBayBooking]  WITH CHECK ADD  CONSTRAINT [FK_VeMayBayBooking_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[VeMayBayBooking] CHECK CONSTRAINT [FK_VeMayBayBooking_NguoiDung]
GO
ALTER TABLE [dbo].[ChuyenBay]  WITH CHECK ADD  CONSTRAINT [CK_LoaiChuyenBay] CHECK  (([LoaiChuyenBay]=(2) OR [LoaiChuyenBay]=(1)))
GO
ALTER TABLE [dbo].[ChuyenBay] CHECK CONSTRAINT [CK_LoaiChuyenBay]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetKhachSan]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetKhachSan]
    @maKhachSan INT,
    @maLoai INT
AS
BEGIN
    SELECT p.MaKhachSan, p.TenKhachSan, p.MaLoaiKhachSan, p.TrangThai, p.SoNgay, p.DiaDiem, p.GiaKhachSan, 
           p.HinhAnh1, p.HinhAnh2, p.HinhAnh3, l.TenLoaiKhachSan, p.MoTa, p.LichTrinh
    FROM KhachSan p
    INNER JOIN LoaiKhachSan l ON p.MaLoaiKhachSan = l.MaLoaiKhachSan
    WHERE p.MaKhachSan = @maKhachSan AND p.MaLoaiKhachSan = @maLoai
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateKhachSan]    Script Date: 4/13/2025 12:28:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateKhachSan]
    @maKhachSan INT,
    @tenKhachSan NVARCHAR(255),
    @soNgay NVARCHAR(50),
    @diaDiem NVARCHAR(255),
    @giaKhachSan DECIMAL(18,2),
    @maLoai INT,
    @trangThai BIT,
    @moTa NVARCHAR(MAX),
    @lichTrinh NVARCHAR(MAX),
    @hinhAnh1 NVARCHAR(255) = NULL,
    @hinhAnh2 NVARCHAR(255) = NULL,
    @hinhAnh3 NVARCHAR(255) = NULL
AS
BEGIN
    UPDATE KhachSan
    SET MaLoaiKhachSan = @maLoai,
        TenKhachSan = @tenKhachSan,
        SoNgay = @soNgay,
        DiaDiem = @diaDiem,
        GiaKhachSan = @giaKhachSan,
        TrangThai = @trangThai,
        MoTa = @moTa,
        LichTrinh = @lichTrinh,
        HinhAnh1 = COALESCE(@hinhAnh1, HinhAnh1),
        HinhAnh2 = COALESCE(@hinhAnh2, HinhAnh2),
        HinhAnh3 = COALESCE(@hinhAnh3, HinhAnh3)
    WHERE MaKhachSan = @maKhachSan
END
GO
EXEC sys.sp_addextendedproperty @name=N'admin', @value=N'1234' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiDung', @level2type=N'COLUMN',@level2name=N'TenDangNhap'
GO
USE [master]
GO
ALTER DATABASE [QuanLyTour] SET  READ_WRITE 
GO
