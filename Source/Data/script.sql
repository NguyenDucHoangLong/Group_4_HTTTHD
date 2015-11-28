USE [master]
GO
/****** Object:  Database [QLWEBSITE]    Script Date: 11/27/2015 7:59:37 AM ******/
CREATE DATABASE [QLWEBSITE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLWEBSITE', FILENAME = N'C:\Program Files(x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLWEBSITE.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLWEBSITE_log', FILENAME = N'C:\Program Files(x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLWEBSITE_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLWEBSITE] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLWEBSITE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLWEBSITE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLWEBSITE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLWEBSITE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLWEBSITE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLWEBSITE] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLWEBSITE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLWEBSITE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLWEBSITE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLWEBSITE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLWEBSITE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLWEBSITE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLWEBSITE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLWEBSITE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLWEBSITE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLWEBSITE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLWEBSITE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLWEBSITE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLWEBSITE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLWEBSITE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLWEBSITE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLWEBSITE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLWEBSITE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLWEBSITE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLWEBSITE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLWEBSITE] SET  MULTI_USER 
GO
ALTER DATABASE [QLWEBSITE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLWEBSITE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLWEBSITE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLWEBSITE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLWEBSITE]
GO
/****** Object:  Table [dbo].[BinhLuan_DanhGia]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan_DanhGia](
	[MaBGDG] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[DanhGia] [int] NULL,
	[NoiDung] [text] NULL,
 CONSTRAINT [PK__BinhLuan__6C2C7045D4A005F3] PRIMARY KEY CLUSTERED 
(
	[MaBGDG] ASC,
	[MaKH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] float NULL,
	[PhiVanChuyen] decimal(18, 0) NULL,
	[DiaChiGiaoHang] [nvarchar](250) NULL,
	[NguoiNhan] [nvarchar](50) NULL,
	[SDT] [nchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTKhuyenMai]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTKhuyenMai](
	[MaKM] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[ChietKhau] [float] NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
 CONSTRAINT [PK__CTKhuyen__F5579F94E8994A9C] PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[MaDanhMucCha] [int] NULL,
 CONSTRAINT [PK__DanhMuc__B37508870C513177] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[TinhTrangThanhToan] [int] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK__DonHang__27258661697F5D67] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](30) NULL,
	[NgSinh] [date] NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[SDT] [nvarchar](12) NULL,
	[LoaiKH] [int] NULL,
	[DiemTichLuy] [int] NULL,
 CONSTRAINT [PK__KhachHan__2725CF1E0B6E7D7D] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiKH]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKH](
	[MaCapBac] [int] IDENTITY(1,1) NOT NULL,
	[TenCapBac] [nvarchar](50) NULL,
	[ChietKhau] [float] NULL,
	[NgayApDung] [date] NULL,
 CONSTRAINT [PK__LoaiKH__219088251CCDD089] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNV]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNV](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[LuongCoBan] [decimal](18, 0) NULL,
	[PhuCap] [float] NULL,
 CONSTRAINT [PK__LoaiNV__730A5759D1BF73BC] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK__LoaiSanP__730A575959E1E42B] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](30) NULL,
	[NgSinh] [date] NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[SDT] [nvarchar](12) NULL,
	[LoaiNV] [int] NULL,
	[Luong] [decimal](18, 0) NULL,
 CONSTRAINT [PK__NhanVien__2725D70A894E534E] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[LoaiSP] [int] NULL,
	[TenSP] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[DanhMuc] [int] NULL,
	[SLTon] [int] NULL,
	[NhaSanXuat] [nvarchar](50) NULL,
	[NgayCapNhat] [date] NULL,
	[MoTa] [text] NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK__SanPham__2725081C82F8A366] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/27/2015 7:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[Quyen] [nvarchar](50) NULL,
 CONSTRAINT [PK__TaiKhoan__3214EC2711165786] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BinhLuan_DanhGia]  WITH CHECK ADD  CONSTRAINT [FK__BinhLuan_D__MaKH__2A4B4B5E] FOREIGN KEY([MaKH])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan_DanhGia] CHECK CONSTRAINT [FK__BinhLuan_D__MaKH__2A4B4B5E]
GO
ALTER TABLE [dbo].[BinhLuan_DanhGia]  WITH CHECK ADD  CONSTRAINT [FK__BinhLuan_D__MaSP__2B3F6F97] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan_DanhGia] CHECK CONSTRAINT [FK__BinhLuan_D__MaSP__2B3F6F97]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK__CTDonHang__MaDH__2D27B809] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK__CTDonHang__MaDH__2D27B809]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK__CTDonHang__MaSP__2E1BDC42] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK__CTDonHang__MaSP__2E1BDC42]
GO
ALTER TABLE [dbo].[CTKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK__CTKhuyenMa__MaSP__25869641] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTKhuyenMai] CHECK CONSTRAINT [FK__CTKhuyenMa__MaSP__25869641]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__MaKH__2C3393D0] FOREIGN KEY([MaKH])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__MaKH__2C3393D0]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__MaKH__267ABA7A] FOREIGN KEY([MaKH])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__MaKH__267ABA7A]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__MaKH__276EDEB3] FOREIGN KEY([MaKH])
REFERENCES [dbo].[LoaiKH] ([MaCapBac])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__MaKH__276EDEB3]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK__NhanVien__LoaiNV__29572725] FOREIGN KEY([LoaiNV])
REFERENCES [dbo].[LoaiNV] ([MaLoai])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__LoaiNV__29572725]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK__NhanVien__MaNV__286302EC] FOREIGN KEY([MaNV])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaNV__286302EC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__DanhMuc__300424B4] FOREIGN KEY([DanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__DanhMuc__300424B4]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__LoaiSP__2F10007B] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__LoaiSP__2F10007B]
GO
USE [master]
GO
ALTER DATABASE [QLWEBSITE] SET  READ_WRITE 
GO
