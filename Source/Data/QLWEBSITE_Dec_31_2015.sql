USE [master]
GO
/****** Object:  Database [QLWEBSITE]    Script Date: 1/13/2016 8:06:34 PM ******/
CREATE DATABASE [QLWEBSITE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLWEBSITE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLWEBSITE.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLWEBSITE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLWEBSITE_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [nplinh]    Script Date: 1/13/2016 8:06:34 PM ******/
CREATE USER [nplinh] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[ThongKe]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThongKe](
 @NgayBatDau date,
 @NgayKetThuc date,
 @TinhTrangDonHang int
)
as
begin
	select DH.MaDH, KH.TenKH, DH.NgayLap, DH.NgayGiao, DH.TinhTrangDonHang, DH.TongTien
	from DonHang DH, KhachHang KH
	where  DH.NgayLap between @NgayBatDau and @NgayKetThuc and DH.MaKH = KH.MaKH and DH.TinhTrangDonHang = @TinhTrangDonHang;
end;






GO
/****** Object:  StoredProcedure [dbo].[ThongKe_TiLeDonHang]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThongKe_TiLeDonHang](
 @NgayBatDau date,
 @NgayKetThuc date,
 @TinhTrangDonHang int
)
as
begin
	select count(DH.MaDH) as SoDonHang
	from DonHang DH
	where DH.NgayLap between @NgayBatDau and @NgayKetThuc and DH.TinhTrangDonHang = @TinhTrangDonHang;
end;






GO
/****** Object:  Table [dbo].[BaiPost]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiPost](
	[MaPost] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGianPost] [datetime] NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[NguoiPost] [int] NULL,
 CONSTRAINT [PK_BaiPost] PRIMARY KEY CLUSTERED 
(
	[MaPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanBaiPost]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanBaiPost](
	[MaPost] [int] NOT NULL,
	[NguoiBinhLuan] [int] NOT NULL,
	[ThoiGianBinhLuan] [datetime] NOT NULL,
	[NoiDungBinhLuan] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_BinhLuanBaiPost] PRIMARY KEY CLUSTERED 
(
	[MaPost] ASC,
	[NguoiBinhLuan] ASC,
	[ThoiGianBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanDanhGia]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanDanhGia](
	[ThoiGian] [datetime] NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[DanhGia] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK__BinhLuan] PRIMARY KEY CLUSTERED 
(
	[ThoiGian] ASC,
	[MaKH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTKhuyenMai]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTKhuyenMai](
	[MaKM] [int] IDENTITY(1,1) NOT NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[TenCTKM] [nvarchar](50) NULL,
 CONSTRAINT [PK__CTKhuyen] PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[MaDanhMucCha] [int] NULL,
 CONSTRAINT [PK__DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayLap] [date] NULL,
	[NgayGiao] [date] NULL,
	[DiaChiGiao] [nvarchar](30) NULL,
	[TinhTrangDonHang] [int] NULL,
	[DaThanhToan] [bit] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[SDTNguoiNhan] [nvarchar](13) NULL,
 CONSTRAINT [PK__DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaSach]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaSach](
	[MaGiaSach] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_GiaSach] PRIMARY KEY CLUSTERED 
(
	[MaGiaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/13/2016 8:06:34 PM ******/
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
 CONSTRAINT [PK__KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiKH]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKH](
	[MaCapBac] [int] IDENTITY(1,1) NOT NULL,
	[TenCapBac] [nvarchar](50) NULL,
	[ChietKhau] [float] NULL,
	[NgayApDung] [date] NULL,
 CONSTRAINT [PK__LoaiKH] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNV]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNV](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[LuongCoBan] [decimal](18, 0) NULL,
	[PhuCap] [float] NULL,
 CONSTRAINT [PK__LoaiNV] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK__LoaiSanP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 1/13/2016 8:06:34 PM ******/
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
 CONSTRAINT [PK__NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[LoaiSP] [int] NULL,
	[TenSP] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MaDanhMuc] [int] NULL,
	[SLTon] [int] NULL,
	[NhaSanXuat] [nvarchar](50) NULL,
	[NgayCapNhat] [date] NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[TacGia] [nvarchar](50) NULL,
 CONSTRAINT [PK__SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPhamKhuyenMai]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamKhuyenMai](
	[MaKM] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[ChietKhau] [int] NULL,
 CONSTRAINT [PK_SanPhamKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/13/2016 8:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[Quyen] [int] NULL,
	[MaND] [int] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK__TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BaiPost] ON 

INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (1, N'Diễn đàn', N'Chào mừng các bạn đến với diễn đàn của công ty chúng tôi. Nếu có bất kì câu hỏi nào thác mắc về công ty các bạn có thể đăng bài trên diễn đàn này. Chúng tôi sẽ có gắng trả lời nhanh nhất có thể', CAST(N'2015-12-25 00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (2, N'Chương thời gian và ưu đãi năm mới tại YOLO', N'Khuyến mãi lớn nhất của dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (3, N'Test1', N'Khuyến mãi lớn nhất của  dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (4, N'Test2', N'Khuyến mãi lớn nhất của  dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (5, N'Test3', N'Khuyến mãi lớn nhất của Tiki dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (6, N'Test4', N'Khuyến mãi lớn nhất của Tiki dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (7, N'Test5', N'Khuyến mãi lớn nhất của Tiki dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[BaiPost] ([MaPost], [TieuDe], [NoiDung], [ThoiGianPost], [HinhAnh], [TrangThai], [NguoiPost]) VALUES (8, N'Chương thời gian và ưu đãi năm mới tại YOLO', N'Khuyến mãi lớn nhất của Tiki dịp đầu năm 2016 này là chương trình Tiki CES. Đây là tuần lễ giảm giá cực nhiều mặt hàng công nghệ với nhiều ưu đãi, khuyến mãi đến từ cả Tiki và các nhà sản xuất và có mấy mục sau cực kỳ đáng quan tâm:

Xả hàng tồn kho giảm đến 80%: Danh mục này vẫn còn rất nhiều sản phẩm giảm giá
7 Deals độc quyền giá giảm tốt chỉ bán trong 60 phút: Mỗi ngày một sản phẩm giảm giá cực tốt nhưng chỉ bán từ 11-12h trưa
160 Deals Công nghệ được tài trợ từ hãng
Miễn phí toàn bộ chi phí giao hàng toàn quốc với các bạn đặt hàng trong dịp này', CAST(N'2016-08-01 00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[BaiPost] OFF
INSERT [dbo].[BinhLuanBaiPost] ([MaPost], [NguoiBinhLuan], [ThoiGianBinhLuan], [NoiDungBinhLuan], [TrangThai]) VALUES (1, 2, CAST(N'2015-12-10 10:45:30.000' AS DateTime), N'Rất vui vì công ty bạn đã mở 1 diễn đàn thảo thuận cho mọi người', 1)
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 1, 1, CAST(89000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 4, 1, CAST(74000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 5, 1, CAST(14600 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 6, 1, CAST(66000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (2, 5, 1, CAST(14600 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (2, 35, 1, CAST(42000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (3, 14, 1, CAST(298000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (3, 34, 1, CAST(67000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (4, 31, 1, CAST(62000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (5, 31, 1, CAST(62000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (6, 36, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (7, 36, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (8, 36, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, 36, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (10, 35, 1, CAST(42000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (11, 35, 1, CAST(42000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (12, 34, 1, CAST(67000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (13, 36, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (14, 35, 1, CAST(42000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CTKhuyenMai] ON 

INSERT [dbo].[CTKhuyenMai] ([MaKM], [NgayBD], [NgayKT], [TenCTKM]) VALUES (1, CAST(N'2016-01-08' AS Date), CAST(N'2016-01-14' AS Date), N'Giáng sinh')
INSERT [dbo].[CTKhuyenMai] ([MaKM], [NgayBD], [NgayKT], [TenCTKM]) VALUES (2, CAST(N'2015-12-30' AS Date), CAST(N'2016-01-30' AS Date), N'Năm mới')
INSERT [dbo].[CTKhuyenMai] ([MaKM], [NgayBD], [NgayKT], [TenCTKM]) VALUES (3, CAST(N'2015-12-31' AS Date), CAST(N'2016-01-13' AS Date), N'Thành lập yolo')
SET IDENTITY_INSERT [dbo].[CTKhuyenMai] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (1, N'Sách kinh tế', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (2, N'Doanh nhân', 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (3, N'Kỹ năng làm việc', 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (4, N'Bán hàng', 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (5, N'Quản trị lãnh đạo', 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (6, N'Sách kỹ năng', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (7, N'Kỹ năng sống', 6)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (8, N'Nghệ thuật sống', 6)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (9, N'Sách văn học', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (10, N'Kinh dị', 9)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (11, N'Thơ', 9)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (12, N'Kinh điển', 9)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (13, N'Sách đời sống', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (14, N'Sức khỏe', 13)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (15, N'Tâm lý', 13)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (16, N'Gia đình', 13)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (17, N'Dụng cụ học sinh', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (18, N'Bút - Viết', 17)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (19, N'Bảng viết', 17)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (20, N'Tập học sinh', 17)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (21, N'Dụng cụ văn phòng', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (22, N'Bìa hồ sơ', 21)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (23, N'Bút viết', 21)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MaDanhMucCha]) VALUES (24, N'Bảng viết', 21)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (1, 1, CAST(N'2015-12-01' AS Date), CAST(N'2015-12-12' AS Date), N'Nguyễn Văn Cừ, Q5, HCM', 1, 1, CAST(251600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (2, 1, CAST(N'2016-01-06' AS Date), CAST(N'2016-01-15' AS Date), N'Nguyễn Văn Cừ, Q5, HCM', 0, 0, CAST(56600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (3, 1, CAST(N'2016-01-10' AS Date), CAST(N'2016-01-20' AS Date), N'Nguyễn Văn Cừ, Q5, HCM', 1, 1, CAST(365000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (4, 2, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 1, 1, CAST(62000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (5, 2, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 1, 1, CAST(62000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (6, 3, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 1, 1, CAST(98000 AS Decimal(18, 0)), N'0168865387')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (7, 3, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 1, 1, CAST(98000 AS Decimal(18, 0)), N'0168865387')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (8, 3, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', -1, 0, CAST(98000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (9, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 1, 1, CAST(98000 AS Decimal(18, 0)), N'0168865387')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (10, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', -1, 1, CAST(42000 AS Decimal(18, 0)), N'0168865387')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (11, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 0, 1, CAST(42000 AS Decimal(18, 0)), N'32456')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (12, 5, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Hồng bàng', 0, 1, CAST(67000 AS Decimal(18, 0)), N'12342567')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (13, 5, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), N'5 Nguyễn trãi', 0, 1, CAST(98000 AS Decimal(18, 0)), N'0168865387')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayLap], [NgayGiao], [DiaChiGiao], [TinhTrangDonHang], [DaThanhToan], [TongTien], [SDTNguoiNhan]) VALUES (14, 6, CAST(N'2016-01-10' AS Date), CAST(N'2016-01-12' AS Date), N'25 Nguyễn Trãi', 0, 1, CAST(42000 AS Decimal(18, 0)), N'0168865387')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (1, N'Nguyễn Văn An', CAST(N'1992-01-01' AS Date), N'Nam', N'Nguyễn Văn Cừ, Q5, HCM', N'01666123456', NULL, 50)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (2, N'hoanglong', CAST(N'1999-12-29' AS Date), N'Nam', N'5 Nguyễn Trãi', N'01688653287', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (3, N'hoanglong123', NULL, NULL, N'Nguyễn Trãi', N'01688653287', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (4, N'client', CAST(N'1999-11-17' AS Date), N'Nam', N'Nguyễn Trãi', N'12345678', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (5, N'client3', CAST(N'2000-01-01' AS Date), N'Nam', N'Nguyễn Trãi', N'12345678', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (6, N'client2', CAST(N'1999-12-29' AS Date), N'Nam', N'Nguyễn Trãi', N'12345678', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiKH], [DiemTichLuy]) VALUES (7, N'kh', CAST(N'1999-12-30' AS Date), N'Nam', N'Hồng bàng', N'1234', 1, 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiKH] ON 

INSERT [dbo].[LoaiKH] ([MaCapBac], [TenCapBac], [ChietKhau], [NgayApDung]) VALUES (1, N'Bình thường', 0, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[LoaiKH] ([MaCapBac], [TenCapBac], [ChietKhau], [NgayApDung]) VALUES (2, N'Kim cương', 20, CAST(N'2015-12-29' AS Date))
INSERT [dbo].[LoaiKH] ([MaCapBac], [TenCapBac], [ChietKhau], [NgayApDung]) VALUES (3, N'Vàng', 15, CAST(N'2016-01-06' AS Date))
INSERT [dbo].[LoaiKH] ([MaCapBac], [TenCapBac], [ChietKhau], [NgayApDung]) VALUES (4, N'Bạc', 10, CAST(N'2016-01-12' AS Date))
SET IDENTITY_INSERT [dbo].[LoaiKH] OFF
SET IDENTITY_INSERT [dbo].[LoaiNV] ON 

INSERT [dbo].[LoaiNV] ([MaLoai], [LuongCoBan], [PhuCap]) VALUES (1, CAST(20000 AS Decimal(18, 0)), 100)
SET IDENTITY_INSERT [dbo].[LoaiNV] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoaiSP]) VALUES (1, N'Sách')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoaiSP]) VALUES (2, N'DVD')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoaiSP]) VALUES (3, N'Dụng cụ học tập')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiNV]) VALUES (1, N'Admin', CAST(N'1994-12-29' AS Date), N'Nam', N'Nguyễn Trãi', N'01688653287', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgSinh], [GioiTinh], [DiaChi], [SDT], [LoaiNV]) VALUES (2, N'Manager', CAST(N'1994-12-29' AS Date), N'Nam', N'5 Hồng Bàng', N'123456', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (1, N'Chất lượng sản phẩm', N'Chào công ty, vừa rồi tôi có mua sản phẩm X của các bạn. Sau khi nhận sản phẩm tôi thấy chất lượng sản phẩm không như mô tả như trên trang web. Mong công ty cải thiện chất lượng sản phẩm để giống mô tả như trên trang web', N'nplinh234@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (2, N'Dịch vụ giao hàng', N'test', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (3, N'Dịch vụ thanh toán', N'test', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (4, N'Dịch vụ hậu mãi', N'test', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (5, N'Dịch vụ giao hàng', N'kt', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (6, N'Dịch vụ giao hàng', N'kt', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (7, N'Dịch vụ thanh toán', N'ds', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (8, N'Dịch vụ hẫu mãi', N'kt', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (9, N'Chương trình khuyến mãi', N'Hỏi về chương trình khuyến mãi tết', N'yolocustomer@gmail.com', 0)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [ChuDe], [NoiDung], [Email], [TrangThai]) VALUES (10, N'Chương trình khuyến mãi', N'123 kiem tra phan hoi', N'yolocustomer@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (1, 1, N'Mã Vân - Triết Lý Sống Của Tôi', CAST(89000 AS Decimal(18, 0)), 2, 20, N'NXB Lao Động', CAST(N'2016-01-01' AS Date), N'Dáng người gầy gò, tướng mạo xấu xí, kết quả môn Toán bết bát, hai lần thi trượt Đại học nhưng chưa bao giờ bằng lòng với cuộc sống thực tại. Trong một lần tình cờ tiếp xúc với máy vi tính, hiểu về internet, anh kiên quyết bỏ việc làm công ăn lương để bắt đầu gây dựng sự nghiệp, lập nên trang thương mại điện tử đầu tiên của Trung Quốc (China Pages). Dù mù tịt về máy tính nhưng anh lại trở thành một huyền thoại trong ngành thương mại điện tử. Anh được cả thế giới vinh danh và rất có thể sẽ trở thành "Bill Gates Trung Quốc". Một đời vang danh khắp nơi, giữ vị thế độc tôn trong lĩnh vực thương mại điện tử, nhưng đúng vào thời khắc được tung hô và tán thưởng nhiều nhất, anh lại lặng lẽ giấu đi ánh hào quang, tuyên bố nghỉ hưu để hưởng thụ cuộc sống. Người đàn ông hành động không theo lẽ thường ấy chính là Mã Vân. Cuốn sách Mã Vân - Triết lý sống của tôi đã ghi chép hết sức tường tận và chân thực hành trình lập nghiệp của Mã Vân, qua đó giúp chúng ta hiểu rõ trí tuệ, quan niệm về sự thành bại, những điều tâm đắc rút ra trong quá trình lập nghiệp và cả kinh nghiệm quản lý doanh nghiệp hết sức độc đáo của anh. Có lẽ cuốn sách không thể trực tiếp thay đổi cuộc sống và nâng cao hiệu quả công việc của chúng ta, nhưng nó có thể đem tới những gợi mở trên nhiều khía cạnh, giúp chúng ta nhớ lại những ước mơ đã từng ấp ủ, giúp chúng ta vững tin bước tiếp trong cuộc sống đầy chông gai, thử thách. Cùng với cuốn Mã Vân giày vải, đây cũng là một trong những cuốn sách thú vị về một nhân vật kiệt xuất trong giới doanh nhân.', N'1.jpg', N' Trương Yến ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (2, 1, N'Những Điều Trường Harvard Không Dạy Bạn', CAST(67000 AS Decimal(18, 0)), 2, 20, N'NXB Lao Động Xã Hội', CAST(N'2016-01-01' AS Date), N'Với lối viết thẳng thắn và mạnh mẽ, Những Điều Trường Harvard Không Dạy Bạn cung cấp nhiều kinh nghiệm thực tế về:Cách thức thấu hiểu một con người. Những bí ẩn của một cuộc đàm phán. Cách điều hành và tham dự một cuộc họp. Biến sự giận dữ của đối tác thành cơ hội. Đón nhận những thách thức. Nhạy bén để biết vận may. Đây thật sự là cuốn sách dành cho tất cả những ai thực sự muốn  thành công trong giới kinh doanh đầy thách thức.', N'2.jpg', N' Mark H. Mccormack ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (3, 1, N'Sam Walton - Cuộc Đời Kinh Doanh Tại Mỹ', CAST(90000 AS Decimal(18, 0)), 2, 20, N'NXB Lao Động', CAST(N'2016-01-01' AS Date), N'Cuốn sách tự truyện của Sam Walton, xoay quanh việc xây dựng đế chế Wal - Mart hùng mạnh của ông, đã được Giám đốc điều hành nối tiếng của WalMart, Sandra Kurtzig mô tả như một câu chuyện về việc xây dựng nên một công ty trị giá 400 triệu đô từ nền tảng ban đầu, một câu chuyện rất ít phần tự truyện. Thế nhưng, độc giả có thể hài lòng với lối kể chuyện giản dị của một nhà triệu phú tỉnh lẻ, người đã đi đầu trong cuộc cách mạng đổi mới việc phân phối bán lẻ. Trong cuốn sách, Sam Walton cũng kể lại những lời buộc tội đối với ông vì đã tạo ra sức cạnh tranh mạnh mẽ bên ngoài các khu đô thị. Người đồng tác giả của ông, Huey đã hoàn thành xuất sắc vai trò đồng biên soạn của mình khi đưa ra những câu chuyện, bằng chứng không thiên vị từ các thành viên trong gia đình Sam Walton cũng như từ những người cộng tác với ông - những người đã từng có lúc cho rằng các ý tưởng của Sam Walton là ngu ngốc và điên rồ. Đây là một cuốn sách rất bổ ích và đáng đọc đối với công chúng và đối với những người thích sưu tầm sách về kinh doanh. Sam Walton - một người Mỹ thực thụ, giản dị, chất phác, người đã biến quầy bán hàng "Năm xu một hào" ở một thị trấn nhỏ bé và xa xôi trở thành Wal-Mart, tập đoàn bán lẻ lớn nhất thế giới... Cuốn sách này là một trong những câu chuyện hấp dẫn nhất về tinh thần doanh nghiệp, về sự mạo hiểm, về sự chăm chỉ và về cách mà mỗi người có thể đạt được mục đích của mình. Đó cũng là câu chuyện về niềm tin vào lý tưởng ngay cả khi những người khác không đồng tình và cản trở. Sam Walton đã lôi cuốn được tình cảm của người đọc bằng ngôn ngữ của riêng ông... Đây quả là bức chân dung về một thầy phù thủy kinh doanh tốt bụng, một người không bị sự giàu sang hủy hoại...', N'3.jpg', N' Sam Walton ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (4, 1, N'Tăng Tốc Đến Thành Công', CAST(74000 AS Decimal(18, 0)), 2, 20, N'NXB Khoa học xã hội', CAST(N'2016-01-01' AS Date), N'Bạn thấy choáng ngợp với núi kiến thức khổng lồ và băn khoăn mình phải bắt đầu từ đâu? Bạn luôn muốn mang theo những bí quyết tuyệt vời của những người thành công chỉ trong 1 quyển sổ tay? Dù bạn là doanh nhân thành đạt, một người trẻ nhiệt huyết khởi nghiệp, một sinh viên đang ước mơ kinh doanh và cả bạn đang là nhân viên ở bất cứ công ty nào, chỉ cần bạn đang có những băn khoăn trên thì chính lúc này đây, giải pháp đã xuất hiện với bạn. Sẽ có gì ở Tăng tốc đến thành công? Quyển sách sẽ đưa bạn đến kho tàng bài học quý giá của 25 đầu sách kinh doanh đắt giá nhất thế giới. Những bài học kinh doanh cốt lõi, có giá trị được tóm tắt một cách sinh động, rõ ràng và thông minh trong cuốn sách công phu và lôi cuốn này. Tác giả Lâm Minh Chánh muốn đưa trọn vẹn những ý tưởng cốt lõi của các cuốn sách kinh doanh hàng đầu thế giới đến với độc giả, giúp độc giả đọc nhanh những bài học quý giá và Tăng tốc đến thành công. Cuốn sách là kết tinh những kinh nghiệm thực tế được học tập trên nền tảng những cuốn sách kinh doanh hàng đầu để đem đến bài học ứng dụng mang tính quy luật và thực tiễn cho bất kì ai dù là nhà kinh doanh lâu năm, một người trẻ đang trên con đường khởi nghiệp...hay những ai mong muốn tìm hiểu, nắm bắt những quy luật của thế giới đương đại trong quỹ thời gian eo hẹp của mình. "Tôi viết bộ sách Tăng Tốc Đến Thành Công - Học từ những cuốn sách kinh doanh hàng đầu với mục đích giới thiệu những ý tưởng cốt lõi, những bài học hay từ các cuốn sách kinh doanh hàng đầu. Nếu quá bận để đọc trọn vẹn từng cuốn thì với bộ sách này, độc giả cũng có thể nắm bắt được những ý tưởng chính của chúng..."', N'4.jpg', N' Lâm Minh Chánh ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (5, 1, N'Hòn Tuyết Lăn', CAST(14600 AS Decimal(18, 0)), 2, 20, N'NXB Trẻ', CAST(N'2016-01-01' AS Date), N'Giờ đây, cái tên Warren Buffett không còn mấy xa lạ với mọi người ở khắp các châu lục, bởi vì con người này có một tầm ảnh hưởng vô cùng rộng lớn và luôn có mặt trong danh sách những người giàu nhất thế giới suốt hai thập kỷ vừa qua. Song, ít ai biết rằng, vị tỷ phú 80 tuổi đáng kính ấy, "nhà hiền triết vùng Omaha" của Hoa Kỳ thuở thiếu thời lại là một cậu học sinh thường bị điểm kém, từng bỏ nhà đi hoang, nhiều lần tham gia đánh cắp những món đồ thể thao từ cửa hiệu Sears, điều hành một lộ trình giao báo năm 13 tuổi, mua một trang trại 40 mẫu Anh vào năm học lớp 10, bị trường Harvard từ chối, có một cuộc tình "đầy sóng gió" với Hoa hậu Nebraska 1949 Vanita Mae Brown. Ông từng là một "tín đồ" trung thành có thâm niên hàng chục năm của Pepsi trước khi chuyển sang uống Cherry Coke của Coca-cola từ năm 1987, kết thân và xem vợ chồng tỷ phú số 1 thế giới 2009 Bill Gates và Melinda Gates gần như con ruột nhưng không bao giờ đầu tư một đồng vào "đế chế" Microsoft hùng mạnh. Ngoài ra, còn phải kể đến vô số những thương vụ đầy táo bạo mang đến cho ông những thành công tột bậc (và một vài thất bại "nho nhỏ") dọc theo chiều dài sự nghiệp... Tất cả sẽ được hé mở trong Hòn Tuyết Lăn, quyển tự truyện về cuộc đời và sự nghiệp của Warren Buffett do Alice Shroeder chấp bút theo đề nghị của chính ông', N'5.jpg', N'Alice Schroeder ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (6, 1, N'Hãy Cứ Khát Khao - Hãy Mãi Dại Khờ', CAST(66000 AS Decimal(18, 0)), 2, 20, N'NXB Tổng hợp TP.HCM', CAST(N'2016-01-01' AS Date), N'Hãy Cứ Khát Khao - Hãy Mãi Dại Khờ tập hợp câu chuyện về 20 sinh viên tốt nghiệp Học viện Quản lý Ấn Độ, phân viện Ahmedabad. Họ là doanh nhân sống vào những giai đoạn khác nhau, kinh doanh trong những ngành, những lĩnh vực khác nhau, có quan điểm khác nhau về cuộc sống, về kinh doanh,… Nhưng họ cùng có chung một điểm: Niềm tin vào sức mạnh của những ước mơ. Họ là những người đã lựa chọn bước đi trên con đường của riêng mình. Và Hãy Cứ Khát Khao - Hãy Mãi Dại Khờ cũng chính là phương châm sống mà 20 doanh nhân trẻ và thành đạt được nhắc đến trong cuốn sách này theo đuổi. Bạn đọc sẽ bắt gặp trong cuốn sách này rất nhiều tấm gương thành đạt, như: Ruby Ashraf - giám đốc điều hành của Precious Formals, một công ty có giá 10 triệu đô trong ngành kinh doanh thời trang; Sanjeev Bikhchandani - nhà kinh doanh trong lĩnh vực thương mại trực tuyến thành công nhất tại Ấn Độ; Vinayak Chatterjee - Giám đốc Công ty Feedback Ventures - công ty tư vấn cơ sở hạ tầng và kỹ thuật hàng đầu Ấn Độ; Madan Mohanka - Giám đốc công tyTega Industries là công ty lớn thứ ba thế giới về thiết kế giải pháp trong lĩnh vực thiết bị khai thác khoáng sản… Tác giả Rashmi Bansal chia sẻ: "Tôi viết cuốn sách này để dành tặng cho những ai đang trằn trọc về những "Giá như…", hay "Một ngày nào đó…". Tôi mong giúp họ nắm bắt được cơ hội, để họ không phải thức dậy mỗi ngày với những nuối tiếc. Đương nhiên, họ cần có khả năng nhìn thấy tiềm năng thị trường, cơ hội cũng như những nhu cầu chưa được đáp ứng. Nhưng quan trọng hơn hết, họ có thể đứng trước tấm gương và nhìn thấy giá trị đích thực của bản thân". Với mong muốn đó, trong bài viết của mình, tác giả Rashmi Bansal đã khắc họa một cách tỉ mỉ, từ hoàn cảnh gia đình, sự cố gắng không ngừng cho đến nỗ lực vượt qua những khó khăn, thất bại mà 20 doanh nhân trẻ đã vượt qua. Từ hai bàn tay trắng, với vốn kinh nghiệm, sự hiểu biết và niềm đam mê kinh doanh, họ đã xây dựng nên những công ty, thậm chí là những tập đoàn có tiếng tại Ấn Độ và trên thế giới. Các câu chuyện có thể rất khác nhau nhưng ở một khía cạnh nào đó chúng đều có những nét tương đồng: Những doanh nhân này giành lấy cơ hội cho những điều họ tin tưởng; để rồi đấu tranh và nỗ lực trong nhiều năm sau đó, trước khi kết quả từ những cố gắng ấy đạt đến kích thước và quy mô mà chúng ta gọi là thành công. Trong mỗi câu chuyện như thế, có những người giờ vẫn đang tiếp tục đấu tranh và nỗ lực. Cuốn sách này sẽ mang tới cho họ niềm hy vọng và sức sống mới. Đặc biệt, sau mỗi bài viết, tác giả Rashmi Bansal đều rút ra những lời khuyên thiết thực và hữu ích dành cho các doanh nhân trẻ trên cơ sở những kinh nghiệm từ các doanh nhân mà mình đã tiếp xúc. Cuốn sách này giúp truyền cảm hứng cho những sinh viên trẻ mới ra trường, để các bạn có thể nhìn xa hơn cho tương lai của mình, khiến bản thân vượt thoát ra khỏi những rào cản về mong muốn khoản lương hay ước mơ công việc, để định vị giấc mơ của mình.', N'6.jpg', N' Rashmi Bansal ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (7, 1, N'Chuyện Những Người Dẫn Đầu', CAST(11000 AS Decimal(18, 0)), 2, 20, N'NXB Thông Tin & Truyền Thông', CAST(N'2016-01-01' AS Date), N'“Là Người Việt hãy học làm giàu từ những người Việt thành công”. Một loạt bài viết với những chia sẻ thực tế của 30 nhân vật thành công họ là các ÔNG CHỦ như: Bầu ĐỨC , Bầu Thắng, Lê Phước Vũ ( Tôn Hoa Sen), Johnathan Hạnh Nguyễn (Chủ tịch Tập đoàn Liên Thái Bình Dương (IPP) ) Nguyễn Đình Trung, Trần Thanh Hải - NutiFood, Đặng Phước Thành Và Chiến Lược Xưng Vương Của Vinasun... Những con người đã chứng minh bản lĩnh thật sự của mình trong lĩnh vực kinh doanh, “dám nghĩ dám làm và dám thành công”. Những bài viết  của cuốn sách như một tấm gương rõ nét nhất về con đường trở thành  Ông Chủ của họ. Không ai giống ai, mỗi người một lĩnh vực Họ chỉ giống nhau ở điểm chung nhất. Đó là họ là những người Việt  “THÀNH CÔNG” và là ÔNG CHỦ. Đọc cuốn sách ÔNG CHỦ VIỆT - CHUYỆN NHỮNG NGƯỜI DẪN ĐẦU của nhà báo NGUYỄN HÙNG - BẠN sẽ thấy được những giá trị cốt lõi mà những ÔNG CHỦ việt thực thụ chia sẻ - BẠN sẽ tự rút ra cho mình những bài học quý giá nhất về con đường làm giàu của chính bản thân, con đường mà bấy lâu nay bạn đang đốt đuốc dò tìm. Hãy học cách LÀM GIÀU của những ÔNG CHỦ VIỆT đích thực. Cuốn sách là kim chỉ nam cho những ai luôn có KHÁT KHAO và MONG MUỐN vươn lên “Làm Giàu”. Hơn 5 năm làm việc tại Nhịp Cầu Đầu Tư, tờ báo kinh doanh hàng đầu của Việt Nam, người viết tác giả nhà báo Nguyễn Hùng có được may mắn gặp được một số ít những ông chủ như vậy. Mỗi người mỗi ngành, mỗi nghề khác nhau. Họ cũng từng vấp phải sai lầm và phải trả giá, nhưng với sự kiên định, sự tìm tòi đột phá, sáng tạo đã giúp các nhà lãnh đạo doanh nghiệp tiếp tục đi lên. Những cuộc trò chuyện của người viết cùng các ông chủ này đã lý giải cho câu hỏi: vì sao họ có thể tồn tại và vươn lên vị trí dẫn đầu? Nhận định: "Mỗi bài viết dường như là một lát cắt quan trọng trong sự nghiệp của các CEO danh tiếng Việt Nam. Nguyễn Hùng là một đồng nghiệp có tâm với nghề, và có nhiều sự tận tụy trong tìm kiếm, cũng như học hỏi những mô hình kinh doanh khác nhau của các ông chủ Việt. Các bài viết không chỉ ghi nhận những con số ấn tượng trong hoạt động kinh doanh, Nguyễn Hùng còn nắm bắt khai thác giá trị nhân bản trong từng cá nhân nhà lãnh đạo. Người ta có thể thấy các tác phẩm của anh như một sự chân phương về mô tả, nhưng cũng không kém phần logic và mạch lạc trong nhận thức kinh doanh. Tác phẩm có thể được xem là một kim chỉ nam giá trị và tạo nên động lực mạnh mẽ cho thế hệ kinh doanh tiếp nối của Việt Nam."', N'7.jpg', N'Nhà báo Nguyễn Hùng ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (8, 1, N'Nhà báo Nguyễn Hùng ', CAST(68000 AS Decimal(18, 0)), 2, 20, N'NXB Phụ Nữ', CAST(N'2016-01-01' AS Date), N'Đứa Con Lưu Lạc Của Singapore là một hồi ức đầy kinh ngạc với những tình tiết khó quên, được kể bằng giọng văn súc tích, lôi cuốn. Đây là một câu chuyện ấn tượng về lòng can đảm và kiên trì. Quyển sách này, tất nhiên, đáng đọc với bất cứ ai mong muốn thành công trong cuộc sống. Đây cũng là lời nhắc nhở cho những ai nản lòng thoái chí, đó là đừng đánh mất hy vọng mà hãy nghĩ ra những chiến lược có thể vực mình dậy. Nhận định: "Nửa hồi ký, nửa kể chuyện, quyển sách này bàn về tầm quan trọng của khả năng tự lập và quyết tâm cao độ, cũng như lòng trắc ẩn và tình bạn. Trên hết, quyển sách này có ý nói rằng ‘không gì là không thể’ khi ta có một mục tiêu dài hạn và kiên trì theo đuổi nó."', N'8.jpg', N'Kaiwen Leong ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (9, 2, N'Bút Viết Bảng Artline EK - 5109A', CAST(54000 AS Decimal(18, 0)), 18, 23, N'Nhật Bản', CAST(N'2016-01-01' AS Date), N'Bút Viết Bảng Artline EK - 5109A gồm 4 màu sắc khác nhau: đen, đỏ, xanh dương, xanh lục tạo điều kiện cho bạn linh hoạt sử dụng trong từng trường hợp. Đây là sản phẩm uy tín của thương hiệu Artline giúp bạn an tâm hơn về chất lượng sản phẩm. Thiết kế tiện lợi. Mực đậm, lượng mực cực kỳ nhiều, thêm mực dễ dàng sau khi viết hết giúp bạn chủ động hơn khi sử dụng, không làm trầy xước bề mặt bảng. Ngòi bút cực lớn đến 10mm dùng cho hội trường và giảng đường lớn. Màu sắc đa dạng cho phép trình bày bài giảng được sinh động. Chất liệu an toàn. Chất liệu mực an toàn và không độc hại, giúp bạn cảm thấy luôn dễ chịu khi sử dụng sản phẩm. Sản phẩm hoàn toàn không chứa Xylene hay các chất gây nguy hiểm đến sức khỏe. Dễ viết, dễ xóa. Bút dễ cầm nắm, hơn thế nữa phần ngòi đầu nét mang lại cảm giác êm khi viết. Dễ dàng tẩy xóa khi cần thiết, vô cùng hiệu quả và tiện lợi.', N'9.jpg', N'Artline')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (10, 2, N'Bút Viết Bảng Artline EK - 517', CAST(27000 AS Decimal(18, 0)), 18, 20, N'Nhật Bản', CAST(N'2016-01-01' AS Date), N'Bút Viết Bảng Artline EK - 517 là loại bút chuyên dùng trong phòng lạnh có màu sắc phong phú, viết được trên bảng trắng, thủy tinh, gốm, sứ, cho nét viết êm và dễ dàng xóa. Đây là sản phẩm dành cho tất cả mọi người, đặc biệt giới văn phòng và các giáo viên. Nhanh tay để sở hữu ngay sản phẩm này cho mình nhé mọi người. Thiết kế đơn giản, tiện ích. Kiểu dáng nhỏ gọn, đơn giản, vừa tay cầm, tay cầm không trơn, tiện cho việc sử dụng. Thích hợp cho việc sử dụng trong thời gian dài mà không cần đậy nắp, mở nắp đến 2 ngày mà vẫn không khô mực. Chất liệu mực an toàn. Mực dạng hạt phân tán, có nhiều màu. Bút khi viết không có mùi khó chịu. Mực không chứa chất độc hại nên an toàn với sức khỏe người tiêu dùng. Màu sắc đa dạng. Nét bút đậm, dễ xóa không làm trầy xước bề mặt bảng. Bút với nhiều màu mực đa dạng khác nhau để bạn linh hoạt sử dụng. Thông tin sản phẩm: Ngòi bút: 2.0 mm. Màu sắc: đen, xanh dương, xanh lục, đỏ, nâu, tím, hồng, cam.', N'10.jpg', N'Artline')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (11, 2, N'Bút Lông Kim Signo Broad ', CAST(42000 AS Decimal(18, 0)), 18, 20, N'Nhật Bản', CAST(N'2016-01-01' AS Date), N'- Đầu bút: INOX chổng rỉ. Đầu bi: Hợp kim cacbua tungsten 1.0mm giúp mực ra đều và nhanh khi viết. Màu mực: Có 3 màu lựa chọn Xanh dương, đen, đỏ. Mực mau khô rất tiện lợi đối với những bạn thuận viết bằng tay trái.', N'11.jpg', N'Uni Mitsubishi Pencil')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (12, 2, N'Bảng Từ Viết Bút Lông Bavico BLT06 Trắng', CAST(900000 AS Decimal(18, 0)), 19, 20, N'	Việt Nam', CAST(N'2016-01-01' AS Date), N'Bảng từ viết bút lông Bavico BLT06 trắng - 1.2 x 1.2 m có thể sử dụng cho nhiều mục đích khác nhau: dụng cụ học tập cho học sinh, công cụ giảng dạy tại nhà trường, sử dụng cho các phòng họp tại các công ty, hoặc dùng cho nhu cầu ghi chép cá nhân và gia đình. Bảng từ được lót bằng ván MDF có tính chịu lực tốt, độ bền tối ưu, giúp bảng không bị cong vênh, không bị rung khi viết. Mặt sau của bảng được ép giấy bóng vân gỗ chống ẩm, mang lại giá trị sử dụng lâu bền cho sản phẩm. Đặc biệt, bảng cho phép dùng nam châm đính hình ảnh minh họa, hoặc đính giấy note lên bảng rất tiện dụng.', N'12.jpg', N'Bavico')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (13, 2, N'Bảng Di Động 02 Mặt Viết Bút Lông Bavico BDH02 Trắng', CAST(70000 AS Decimal(18, 0)), 19, 20, N'	Việt Nam', CAST(N'2016-01-01' AS Date), N'Bảng Di Động 02 Mặt Viết Bút Lông Bavico BDH02 Trắng – 1.2 x 2.0 m với kích thước bảng lớn, viết được nhiều nội dung cùng lúc, giúp cho công việc của bạn được liên tục không bị gián đoạn. Điều đặc biệt nhất mà bảng đi động BDH02 mang lại là bạn có thể viết ở cả 2 mặt bảng rất tiện lợi, giúp bạn tiết kiệm được rất nhiều thời gian và không gian sử dụng. Bảng được làm từ những chất liệu cao cấp, nhập khẩu từ Ấn Độ, giúp viết chữ êm, không bị lem mực, dễ lau sạch mà không để lại dấu. Chân bảng được làm bằng sắt chắc chắn, trang bị thêm 4 bánh xe giúp di chuyển dễ dàng. Đặc biệt, chân bảng có thể điều chỉnh độ cao lên xuống, cho phép bạn tùy chỉnh độ cao phù hợp với yêu cầu sử dụng.', N'13.jpg', N'Bavico')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (14, 2, N'Bảng Viết Bút Lông Bavico BL02 Trắng', CAST(298000 AS Decimal(18, 0)), 19, 20, N'	Việt Nam', CAST(N'2016-01-01' AS Date), N'Bảng viết bút lông Bavico BL02 Trắng – 0.6 x 0.8 m được thiết kế với chất liệu cao cấp, cùng mặt bảng màu trắng có kẻ ô ly, giúp cho chữ viết từ bút lông được rõ ràng, không lem mực và dễ dàng lau sạch không để lại dấu. Bảng viết được thiết kế với 4 cạnh bằng khung nhôm chắc chắn và đẹp mắt. Ngoài ra, 4 góc của bảng được trang bị co nhựa chống trầy xước, an toàn cho người sử dụng.', N'14.jpg', N'Bavico')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (15, 2, N'Tập Học Sinh Tiki Lan Tỏa Niềm Vui 96 Trang', CAST(630000 AS Decimal(18, 0)), 20, 20, N'Việt Nam', CAST(N'2016-01-01' AS Date), N'Tập Học Sinh Tiki Lan Tỏa Niềm Vui (Lốc 10 cuốn) được làm từ loại giấy Ford cao cấp với độ trắng đạt 92% ISO, định lượng : 80g/m2, ăn mực tốt với hầu hết các loại bút. Tập học sinh 4 ô ly ngang, to, rõ ràng giúp các em viết chữ dễ dàng hơn.', N'15.jpg', N'tiki')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (16, 2, N'Tập Học Sinh Cổ Tích 96 Trang', CAST(23000 AS Decimal(18, 0)), 20, 20, N'Việt Nam', CAST(N'2016-01-01' AS Date), N'Tập được thiết kế đẹp mắt với ý tưởng chủ đạo từ những câu chuyện cổ tích Việt Nam nổi tiếng như: Công và Quạ, Sự tích Dưa Hấu, Ăn Khế Trả Vàng... với nhiều mẫu bìa hình ảnh sinh động, dễ thương. Chất liệu giấy trắng đẹp và mịn, giấy có độ trắng tự nhiên, không lóa mắt khi viết, giấy viết không lem. Bìa tập dày, chắc chắn cho hiệu quả bảo quản bền lâu. Tập Học Sinh Cổ Tích 96 Trang - 4 Ô Ly (Lốc 10 Cuốn) là sự lựa chọn thú vị của bạn.', N'16.jpg', N'HƯƠNG KIẾN THÀNH - KTBOOK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (17, 2, N'Bé Tập Viết - Dành Cho Học Sinh Mẫu Giáo Lớn', CAST(11000 AS Decimal(18, 0)), 20, 20, N'NXB Đại Học Sư Phạm', CAST(N'2016-01-01' AS Date), N'Giúp các bé chuẩn bị vào lớp 1 làm quen với chương trình học tiểu học. Nội dung gần gũi với chương trình giáo khoa và hình minh họa sinh động, bộ sách sẽ giúp các bậc cha mẹ rèn luyện cho con trẻ những nét chữ đầu tiên một cách hiệu quả. Để chuẩn bị vào lớp một, các em cần làm quen và sử dụng thành thục với các chữ cái, các con số từ 1 đến 10, và bước đầu biết viết và ghép vần những chữ cơ bản.', N'17.jpg', N'Minh Long')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (18, 1, N'You Can Win - Bí Quyết Của Người Chiến Thắng', CAST(59000 AS Decimal(18, 0)), 3, 20, N'	NXB Tổng hợp TP.HCM', CAST(N'2016-01-01' AS Date), N'Với cách đặt vấn đề dễ hiểu, thiết thực và sâu sắc, Bí quyết của người chiến thắng sẽ giúp bạn tránh rơi vào cảm giác mất phương hướng, biết xác định mục tiêu và những giá trị cần ưu tiên trong cuộc sống. Có thể xem cuốn sách này như một quyển sổ tay liệt kê những công cụ cần thiết để kiến tao thành công và giúp bạn tạo lập một cuộc sống tốt đẹp. Cũng có thể xem nó như một cuốn cảm nang dạy nấu ăn, bao gồm những chỉ dần về nguyên liệu, công thức và cách pha trộn theo tỉ lệ thích hợp để có được thành công. Nhưng trên hết, đây là cuốn sách từng bước dẫn dặt bạn đi từ mơ ước, khát vọng thành công đến khám phá năng lực của bản thân và biến ước mơ thành hiện thực.   Bí quyết sẽ giúp bạn xây dựng mục tiêu mới, hình thành ý niệm mới về mục đích sống, phát triển tư tưởng mới về bản thân và tương lai. Một trong những mục đích của cuốn sách là giúp bạn đề ra kế hoạch hành động cho tương lai. Nếu chưa bao giờ làm vậy, bạn hãy xác định xem: Bạn muốn đạt được điều gì? Bạn muốn đạt được mục tiêu bằng cách nào? Thời điểm bạn muốn đạt được mục tiêu là khi nào? Những nguyên tắc trình bày trong cuốn sách đều mang tính phổ quát, áp dụng cho mọi tình huống, tổ chức hoặc quốc gia. Hy vọng cuốn sách sẽ mang lại cho bạn nhiều điều mới mẻ và những khám phá thú vị.', N'18.jpg', N'	First News - Trí Việt')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (19, 1, N'Cách Mạng Ý Tưởng', CAST(66000 AS Decimal(18, 0)), 3, 20, N'NXB Lao Động', CAST(N'2016-01-01' AS Date), N'Một số người nhìn sự việc như chúng vốn có và hỏi “Tại sao?” Tôi lại nghĩ về những việc chưa bao giờ xảy ra và tự hỏi “Tại sao không? ( trích lời George Bernard Shaw). Bạn có muốn chế tạo ra một cái bẫy chuột tốt hơn không? Hay làm thế nào để trả nợ thế chấp dễ dàng hơn? Làm thế nào để giảm số vụ tai nạn do trẻ vị thành niên gây ra? Làm thế nào ngăn chặn thư rác trên Internet? Nhiều người cho rằng những vấn đề trên chỉ dành cho các chuyên gia mà thôi. Còn Barry Nalebuff và Ian Ayres thì lại chứng minh rằng chúng ta ai cũng tràn đầy năng lực sáng tạo. Cuốn sách hấp dẫn này đã chuyển hoá được gợi ý của Robert F.Kennedy thành những ý tưởng có thể thay đổi mọi cách nghĩ, cách làm việc của thế giới hiện nay. Được coi như một cái "túi gấm" cho các doanh nhân với đầy mưu lược kỳ diệu để giải quyết những vấn đề nan giải nhất. Bạn sẽ tìm thấy lời giải đáp đơn giản, hiệu quả đến đáng kinh ngạc cho rất nhiều vấn đề thường ngày trên mọi lĩnh vực của đời sống ngay trong cuốn sách mang cái tên đầy khiêu khích này. Mà quả thực, sao chỉ có rất ít người biết hỏi "Tại sao không?" nhỉ! Nhận định “Trong một thời đại mà cầu về sáng kiến và tính sáng tạo thì cao còn cung thì thấp, "Why not?" mang đến cho chúng ta một phương pháp tiếp cận độc đáo và mới mẻ để thúc đẩy đầu óc sáng tạo thông qua những cách nhìn nhận các vấn đề hàng ngày thật tài tình, từ đó phát hiện ra những giải pháp độc đáo. Đây là một cuốn sách ‘phải đọc’ cho tất cả những ai muốn xây dựng một doanh nghiệp - hoặc đơn giản là làm mọi thứ trở nên tốt đẹp hơn”. (BILL GEORGE, cựu Chủ tịch và Giám đốc điều hành, Medtronic, Inc) “Cuốn sách đầy cảm hứng này là tài liệu cần phải đọc của bất kỳ ai muốn xây dựng lại doanh nghiệp hay chính phủ”. (JOSEPH STIGLITZ, nhà kinh tế học đoạt giải Nobel và tác giả của Globalization and Its Discontents)', N'19.jpg', N'Bách Việt')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (20, 1, N'Không Bao Giờ Là Thất Bại', CAST(54000 AS Decimal(18, 0)), 3, 20, N'NXB Tổng hợp TP.HCM', CAST(N'2016-01-01' AS Date), N'Người viết cuốn tự truyện độc đáo này là một con người kiên định, với ý chí tự lập của mình dám đương đầu với mọi thử thách, trở ngại trong cuộc đời, dám nghĩ dám làm, dám ước mơ và dám vượt qua những khó khăn thử thách để thực hiện những ước mơ và dự định tưởng chừng không thể của mình. Đây là một minh chứng sống về ý chí và năng lực không giới hạn của con người khi đã có lòng nhiệt huyết, say mê - một người đã xem những thất bại - cho dù là thất bại cay đắng nhất - không phải là thất bại - mà chỉ là thử thách của cuộc sống tôi rèn bản lĩnh của chính mình. Tác giả và nhân vật trong cuốn tự truyện này là một người Hàn Quốc nổi tiếng: Chung Ju Yung - người đã sáng lập và là cố chủ tịch của tập đoàn Huyndai. Qua từng trang sách chúng ta sẽ cùng khám phá cuộc đời thăng trầm rất thực và tính cách thú vị của cậu thanh niên vùng nông thôn với ước mơ lớn từ hai bàn tay trắng đã trở thành một trong những doanh nhân nổi tiếng nhất trong lịch sử các tập đoàn công nghiệp hàng đầu Hàn Quốc và châu Á. "Một người không tin là có vận xấu, người đó sẽ không có vận xấu. Mọi thứ đều quân bình, vận may rủi đều đến với con người như nhau.Quan trọng nhất là phải nỗ lực, nỗ lực không ngừng và biết chớp thời cơ. "Với triết lý đó, Chung Ju Yung tin rằng thất bại hay không tùy thuộc vào định nghĩa của mỗi người. Nếu bạn định nghĩa mỗi lần vấp ngã là một lần thất bại thì đó thực sự là thất bại, nếu bạn định nghĩa một lần vấp ngã đơn giản chỉ là thêm một thử thách thì bạn mãi mãi là người bất khả chiến bại, tất cả đều do bạn lựa chọn. Câu chuyện về cuộc đời của Chung Ju Yung cùng "triết lý con rệp" của ông là nguồn cảm hứng cho rất nhiều doanh nhân trẻ khởi nghiệp, trong đó có Đặng Lê Nguyên Vũ - người khai sinh ra thương hiệu cà phê Trung Nguyên nổi tiếng ngày nay. Đây sẽ là cuốn sách kinh doanh không thể thiếu của bạn.', N'20.jpg', N'First News - Trí Việt')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (21, 1, N'Bảy Cấp Độ Để Giao Tiếp Thành Công', CAST(74000 AS Decimal(18, 0)), 3, 20, N'	NXB Thế Giới', CAST(N'2016-01-01' AS Date), N'“Bảy cấp độ giao tiếp của Michael Maher là cuốn sách mà những người làm kinh doanh bất động sản chuyên nghiệp không nên bỏ qua. Cuốn sách sẽ giúp bạn đạt được sự thành công trong lĩnh vực kinh doanh bất động sản mà không cần bất cứ dịch vụ quảng cáo hay truyền thông nào, cách đơn giản mà bạn cần làm với cuốn sách này đó là giao tiếp, giới thiệu, gửi email…” (Danielle Kennedy, nhà đào tạo kỹ năng kinh doanh bất động sản, tác giả của cuốn sách “Làm thế nào để niêm yết và bán bất động sản - chinh phục mọi nẻo đường của thị trường”) "Khả năng xây dựng các mối quan hệ là xương sống của một doanh nghiệp thành công. Các cuộc gọi điện, những cái bắt tay, những buổi hẹn ăn trưa hay những cuộc trò chuyện - đó đều là những hình thức để thực hiện các hoạt động hợp tác, với cuốn sách này bạn hoàn toàn có thể làm được điều đó. Nếu bạn muốn thành công trong lĩnh vực kinh doanh, bạn cần phải biết giành chiến thắng về con người và cuốn sách này sẽ hướng dẫn bạn. “Bảy cấp độ giao tiếp là một cuốn sách dễ hiểu nhất, súc tích nhất mà tôi từng đọc. Cuốn sách cung cấp những kiến thức quan trọng để trở thành một nhân viên kinh doanh thành công. Đây là lý do tại sao Michael J. Mahel trở thành một trong những người bán hàng vĩ đại nhất trên thế giới. Cuốn sách này sẽ trở thành kim chỉ nam cho những người làm kinh doanh và tôi sẽ sử dụng nó trong chương trình đào tạo của tập đoàn LLC.” (Larry Kendall, chủ tịch danh dự của tập đoàn LLC, tác giả cuốn sách “Bán hàng kiểu Ninja”)', N'21.jpg', N'1980 Books')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (22, 1, N'Đừng Bao Giờ Đi Ăn Một Mình', CAST(71000 AS Decimal(18, 0)), 3, 20, N'NXB Trẻ', CAST(N'2016-01-01' AS Date), N'"Trong chúng ta ai cũng có khả năng quyến rũ người khác - cho dù đó là đồng nghiệp, người xa lạ, bạn bè, hay sếp của mình. Nhưng có khả năng khác với biết cách vận dụng nó, và đó là lý do tại sao có những người đi qua cuộc đời này lặng lẽ như những cái bóng, trong khi có người luôn thu hút được sự chú ý bất cứ nơi đâu họ xuất hiện. "Cho nên, Đừng Bao Giờ Đi Ăn Một Mình. Có lẽ không cần phải chứng minh rằng giao tiếp và những mối quan hệ hiệu quả như thế nào trong cuộc sống hiện đại. Bạn không thể ngại giao tiếp trong thời đại mà người ta trao đổi với nhau mọi thứ, nắm bắt mọi cơ hội thông qua một câu nói. Đừng Bao Giờ Đi Ăn Một Mình khuyên bạn đừng ngại giao tiếp. Không những thế, cuốn sách còn đưa ra những lời khuyên hữu ích và thiết thực của việc vận dụng giao tiếp và những mối quan hệ để đạt được thành công không chỉ trong lĩnh vực kinh tế. Trong Đừng Bao Giờ Đi Ăn Một Mình, tác giả đã dẫn ra những cách thức, lý do mà ông đã sử dụng để kết nối với hàng ngàn người - những người ông sẵn sàng giúp đỡ và họ cũng sẵn sàng giúp lại ông. Những lời khuyên về cách xử trí khi bị từ chối, khi phải vượt qua nhiều trở ngại trong xã hội, khi phải khắc phục những kỹ năng yếu kém sẽ giúp đỡ bạn rất nhiều trong việc kết bạn, và xa hơn nữa là thiết lập mối quan hệ dựa trên sự tin tưởng và vô tư. Đừng Bao Giờ Đi Ăn Một Mình được viết với lời văn giản dị và chân thực. Bạn có thể xem đây là một cuốn cẩm nang giao tiếp để học hỏi mỗi ngày. Bạn mong muốn đi tắt đón đầu? Bạn muốn vững bước đến thành công? Công thức để làm được điều này, theo lời bậc thầy về kết nối là Keith Ferrazzi, chính là phải biết làm quen với mọi người. Ferrazzi đã khám phá từ khi còn trẻ rằng điểm khác biệt của những người thành công rực rỡ chính là cách họ vận dụng quyền năng của những mối quan hệ - để mọi người cùng thắng. Trong quyển sách Đừng bao giờ đi ăn một mình, Ferrazzi chỉ ra từng bước cách thức - và lý do - mà chính ông đã áp dụng để kết nối với hàng ngàn người là đồng nghiệp, bạn bè có tên trong số danh bạ, những người ông đã giúp đỡ và ngược lại cũng sẵn sàng giúp đỡ ông. Ferrazzi sinh ra trong một gia đình có cha là công nhân nhà máy thép tỉnh lẻ và mẹ là lao công. Tuy vậy ông đã biết tận dụng khả năng kết nối xuất sắc của mình để dọn đường vào đến Yale, nhận bằng MBA tại Harvard, và giữ những chức vụ lãnh đạo quan trọng. Mặc dù chưa quá 40, Ferrazzi đã tạo được một mạng lưới trải dài từ hành lang ở Washington đến các tên tuổi lớn tại Hollywood. Ông đã được tạp chí Crain bình chọn là một trong số 40 người lãnh đạo kinh doanh dưới 40 tuổi đồng thời là Nhà lãnh đạo tương lai của thế giới tại Diễn đàn Kinh tế Thế giới ở Davos.', N'22.jpg', N'Trần Thị Ngân Tuyến')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (23, 1, N'10 Nguyên Tắc Trở Thành Nhân Tài Của Bill Gates', CAST(44000 AS Decimal(18, 0)), 4, 20, N'NXB Hồng Đức', CAST(N'2016-01-01' AS Date), N'Cuốn sách tập hợp những nguyên tắc để trở thành nhân viên tài giỏi do chính Bill Gates đúc kết. Những nguyên tắc này luôn là kim chỉ nam thành công và nguyên tắc làm việc mà các nhân viên của Công ty Microsoft cần phải tuân theo. Chính vì vậy, rất nhiều công ty nổi tiếng trên thế giới cũng áp dụng những nguyên tắc này để bồi dưỡng, nâng cao tinh thần làm việc của nhân viên công ty mình. 10 Nguyên Tắc Trở Thành Nhân Tài Của Bill Gates đã chỉ ra mục tiêu nỗ lực và phương hướng thành công cho nhân viên trên thế giới. Dù bạn ở đâu, làm gì, chỉ cần bạn nắm chắc, tuân theo và áp dụng những nguyên tắc này thì bạn sẽ thành công. Cuốn sách là một công cụ giúp đào tạo những nhân viên tài giỏi. Cuốn sách nói cho chúng ta biết mình cần phải đổi mới, nâng cao kiến thức ra sao, làm việc nhiệt tình như thế nào, song hành cùng kế hoạch lâu dài của Công ty… qua đó bạn sẽ được khẳng định và đạt được thành công.Trích đoạn Ngày nay, hàng trăm triệu người sử dụng máy tính trên toàn thế giới gần như đều đang sử dụng phần mềm và hệ thống điều hành của Microsoft. Sự thành công của Bill Gates và Microsoft được mọi người gọi là "câu chuyện thần thoại khó tin". Trong mắt mọi người, Bill Gates là danh từ đại diện cho sự thành công. Bill Gates trở thành thần tượng được mọi người ngưỡng mộ và sùng bái, công ty Microsoft trở thành doanh nghiệp lý tưởng trong tâm trí nhiều người. Vì sao Bill Gates và Microsoft có thể đạt được thành công lớn đến như vậy? Rất nhiều người đã thử đưa ra các đáp án khác nhau, nhưng thực ra, ngoài yếu tố Bill Gates là một thiên tài máy tính, thiên tài quản lý và thiên tài kinh doanh còn một yếu tố quan trọng hơn, đó là: Microsoft sở hữu một đội ngũ nhân viên xuất sắc nhất thế giới. Bill Gates đã từng nói: "Nếu một ngày kia thức dậy, toàn bộ Microsoft bị thiêu rụi thành tro, chỉ cần cho tôi 20 nhân viên xuất sắc nhất, mọi thứ lập tức có thể bắt đầu lại". Bill Gates luôn cho rằng, trong doanh nghiệp, bất cứ thứ gì đều có thể đánh giá bằng những giá trị khác nhau, duy nhất đội ngũ nhân viên xuất sắc là vô giá. Trở nên xuất sắc, nổi bật và giành được thành công trong một công ty thời hiện đại là ước nguyện và mục tiêu phấn đấu của mỗi người đi làm. Vậy, phải làm thế nào mới có thể trở thành một nhân viên xuất sắc trong mắt ông chủ, làm thế nào để thực hiện ước mơ thành công của cá nhân mình? Căn cứ theo kinh nghiệm sau khi tiếp xúc với những nhân viên xuất sắc nhất trong quá trình lập nghiệp, Bill Gates đã tổng kết ra 10 nguyên tắc lớn của một nhân viên xuất sắc, những nguyên tắc đó có thể trả lời cho chúng ta câu hỏi trên và giúp chúng ta tìm thấy con đường đi tới thành công. Những nguyên tắc đó luôn là nguyên tắc hành động và kim chỉ nam cho thành công của các nhân viên trong Microsoft, rất nhiều doanh nghiệp nổi tiếng trên thế giới cũng lấy những nguyên tắc đó làm tiêu chuẩn đào tạo, bồi dưỡng tinh thần nghề nghiệp cho nhân viên mình và coi đó là chuẩn mực, khuôn mẫu cho nhân viên.', N'23.jpg', N'Lã Quốc Vinh')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (24, 1, N'8 Kỹ Năng Mềm Thiết Yếu', CAST(89000 AS Decimal(18, 0)), 4, 20, N'NXB Lao Động', CAST(N'2016-01-01' AS Date), N'Bạn luôn cho rằng bằng cấp và kinh nghiệm là những thứ duy nhất mà các nhà tuyển dụng quan tâm khi tìm kiếm nhân viên? Liệu những thứ đó đã đảm bảo cho bạn có một sự nghiệp thành công trong tương lai? Câu trả lời là chưa, vì đó chỉ là điều kiện cần. Bạn còn cần tới những kỹ năng mềm thiết yếu nữa. Kỹ năng mềm không phải là thiên bẩm mà do đào tạo mà nên. Chính vì vậy, kỹ năng mềm cần được học càng sớm càng tốt để bạn có nhiều thời gian thực hành và biến kỹ năng mềm thành thói quen phản xạ có điều kiện. Việc rèn luyện kỹ năng sống là một quá trình lâu dài, bền bỉ ngay từ tuổi thơ nhưng cũng không bao giờ là quá muộn với những ai muốn lam điều đó. Kỹ năng sống có nhiều khía cạnh được ứng dụng trong những lĩnh vực, tình huống khác nhau. Ai cũng cần không ngừng hoàn thiện kỹ năng sống để nâng cao hiệu quả công việc và chất lượng cuộc sống của mình, nhất là đối với những mặt có ảnh hưởng trực tiếp mà bản thân còn khiếm khuyết. 8 kỹ năng mềm thiết yếu cho bạn: Kỹ năng làm chủ cảm xúc. Kỹ năng tư duy phê phán. Kỹ năng tư duy sáng tạo. Kỹ năng giao tiếp. Kỹ năng thuyết trình. Kỹ năng hợp tác. Kỹ năng chinh phục lòng người. Kỹ năng ra quyết định và giải quyết vấn đề.', N'24.jpg', N'Nguyễn Minh Huy - Trần Thượng Tuấn')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (25, 1, N'A Bend In The Road', CAST(165000 AS Decimal(18, 0)), 1, 5, N'Grand Central Publishing', CAST(N'2015-12-13' AS Date), N'Miles Ryan''s life seemed to end the day his wife was killed in a hit-and-run accident two years ago. As deputy sheriff of New Bern, North Carolina, he not only grieves for her and worries about their young son Jonah but longs to bring the unknown driver to justice. Then Miles meets Sarah Andrews, Jonah''s second-grade teacher. A young woman recovering from a difficult divorce, Sarah moved to New Bern hoping to start over. Tentatively, Miles and Sarah reach out to each other...soon they are falling in love. But what neither realizes is that they are also bound together by a shocking secret, one that will force them to reexamine everything they believe in-including their love.', N'a_bend_in_the_road.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (26, 1, N'Fifty Shades Darker', CAST(224000 AS Decimal(18, 0)), 1, 5, N'Arrow Books', CAST(N'2015-12-13' AS Date), N'Daunted by the singular tastes and dark secrets of the beautiful, tormented young entrepreneur Christian Grey, Anastasia Steele has broken off their relationship to start a new career with a Seattle publishing house. But desire for Christian still dominates her every waking thought, and when he proposes a new arrangement, Anastasia cannot resist. They rekindle their searing sensual affair, and Anastasia learns more about the harrowing past of her damaged, driven and demanding Fifty Shades. While Christian wrestles with his inner demons, Anastasia must confront the anger and envy of the women who came before her, and make the most important decision of her life. This book is intended for mature audiences.', N'fifty-shades.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (27, 1, N'Oxford Advanced Learner''s Dictionary', CAST(476000 AS Decimal(18, 0)), 1, 5, N'Oxford Univ Pr', CAST(N'2015-12-13' AS Date), N'The Oxford Advanced Learner’s Dictionary is the ultimate speaking and writing tool for developing the skills students need for passing exams and communicating in English. Trusted by learners and teachers of English for its clear explanations and example sentences, it is a world bestseller and has over 100 million users.', N'tu-dien_oxford.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (28, 1, N'Digital Fortress', CAST(165000 AS Decimal(18, 0)), 1, 5, N'Corgi', CAST(N'2015-12-13' AS Date), N'When the National Security Agency''s invincible code-breaking machine encounters a mysterious code it cannot break, the agency calls in its head cryptographer, Susan Fletcher, a brilliant, beautiful mathematician. What she uncovers sends shock waves through the corridors of power. The NSA is being held hostage - not by guns or bombs, but by a code so complex that if released would cripple U.S. intelligence. Caught in an accelerating tempest of secrecy and lies, Fletcher battles to save the agency she believes in. Betrayed on all sides, she finds herself fighting not only for her country but for her life, and in the end, for the life of the man she loves...', N'digital_fortress.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (29, 1, N'Dark Places', CAST(219000 AS Decimal(18, 0)), 1, 5, N'New York Institute of Finance', CAST(N'2015-12-13' AS Date), N'Libby Day was seven when her mother and two sisters were murdered in “The Satan Sacrifice of Kinnakee, Kansas.” She survived and famously testified that her fifteen-year-old brother, Ben, was the killer. Twenty-five years later, the Kill Club, a secret society obsessed with notorious crimes locates Libby and pumps her for details. They hope to discover proof that may free Ben. Libby hopes to turn a profit off her tragic history: She’ll reconnect with the players from that night and report her findings to the club for a fee. As Libby’s search takes her from shabby Missouri strip clubs to abandoned Oklahoma tourist towns, the unimaginable truth emerges, and Libby finds herself right back where she started on the run from a killer.', N'Dark_place.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (30, 1, N'Chí Phèo', CAST(34000 AS Decimal(18, 0)), 2, 3, N'Đinh Tị', CAST(N'2015-12-13' AS Date), NULL, N'chi-pheo.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (31, 1, N'Tôi thấy hoa vàng trên cỏ xanh', CAST(62000 AS Decimal(18, 0)), 2, 3, N'NXB Trẻ', CAST(N'2015-12-13' AS Date), N'Cuốn sách viết về tuổi thơ nghèo khó ở một làng quê, bên cạnh đề tài tình yêu quen thuộc, lần đầu tiên Nguyễn Nhật Ánh đưa vào tác phẩm của mình những nhân vật phản diện và đặt ra vấn đề đạo đức như sự vô tâm, cái ác. 81 chương ngắn là 81 câu chuyện nhỏ của những đứa trẻ xảy ra ở một ngôi làng: chuyện về con cóc Cậu trời, chuyện ma, chuyện công chúa và hoàng tử, bên cạnh chuyện đói ăn, cháy nhà, lụt lội,... “Tôi thấy hoa vàng trên cỏ xanh” hứa hẹn đem đến những điều thú vị với cả bạn đọc nhỏ tuổi và người lớn bằng giọng văn trong sáng, hồn nhiên, giản dị của trẻ con cùng nhiều tình tiết thú vị, bất ngờ và cảm động trong suốt hơn 300 trang sách. Cuốn sách, vì thế có sức ám ảnh, thu hút, hấp dẫn không thể bỏ qua', N'toi_thay_hoa_vang_tren_co_xanh.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (32, 1, N'Sex Và Những Thứ Khác', CAST(36000 AS Decimal(18, 0)), 2, 3, N'Đinh Tị', CAST(N'2015-12-13' AS Date), N'Cuốn sách nhỏ xinh bỏ túi bạn có thể dễ dàng mang theo bất cứ lúc nào, thỉnh thoảng mang ra vừa đọc và ngẫm nghĩ, biết đâu sẽ khám phá ra nhiều góc nhìn mới mẻ và thú vị khác', N'sex-va-nhung-thu-khac.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (33, 1, N'Những Tấm Lòng Cao Cả', CAST(48000 AS Decimal(18, 0)), 2, 3, N'Đinh Tị', CAST(N'2015-12-13' AS Date), N'Những tấm lòng cao cả là một cuốn tiểu thuyết trẻ em của nhà văn người Ý Edmondo De Amicis. Lấy bối cảnh trong lúc nước Ý đang thống nhất cũng như nói về đề tài yêu nước.', N'nhung-tam-long-cao-ca.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (34, 1, N'ĐỪNG BAO GIỜ ĐI ĂN MỘT MÌNH', CAST(67000 AS Decimal(18, 0)), 2, 4, N'NXB Trẻ', CAST(N'2015-12-13' AS Date), N'Trong Đừng Bao Giờ Đi Ăn Một Mình, tác giả đã dẫn ra những cách thức, lý do mà ông đã sử dụng để kết nối với hàng ngàn người - những người ông sẵn sàng giúp đỡ và họ cũng sẵn sàng giúp lại ông. Những lời khuyên về cách xử trí khi bị từ chối, khi phải vượt qua nhiều trở ngại trong xã hội, khi phải khắc phục những kỹ năng yếu kém sẽ giúp đỡ bạn rất nhiều trong việc kết bạn, và xa hơn nữa là thiết lập mối quan hệ dựa trên sự tin tưởng và vô tư. Đừng Bao Giờ Đi Ăn Một Mình được viết với lời văn giản dị và chân thực. Bạn có thể xem đây là một cuốn cẩm nang giao tiếp để học hỏi mỗi ngày.', N'Dung_bao_gio_di_an_mot_minh.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (35, 1, N'Sống trong giàu có', CAST(42000 AS Decimal(18, 0)), 2, 3, N'MCBooks', CAST(N'2015-12-13' AS Date), N'Cuốn sách sẽ truyền cảm hứng để các bạn có thể kiểm soát và tạo nên một cuộc sống mà các bạn hằng mơ ước. Cuốn sách này cũng rất thân thiện với độc giả và gắn liền với thực tế thay vì đi sâu vào những lí thuyết tài chính dài dòng phức tạp, nên dù cho bạn có là những người có cuộc sống bận rộn thì bạn vẫn có thể đọc nó mỗi ngày. Bạn sẽ nhận ra cuốn sách này thực sự hữu ích đối với bạn. Chỉ cần thực hiện từng bước một đúng thời điểm, bạn sẽ ngạc nhiên khi thấy cuộc sống của mình thay đổi nhiều biết nhường nào khi đọc xong cuốn sách này.', N'song_trong_giau_co.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (36, 1, N'Triệu Phú Khởi Nghiệp Từ Hai Bàn Tay Trắng', CAST(98000 AS Decimal(18, 0)), 3, 4, N'Phú Hà', CAST(N'2015-12-13' AS Date), N'Từ không một xu dính túi bỗng chốc trở nên giàu có, đối với nhiều người căn bản đó là điều không thể. Nhưng trên thế giới hiện nay, đã có không ít người làm được điều đó. Vấn đề then chốt là họ dám nghĩ dám làm, dám dũng cảm biến ước mơ thành hiện thực...', N'trieu_phu_khoi_nghiep_tu_hai_ban_tay_trang.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (37, 1, N'Steve Jobs - Hành Trình Từ Gã Nhà Giàu Khinh Suất Đến Nhà Lãnh Đạo Kiệt Xuất', CAST(109000 AS Decimal(18, 0)), 3, 4, N'Thái Hà', CAST(N'2015-12-13' AS Date), N'Steve Jobs - Hành trình từ gã nhà giàu khinh suất đến nhà lãnh đạo kiệt xuất mang đến câu trả lời cho thắc mắc lớn nhất của cả thế giới về cuộc đời, sự nghiệp của CEO và nhà đồng sáng lập Apple: Làm thế nào một gã trai trẻ kiêu căng, ngạo mạn và đầy khinh suất, bị tống cổ ra khỏi chính công ty mà mình sáng lập ra, lại có thể trở thành một nhà lãnh đạo có tầm nhìn kiệt suất nhất thời đại, và làm thay đổi cuộc sống thường ngày của hàng tỉ con người trên hành tinh này? Schlender và Tetzeli đã kể một câu chuyện hoàn toàn khác về một con người có thực đã biết vượt qua những thất bại của bản thân và học cách tối đa hóa điểm mạnh của chính mình, dựa trên những câu chuyện chưa từng được tiết lộ từ những người thân thuộc nhất với Jobs, bao gồm các thành viên trong gia đình Jobs, các cựu lãnh đạo hàng đầu và những nhân vật quan trọng nhất là Apple, Pixar và Disney, như Tim Cook, Jony Ive, Eddy Cue, Ad Catmull, John Lasserter, Robert Iger.', N'Steve_Jobs_hanh_trinh_tu_ga_nha_giau_kinh_xuat.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (38, 1, N'Đại Việt Sử Ký Toàn Thư', CAST(139000 AS Decimal(18, 0)), 3, 4, N'Nhà sách Minh Thắng', CAST(N'2015-12-13' AS Date), N'Đại Việt Sử Ký Toàn Thư là bộ quốc sử danh tiếng, một di sản quý báu của dân tộc Việt Nam nghìn năm văn hiến. Đó là bộ sử cái, có giá trị nhiều mặt, gắn liền với tên tuổi các nhà sử học nổi tiếng như Lê Văn Hưu, Phan Phu Tiên, Ngô Sĩ Liên, Phạm Công Trứ, Lê Hy… Việc phát hiện bản in xưa nhất của bộ Đại Việt Sử Ký Toàn Thư, bản Nội các quan bản, năm Chính Hòa thứ 18, tức năm 1697 có một ý nghĩa đặc biệt. Bộ sách đã được ra mắt bạn đọc vào những năm 90 của thế kỷ trước và từng được tái bản trong những năm gần đây.', N'dai-viet-su-ki-toan-thu.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (39, 1, N'Tối Ưu Hóa Trí Nhớ Bằng Phương Pháp Hình Ảnh', CAST(90000 AS Decimal(18, 0)), 4, 3, N'Đông A', CAST(N'2015-12-13' AS Date), N'Tối ưu hóa trí nhớ bằng phương pháp hình ảnh là cuốn sách hướng dẫn đầu tiên tận dụng tối đa phương pháp hình ảnh nhằm phát triển toàn diện trí nhớ.', N'toi-uu-hoa-tri-nho-bang-phuong-phap-hinh-anh.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (40, 1, N'Năng Lượng Kim Tự Tháp Thời Đại Mới', CAST(56000 AS Decimal(18, 0)), 4, 3, N'Phương Nam', CAST(N'2015-12-13' AS Date), N'Năng lượng Kim Tự Tháp thời đại mới tiết lộ cho người đọc những hiểu biết về Kim Tự Tháp từ các bậc thầy thiền định. Nguồn gốc, mục đích, và nguồn năng lượng phi thường kỳ diệu ẩn tàng trong những Kim Tự Tháp. Năng lượng đó, nếu áp dụng trong đời sống, nó có thể giúp con người chữa lành mọi bệnh tật, làm bình an tâm trí, thăng hoa trong thiền định, bảo quản thực phẩm, tăng năng suất cây trồng... và rất nhiều tác dụng kỳ diệu khác nữa.', N'nang_luong_kim_tu_thap.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (41, 1, N'Sổ Tay Pháp Luật Dành Cho Giám Đốc Doanh Nghiệp', CAST(296000 AS Decimal(18, 0)), 4, 3, N'Nhà sách Lao Động', CAST(N'2015-12-13' AS Date), N'Hi vọng cuốn sách Sổ Tay Pháp Luật Dành Cho Giám Đốc Doanh Nghiệp là tài liệu bổ ích cho các doanh nghiệp', N'so-tay-phap-luat.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (42, 1, N'Gấu Xù Kể Chuyện - Ba Chú Heo Con', CAST(17000 AS Decimal(18, 0)), 4, 5, N'NXB Trẻ', CAST(N'2015-12-13' AS Date), N'Heo Đốm, Heo Mập và Heo Hồng phải xa mẹ để sống riêng. Mỗi chú tự chọn vật liệu để xây nhà cho mình. Bất ngờ một đêm nọ, gã sói già gian ác mò đến nhà từng chú… Ba chú heo con nằm trong bộ truyện Gấu Xù kể chuyện. Bộ truyện tập hợp những câu chuyện hay và dễ đọc dành cho bạn đọc nhỏ tuổi.', N'ba-chu-heo-con', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (43, 1, N'Ông Biết Tuốt, Đầu Bò Và Tự Kỉ', CAST(29000 AS Decimal(18, 0)), 4, 3, N'Phụ nữ', CAST(N'2015-12-13' AS Date), NULL, N'ong-biet-tuot.jpg', NULL)
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP], [TenSP], [GiaBan], [MaDanhMuc], [SLTon], [NhaSanXuat], [NgayCapNhat], [MoTa], [HinhAnh], [TacGia]) VALUES (44, 1, N'Cậu bé chăn cừu', CAST(17000 AS Decimal(18, 0)), 4, 3, N'NXB Trẻ', CAST(N'2015-12-13' AS Date), N'Cậu bé chăn cừu buồn bực vì dân làng không quan tâm đến mình. Thế là cậu bày trò nói dối là có sói. Liệu sau đó dân làng có còn tin cậu bé? Cậu bé chăn cừu nằm trong bộ truyện Gấu Xù kể chuyện.Bộ truyện tập hợp những câu chuyện hay và dễ đọc dành cho bạn đọc nhỏ tuổi.', N'cau-be-chan-cuu.jpg', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[SanPhamKhuyenMai] ([MaKM], [MaSP], [ChietKhau]) VALUES (1, 1, 20)
INSERT [dbo].[SanPhamKhuyenMai] ([MaKM], [MaSP], [ChietKhau]) VALUES (1, 3, 10)
INSERT [dbo].[SanPhamKhuyenMai] ([MaKM], [MaSP], [ChietKhau]) VALUES (3, 5, 15)
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (1, N'admin', N'12345', 1, 2, 1, N'admin@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (2, N'VanAn', N'12345', 1, 4, 1, N'nvan@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (3, N'hoanglong', N'12345', 1, 4, 4, N'ndhlong1994@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (4, N'client1', N'12345', 1, 4, 3, N'client1@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (5, N'client3', N'12345', 0, 4, 5, N'client3@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (6, N'client2', N'12345', 0, 4, 6, N'client2@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (7, N'manager', N'12345', 1, 1, 2, N'manager@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (8, N'kh', N'12345', 0, 4, 7, N'kh@gmail.com')
INSERT [dbo].[TaiKhoan] ([ID], [TenTaiKhoan], [MatKhau], [TrangThai], [Quyen], [MaND], [Email]) VALUES (9, N'client1', N'12345', 1, 4, 1, N'fhgjkl@gmail')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[BaiPost]  WITH CHECK ADD  CONSTRAINT [FK_BaiPost_TaiKhoan] FOREIGN KEY([NguoiPost])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BaiPost] CHECK CONSTRAINT [FK_BaiPost_TaiKhoan]
GO
ALTER TABLE [dbo].[BinhLuanBaiPost]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanBaiPost_BaiPost] FOREIGN KEY([MaPost])
REFERENCES [dbo].[BaiPost] ([MaPost])
GO
ALTER TABLE [dbo].[BinhLuanBaiPost] CHECK CONSTRAINT [FK_BinhLuanBaiPost_BaiPost]
GO
ALTER TABLE [dbo].[BinhLuanBaiPost]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanBaiPost_TaiKhoan] FOREIGN KEY([NguoiBinhLuan])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BinhLuanBaiPost] CHECK CONSTRAINT [FK_BinhLuanBaiPost_TaiKhoan]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DonHang]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[GiaSach]  WITH CHECK ADD  CONSTRAINT [FK_GiaSach_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[GiaSach] CHECK CONSTRAINT [FK_GiaSach_KhachHang]
GO
ALTER TABLE [dbo].[GiaSach]  WITH CHECK ADD  CONSTRAINT [FK_GiaSach_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GiaSach] CHECK CONSTRAINT [FK_GiaSach_SanPham]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKH] FOREIGN KEY([LoaiKH])
REFERENCES [dbo].[LoaiKH] ([MaCapBac])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_LoaiKH]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_LoaiNV] FOREIGN KEY([LoaiNV])
REFERENCES [dbo].[LoaiNV] ([MaLoai])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_LoaiNV]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamKhuyenMai_CTKhuyenMai] FOREIGN KEY([MaKM])
REFERENCES [dbo].[CTKhuyenMai] ([MaKM])
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai] CHECK CONSTRAINT [FK_SanPhamKhuyenMai_CTKhuyenMai]
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamKhuyenMai_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai] CHECK CONSTRAINT [FK_SanPhamKhuyenMai_SanPham]
GO
USE [master]
GO
ALTER DATABASE [QLWEBSITE] SET  READ_WRITE 
GO
