USE QuanLyBanHang
GO
USE test2
--them du lieu
INSERT INTO dbo.KhachHang
VALUES
('KH01',N'Nguyễn Minh Tiến',20,N'Hà Nội',N'Nam'),
('KH02',N'Chu Thị Yến',20,N'Thanh Hóa',N'Nữ'),
('KH03',N'Nguyễn Tiến Thành',20,N'Nghệ An',N'Nam'),
('KH04',N'Nguyễn Thị Quỳnh',20,N'Thái Bình',N'Nữ'),
('KH05',N'Phùng Quang Tiến',20,N'Quảng Ninh',N'Nam'),
('KH06',N'Nguyễn Thu Hường',20,N'Quảng Trị',N'Nữ'),
('KH07',N'Chu Văn Mạng',20,N'Nam Định',N'Nam'),
('KH08',N'Phùng Thị Minh Thư',20,N'Hà Nội',N'Nữ'),
('KH09',N'Phạm Tiến Thành',20,N'Hà Nội',N'Nam'),
('KH10',N'Nguyễn Thị Trang',20,N'Hà Nội',N'Nữ')
GO
INSERT INTO dbo.KhachHangSdt
VALUES
('KH01','095123415'),
('KH02','096554165'),
('KH03','033453123'),
('KH04','036512355'),
('KH05','091321551'),
('KH06','064545551'),
('KH07','045115155'),
('KH08','093151321'),
('KH09','091351535'),
('KH10','064513155')
GO
INSERT INTO dbo.ChucVu
VALUES
('CV01',N'Nhân viên bán hàng'),
('CV02',N'Nhân viên kiểm kho'),
('CV03',N'Nhân viên nhập hàng')
GO
INSERT INTO dbo.NhanVien
VALUES
('NV001',N'Nguyễn Việt Hoa',25,N'Phùng khoang',N'Nữ','CV01'),
('NV002',N'Nguyễn Quốc Hưng',28,N'Thanh Xuân',N'Nam','CV01'),
('NV003',N'Dinh Quốc Trung',30,N'Thanh Xuân Trung',N'Nam','CV02'),
('NV004',N'Đỗ Duy Hưng',25, N'Đống Đa',N'Nam','CV02'),
('NV005',N'Đào Thị Hoa',25, N'Thanh Xuân',N'Nữ','CV01'),
('NV006',N'Cao Xuan Trung', 29 ,N'Nam Từ Liêm', 'Nam','CV01'),
('NV007',N'Nguyễn Mai Linh', 27 ,N'Phùng Khoang',N'Nữ','CV01'),
('NV008',N'Nguyễn Văn Trung',26,N'Long Biên','Nam','CV02'),
('NV009',N'Vũ Đức Thọ', 35 ,N'Xuân Trường', 'Nam','CV02'),
('NV010',N'Nguyễn Bảo Ngọc', 35 , N'Hà Đông', N'Nữ','CV01')
GO

