CREATE DATABASE QuanLyBanHang
GO

USE QuanLyBanHang
GO

CREATE TABLE KhachHang(
	id_KH CHAR(10) PRIMARY KEY,
	ten nvarchar(50),
	tuoi INT,
	dia_chi nvarchar(50),
	gioi_tinh nvarchar(20)
)
GO
CREATE TABLE KhachHangSdt(
	id_KH CHAR(10) REFERENCES KhachHang(id_KH),
	sdt CHAR(20) PRIMARY KEY
)
GO
CREATE TABLE SanPham(
	id_sp CHAR(10) PRIMARY KEY,
	id_hd CHAR(10) REFERENCES dbo.HoaDon(id_hd),
	ten NVARCHAR(50),
	hang NVARCHAR(50),
	gia REAL,
)
GO
CREATE TABLE HangTieuDung(
	id_sp_Hangtd CHAR(10) REFERENCES dbo.SanPham(id_sp),
	loai NVARCHAR(50),
	hsd DATE
)
GO
CREATE TABLE DoGiaDung(
	id_sp_DoGd CHAR(10) REFERENCES dbo.SanPham(id_sp),
	loai NVARCHAR(50)

)
CREATE TABLE Mua(
	id_KH CHAR(10) REFERENCES dbo.KhachHang(id_KH),
	id_sp CHAR(10) REFERENCES dbo.SanPham(id_sp),
	so_luong INT
)
GO
CREATE TABLE NhanVien(
	id_nv CHAR(10) PRIMARY KEY,
	ten NVARCHAR(50),
	tuoi INT,
	dia_chi NVARCHAR(50),
	gioi_tinh NVARCHAR(10)
)
GO
CREATE TABLE NhanViensdt(
	id_nv CHAR(10) REFERENCES NhanVien(id_nv),
	sdt CHAR(20) PRIMARY key
)
GO
CREATE TABLE HoaDon(
	id_hd CHAR(10) PRIMARY KEY,
	id_nv CHAR(10) REFERENCES dbo.NhanVien(id_nv),
	ngay DATE,
	tong_sp INT
	tong_tien REAL,
)
GO
CREATE TABLE ChucVu(
	id_cv CHAR(10) PRIMARY KEY,
	ten NVARCHAR(50)
)
DELETE FROM dbo.ChucVu
ALTER TABLE dbo.NhanVien
ADD id_cv CHAR(10) REFERENCES dbo.ChucVu(id_cv)
-- xong
GO 
CREATE TABLE NhaCC(
	id_nhacc CHAR(10) PRIMARY KEY,
	ten NVARCHAR(50),
	dia_chi NVARCHAR(50),
)
GO
CREATE TABLE ChiNhanh(
	id_cn CHAR(10) PRIMARY KEY,
	id_nhacc CHAR(10) REFERENCES dbo.NhaCC(id_nhacc),
	ten NVARCHAR(50),
	dia_chi NVARCHAR(50)
)
GO
CREATE TABLE NhapHang(
	id_nhap CHAR(10) PRIMARY KEY,
	id_sp CHAR(10) REFERENCES dbo.SanPham(id_sp),
	id_nv CHAR(10) REFERENCES dbo.NhanVien(id_nv),
	id_cn CHAR(10) REFERENCES dbo.ChiNhanh(id_cn),
	so_luong int
)
GO 
