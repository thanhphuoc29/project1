USE QuanLyBanHang
GO

-- câu 1: Liệt kê danh sách nhân viên kèm chức vụ
SELECT nv.id_nv,nv.ten,nv.tuoi,nv.dia_chi,nv.gioi_tinh,cv.ten
FROM dbo.NhanVien AS nv JOIN dbo.ChucVu AS cv
ON cv.id_cv = nv.id_cv
--WHERE cv.id_cv='CV01' -- Nhân viên bán hàng
WHERE cv.id_cv='CV02' -- Nhân viên nhập hàng
-- Câu 2: In ra hóa đơn bán hàng (của tất cả các hóa đơn hoặc của từng hóa đơn )
SELECT dbo.HoaDon.id_hd AS [Mã HD],dbo.HoaDon.id_nv AS [Mã NV],dbo.SanPham.ten AS [Tên SP],
dbo.SanPham.gia AS Giá,dbo.Mua.so_luong AS [Số lượng],
dbo.HoaDon.ngay AS [Ngày bán],dbo.HoaDon.tong_sp AS [Tổng SP],
dbo.HoaDon.tong_tien AS [Tổng tiền]
FROM dbo.HoaDon
LEFT JOIN dbo.SanPham ON SanPham.id_hd = HoaDon.id_hd
JOIN dbo.Mua ON Mua.id_sp = SanPham.id_sp
--WHERE HoaDon.id_hd='HD01'
--where dbo.HoaDon.ngay='2022-02-12'
ORDER BY HoaDon.id_hd

-- Câu 3: Liệt kê số sản phẩm mỗi nhân viên bán được
SELECT dbo.HoaDon.id_nv AS [Mã NV],sum(dbo.HoaDon.tong_sp) AS [Số sản phẩm]
FROM dbo.HoaDon
GROUP BY id_nv

-- Câu 4: Liệt kê những khách hàng mua hàng có địa chỉ ở Hà Nội và số lượng sản phẩm và tổng tiền
SELECT dbo.KhachHang.ten AS [tên khách hàng],dbo.KhachHang.dia_chi AS [địa chỉ],SUM(dbo.Mua.so_luong) AS [số sản phẩm],
dbo.HoaDon.tong_tien AS [Tổng tiền mua]
FROM dbo.KhachHang
JOIN dbo.Mua ON Mua.id_KH = KhachHang.id_KH
JOIN dbo.SanPham ON SanPham.id_sp = Mua.id_sp
JOIN dbo.HoaDon ON HoaDon.id_hd = SanPham.id_hd
WHERE dbo.KhachHang.dia_chi LIKE 'Hà N%'
GROUP BY dbo.KhachHang.ten,dbo.KhachHang.dia_chi,tong_tien
ORDER BY dbo.KhachHang.ten

-- Câu 5: Liệt kê danh sách các mặt hàng đã nhập kèm tên nhân viên, chi nhánh và nhà cung cấp
SELECT dbo.NhanVien.id_nv AS [Mã nv],dbo.NhanVien.ten AS [Tên nhân viên],
dbo.SanPham.id_sp AS [Mã sp],dbo.SanPham.ten AS [Tên sản phẩm],
dbo.ChiNhanh.ten AS [Tên chi nhánh],dbo.NhaCC.ten AS [Tên nhà cung cấp]
FROM dbo.NhanVien
JOIN dbo.NhapHang ON NhapHang.id_nv = NhanVien.id_nv
JOIN dbo.SanPham ON SanPham.id_sp = NhapHang.id_sp
JOIN dbo.ChiNhanh ON ChiNhanh.id_cn = NhapHang.id_cn
JOIN dbo.NhaCC ON NhaCC.id_nhacc = ChiNhanh.id_nhacc

-- Câu 6: Liệt kê các mặt hàng tiêu dùng và mặt hàng đồ gia dụng
--hang tieu dung
SELECT td.id_sp_Hangtd AS [ID hàng tiêu dùng],sp.ten AS [Tên hàng tiêu dùng],td.loai AS Loại
FROM dbo.HangTieuDung AS td
JOIN dbo.SanPham AS sp ON sp.id_sp = td.id_sp_Hangtd
-- do gia dung
SELECT gd.id_sp_DoGd AS [ID hàng tiêu dùng],sp.ten AS [Tên hàng tiêu dùng],gd.loai AS Loại
FROM dbo.DoGiaDung AS gd
JOIN dbo.SanPham AS sp ON sp.id_sp = gd.id_sp_DoGd