INSERT INTO dbo.NhanViensdt
VALUES
('NV001','0356144246'),
('NV002','0865746872'),
('NV003','0981541242'),
('NV004','0893458522'),
('NV005','0393548554'),
('NV006','0954856254'),
('NV007','0899584556'),
('NV008','0373548699'),
('NV009','0918456432'),
('NV010','0865977642')
GO
INSERT INTO dbo.HoaDon
(
    id_hd,
	id_nv,
	tong_sp,
    tong_tien,
	ngay
)
VALUES
('HD01','NV001',3,105000,'2022-02-12'),
('HD02','NV002',1,200000,'2022-02-12'),
('HD03','NV002',1,300000,'2022-02-13'),
('HD04','NV005',1,20000,'2022-02-13'),
('HD05','NV006',2,590000,'2022-02-14'),
('HD06','NV005',1,20000,'2022-02-14'),
('HD07','NV007',1,30000,'2022-02-15')
GO
INSERT INTO dbo.SanPham
(
    id_sp,
	id_hd,
    ten,
    gia,
	hang
)
VALUES
('TD001', 'HD01', N'Sữa chua', 50000 , 'Vinamilk'),
('TD002', 'HD01', N'Kem', 50000 , N'Tràng tiền'),
('GD003', 'HD02', N'Nồi cơm điện', 200000 , 'CucCu'),
('TD004', 'HD01', N'Mì tôm', 5000, N'Hảo hảo'),
('GD005', 'HD03', N'Quạt điện', 300000 , N'Toshiba'),
('TD006', 'HD04', N'Nước ngọt', 20000 , 'Cocacola'),
('GD007', 'HD05', N'Ấm siêu tốc', 90000 , 'Sanyo'),
('GD008', 'HD05', N'Nồi chiên không dầu', 500000 , N'Panasonic'),
('TD009', 'HD06', N'Xì dầu', 20000 , 'Vinacol'),
('TD010', 'HD07', N'Nước lau nhà', 30000 , 'Sunlight')
GO
INSERT INTO dbo.HangTieuDung
VALUES
('TD001',N'Đồ đóng hộp','2025-02-12'),
('TD002',N'Đồ ăn vặt','2022-04-25'),
('TD004',N'Đồ khô','2022-12-22'),
('TD006',N'Đồ uống','2022-11-03'),
('TD009',N'Gia vị','2025-02-28'),
('TD010',N'Đồ sinh hoạt','2027-07-15')
GO
INSERT INTO dbo.DoGiaDung
VALUES
('GD003',N'Đồ gia dụng phòng bếp'),
('GD005',N'Đồ gia dụng phòng khách'),
('GD007',N'Đồ gia dụng phòng bếp'),
('GD008',N'Đồ gia dụng phòng bếp')
GO
INSERT INTO dbo.Mua
VALUES
('KH01','TD001',1),
('KH01','TD002',1),
('KH01','TD004',1),
('KH02','TD006',1),
('KH05','TD009',1),
('KH06','TD010',1),
('KH07','GD003',1),
('KH08','GD005',1),
('KH09','GD007',1),
('KH09','GD008',1)
GO
INSERT INTO dbo.NhaCC
VALUES
('CC001',N'Công Ty TNHH Hà Long',N'Thanh Xuân - Hà Đông'),
('CC002',N'Công Ty TNHH Hoàng Minh',N'Dương Nội - Hà Đông'),
('CC003',N'Công Ty Kinh Doanh Việt Dương',N'Hoàng Mai - Hà Nội'),
('CC004',N'Công Ty SX Thiên Long',N'Phủ Lý - Hà Nam'),
('CC005',N'Công Ty TNHH Long Thành',N'Hai Bà Trưng - Hà Nội'),
('CC006',N'Công Ty TNHH Bắc Việt',N'Cầu Giấy - Hà Nội'),
('CC007',N'Công Ty Thực Phẩm Hương Ly',N' Từ Liêm - Hà Nội'),
('CC008',N'Công Ty Thực Phẩm CP',N'Hoài Đức - Hà Nội'),
('CC009',N'Công Ty TNHH Việt Đức',N'Thanh Xuân- Hà Đông'),
('CC010',N'Công Ty TNHH Quang Long',N'Kiến An - Hải Phòng')
GO
INSERT INTO dbo.ChiNhanh
VALUES
('CN001','CC001',N'Chi Nhánh số 1',N'Thanh Xuân - Hà Đông'),
('CN002','CC001',N'Chi Nhánh số 2',N'Yên Xá - Hà Đông'),
('CN003','CC003',N'Chi Nhánh số 3',N'Hoàng Mai - Hà Nội'),
('CN004','CC002',N'Chi Nhánh số 4',N'Dương Nội - Hà Đông'),
('CN005','CC005',N'Chi Nhánh số 5',N'Hai Bà Trưng - Hà Nội'),
('CN006','CC008',N'Chi Nhánh số 6',N'Dương Nội - Hà Đông'),
('CN007','CC010',N'Chi Nhánh số 7',N'Kiến An - Hải Phòng'),
('CN008','CC009',N'Chi Nhánh số 8',N'Thanh Xuân - Hà Đông'),
('CN009','CC006',N'Chi Nhánh số 9',N'Cầu Giấy - Hà Nội'),
('CN010','CC004',N'Chi Nhánh số 10',N'Phủ Lý - Hà Nam')
GO
INSERT INTO dbo.NhapHang
(
    id_nhap,
    id_cn,
	id_sp,
	id_nv,
    so_luong
)
VALUES
('NH001','CN001','TD001','NV001','100'),
('NH002','CN002','TD002','NV002','90'),
('NH003','CN003','GD003','NV003','66'),
('NH004','CN004','TD004','NV004','78'),
('NH005','CN005','TD006','NV005','125'),
('NH006','CN006','GD005','NV006','15'),
('NH007','CN007','GD007','NV007','70'),
('NH008','CN008','TD009','NV008','95'),
('NH009','CN009','GD008','NV009','65'),
('NH010','CN010','TD010','NV010','25')
GO
