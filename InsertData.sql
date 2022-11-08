USE QuanLyBanHang
GO

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
('CN001','CC001','Chi Nhánh số 1','Thanh Xuân - Hà Đông'),
('CN002','CC001','Chi Nhánh số 2','Yên Xá - Hà Đông'),
('CN003','CC003','Chi Nhánh số 3','Hoàng Mai - Hà Nội'),
('CN004','CC002','Chi Nhánh số 4','Dương Nội - Hà Đông'),
('CN005','CC005','Chi Nhánh số 5','Hai Bà Trưng - Hà Nội'),
('CN006','CC008','Chi Nhánh số 6','Dương Nội - Hà Đông'),
('CN007','CC010','Chi Nhánh số 7','Kiến An - Hải Phòng'),
('CN008','CC009','Chi Nhánh số 8','Thanh Xuân - Hà Đông'),
('CN009','CC006','Chi Nhánh số 9','Cầu Giấy - Hà Nội'),
('CN010','CC004','Chi Nhánh số 10','Phủ Lý - Hà Nam')
GO

INSERT INTO dbo.SanPham
(
    id_sp,
    ten,
    hang,
    gia,
    loai,
    id_hd
)
VALUES
(   '',  -- id_sp - char(10)
    N'', -- ten - nvarchar(50)
    N'', -- hang - nvarchar(50)
    0.0, -- gia - real
    N'', -- loai - nvarchar(50)
    ''   -- id_hd - char(10)
    )
INSERT INTO dbo.NhapHang
(
    id_nhap,
    id_cn,
    id_sp,
    id_nv,
    so_luong
)
VALUES
('NH001','CN01','SP001','NV01','100'),
('NH002','CN02','SP001','NV02','90'),
('NH003','CN03','SP001','NV03','66'),
('NH004','CN04','SP001','NV04','78'),
('NH005','CN05','SP001','NV05','125'),
('NH006','CN06','SP001','NV06','15'),
('NH007','CN07','SP001','NV07','70'),
('NH008','CN08','SP001','NV08','95'),
('NH009','CN09','SP001','NV09','65'),
('NH010','CN10','SP001','NV10','25')