-- Câu 7: Liệt kê danh sách khách hàng tham gia mua đồ 
SELECT DISTINCT buy.id_KH AS [Mã KH],cus.ten AS [Tên KH],cus.tuoi AS Tuổi,cus.dia_chi AS [Địa chỉ],sdt.sdt
FROM dbo.Mua AS buy, dbo.KhachHang AS cus,dbo.KhachHangSdt AS sdt
WHERE buy.id_KH=cus.id_KH AND cus.id_KH=sdt.id_KH
ORDER BY buy.id_KH

-- Câu 8: Liệt kê nhân top 3 nhân viên bán được nhiều sản phẩm nhất
SELECT A.[Mã NV],dbo.NhanVien.ten AS [Tên NV],A.[Số sản phẩm]
FROM (
	SELECT TOP 3 dbo.HoaDon.id_nv AS [Mã NV],sum(dbo.HoaDon.tong_sp) AS [Số sản phẩm]
	FROM dbo.HoaDon
	GROUP BY dbo.HoaDon.id_nv
	ORDER BY [Số sản phẩm] DESC) AS A,dbo.NhanVien
	WHERE A.[Mã NV]=dbo.NhanVien.id_nv

-- Thưởng 100000  cho top 3 nhân viên bán được nhiều sản phẩm nhất
-- thêm cột bonus vào bảng nhân viên
ALTER TABLE dbo.NhanVien
ADD bonus INT

UPDATE dbo.NhanVien
SET bonus=100000
WHERE id_nv IN
	(SELECT A.[Mã NV]
	FROM (
		SELECT TOP 3 dbo.HoaDon.id_nv AS [Mã NV],sum(dbo.HoaDon.tong_sp) AS [Số sản phẩm]
		FROM dbo.HoaDon
		GROUP BY id_nv
		ORDER BY [Số sản phẩm] DESC) AS A
		 )
SELECT * FROM dbo.NhanVien
WHERE bonus IS NOT NULL

-- Câu 9: Liệt kê khách hàng chi nhiều tiền nhất mua sản phẩm
SELECT DISTINCT TOP 1 dbo.KhachHang.id_KH AS [Mã KH], dbo.KhachHang.ten AS [Tên KH]
,dbo.HoaDon.tong_sp AS [Tổng SP],
dbo.HoaDon.tong_tien AS [Tổng tiền]
FROM dbo.KhachHang
JOIN dbo.Mua ON Mua.id_KH = KhachHang.id_KH
JOIN dbo.SanPham ON SanPham.id_sp = Mua.id_sp
JOIN dbo.HoaDon ON HoaDon.id_hd = SanPham.id_hd
ORDER BY tong_tien DESC

-- Câu 10: Liệt kê khách hàng chỉ mua 1 sản phẩm
SELECT DISTINCT dbo.KhachHang.id_KH AS [Mã KH], dbo.KhachHang.ten AS [Tên KH],dbo.HoaDon.tong_sp AS [Tổng SP],
dbo.HoaDon.tong_tien AS [Tổng tiền]
FROM dbo.KhachHang
JOIN dbo.Mua ON Mua.id_KH = KhachHang.id_KH
JOIN dbo.SanPham ON SanPham.id_sp = Mua.id_sp
JOIN dbo.HoaDon ON HoaDon.id_hd = SanPham.id_hd
WHERE tong_sp=1
ORDER BY tong_sp

-- Câu 11: Liệt kê mã NV,tên nhân viên tham gia nhập hàng và số lượng sp nhập về của từng nhân viên
SELECT dbo.NhapHang.id_nv AS [Mã NV],dbo.NhanVien.ten AS [Tên NV],
SUM(dbo.NhapHang.so_luong) AS [Số lượng]
FROM dbo.NhapHang, dbo.NhanVien
WHERE NhapHang.id_nv=NhanVien.id_nv
GROUP BY NhapHang.id_nv,ten 

