use master

IF exists (SELECT [name] FROM sys.databases where [name] = 'QLWEBSITE')
DROP DATABASE QLWEBSITE

CREATE DATABASE QLWEBSITE
Go

use QLWEBSITE


CREATE TABLE SanPham (MaSP int, LoaiSP int, TenSP nvarchar(50) , GiaBan decimal, HinhAnh image, DanhMuc int, SLTon int, NhaSanXuat nvarchar(50), NgayCapNhat date, MoTa nvarchar (1000) PRIMARY KEY (MaSP))
CREATE TABLE LoaiSanPham(MaLoai int, TenLoaiSP nvarchar(50), PRIMARY KEY (MaLoai))
CREATE TABLE DanhMuc(MaDanhMuc int, TenDanhMuc nvarchar(50),  PRIMARY KEY (MaDanhMuc))
CREATE TABLE CTKhuyenMai(MaKM int, MaSP int, ChietKhau float, NgayBD date, NgayKT date PRIMARY KEY (MaKM, MaSP))
CREATE TABLE KhachHang(MaKH int, LoaiKH int, DiemTichLuy  int PRIMARY KEY (MaKH, LoaiKH))
CREATE TABLE NhanVien(MaNV int, LoaiNV int, Thuong decimal PRIMARY KEY (MaNV, LoaiNV))
CREATE TABLE LoaiNV( MaLoai int,  LoaiNguoiDung int, LuongCoBan decimal, PhuCap float PRIMARY KEY (MaLoai))
CREATE TABLE BinhLuan_DanhGia(MaBGDG int, MaKH int, MaSP int, DanhGia int, NoiDung nvarchar(1000) PRIMARY KEY (MaBGDG, MaKH, MaSP))
CREATE TABLE DonHang(MaDH int, MaKH int, NgayDat date, NgayGiao date, TinhTrangThanhToan int, DaThanhToan bit PRIMARY KEY (MaDH))
CREATE TABLE CTDonHang(MaDH int, MaSP int, SoLuong int, DonGia  decimal PRIMARY KEY (MaDH, MaSP))
CREATE TABLE LoaiKH(MaCapBac int, LoaiNguoiDung int, TenCapBac nvarchar(50), ChietKhau float, NgayApDung  date PRIMARY KEY (MaCapBac))  
CREATE TABLE LoaiNguoiDung(MaLoai int, TenLoai nvarchar(50), PRIMARY KEY (MaLoai))
CREATE TABLE TaiKhoan(ID int, TenTaiKhoan nvarchar(50),  Email nvarchar(50), MatKhau nvarchar(50), DiaChi nvarchar(50), DienThoai  nvarchar(11), GioiTinh nvarchar(5), HoTen nvarchar(50), NgaySinh date, TrangThai bit PRIMARY KEY (ID))


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

ALTER TABLE LoaiKH
ADD FOREIGN KEY (LoaiNguoiDung)
REFERENCES LoaiNguoiDung(MaLoai)

ALTER TABLE LoaiNV
ADD FOREIGN KEY (LoaiNguoiDung)
REFERENCES LoaiNguoiDung (MaLoai)

ALTER TABLE SanPham 
ADD FOREIGN KEY (LoaiSP)
REFERENCES LoaiSanPham (MaLoai)

ALTER TABLE SanPham 
ADD FOREIGN KEY (DanhMuc)
REFERENCES DanhMuc (MaDanhMuc)