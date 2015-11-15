use master

IF exists (SELECT [name] FROM sys.databases where [name] = 'QLWEBSITE')
DROP DATABASE QLWEBSITE

CREATE DATABASE QLWEBSITE
Go

use QLWEBSITE


CREATE TABLE CTKhuyenMai(MaKM int, MaSP int, ChietKhau float, NgayBD date, NgayKT date PRIMARY KEY (MaKM, MaSP))
CREATE TABLE BinhLuan_DanhGia(MaBGDG int  , MaKH int, MaSP int, DanhGia int, NoiDung nvarchar(1000) PRIMARY KEY (MaBGDG, MaKH, MaSP))
CREATE TABLE DonHang(MaDH int, MaKH int, NgayDat date, NgayGiao date, TinhTrangThanhToan int, DaThanhToan bit PRIMARY KEY (MaDH))
CREATE TABLE CTDonHang(MaDH int, MaSP int, SoLuong int, DonGia  decimal, PhiVanChuyen decimal, DiaChiGiaoHang nvarchar(250), NguoiNhan nvarchar(50), SDT nchar(11) PRIMARY KEY (MaDH, MaSP))
CREATE TABLE TaiKhoan(ID int, TenTaiKhoan nvarchar(50), MatKhau nvarchar(50), TrangThai bit, Quyen nvarchar(50) PRIMARY KEY (ID))
CREATE TABLE KhachHang(MaKH int, TenKH nvarchar(30),NgSinh date, GioiTinh nvarchar(4), DiaChi nvarchar(30), SDT nvarchar(12), LoaiKH int, DiemTichLuy  int PRIMARY KEY (MaKH))
CREATE TABLE NhanVien(MaNV int, TenNV nvarchar(30),NgSinh date, GioiTinh nvarchar(4), DiaChi nvarchar(30), SDT nvarchar(12), LoaiNV int, Thuong decimal PRIMARY KEY (MaNV))
CREATE TABLE LoaiKH(MaCapBac int,  TenCapBac nvarchar(50), ChietKhau float, NgayApDung  date PRIMARY KEY (MaCapBac))  
CREATE TABLE LoaiNV( MaLoai int,   LuongCoBan decimal, PhuCap float PRIMARY KEY (MaLoai))
CREATE TABLE SanPham (MaSP int, LoaiSP int, TenSP nvarchar(50) , GiaBan decimal, HinhAnh image, DanhMuc int, SLTon int, NhaSanXuat nvarchar(50), NgayCapNhat date, MoTa nvarchar (1000) PRIMARY KEY (MaSP))
CREATE TABLE LoaiSanPham(MaLoai int, TenLoaiSP nvarchar(50), PRIMARY KEY (MaLoai))
CREATE TABLE DanhMuc(MaDanhMuc int, TenDanhMuc nvarchar(50),  PRIMARY KEY (MaDanhMuc))


ALTER TABLE CTKhuyenMai
ADD FOREIGN KEY (MaSP)
REFERENCES SanPham (MaSP)


ALTER TABLE KhachHang 
ADD FOREIGN KEY (MaKH)
REFERENCES TaiKhoan(ID)

ALTER TABLE KhachHang 
ADD FOREIGN KEY (MaKH)
REFERENCES LoaiKH(MaCapBac)

ALTER TABLE NhanVien
ADD FOREIGN KEY (MaNV)
REFERENCES TaiKhoan(ID)

ALTER TABLE NhanVien
ADD FOREIGN KEY (LoaiNV)
REFERENCES LoaiNV(MaLoai)

ALTER TABLE BinhLuan_DanhGia
ADD FOREIGN KEY (MaKH)
REFERENCES TaiKhoan(ID)

ALTER TABLE BinhLuan_DanhGia
ADD FOREIGN KEY (MaSP)
REFERENCES SanPham (MaSP)

ALTER TABLE DonHang
ADD FOREIGN KEY (MaKH)
REFERENCES TaiKhoan(ID)

ALTER TABLE CTDonHang
ADD FOREIGN KEY (MaDH)
REFERENCES DonHang(MaDH)

ALTER TABLE CTDonHang
ADD FOREIGN KEY (MaSP)
REFERENCES SanPham (MaSP)


ALTER TABLE SanPham 
ADD FOREIGN KEY (LoaiSP)
REFERENCES LoaiSanPham (MaLoai)

ALTER TABLE SanPham 
ADD FOREIGN KEY (DanhMuc)
REFERENCES DanhMuc (MaDanhMuc)