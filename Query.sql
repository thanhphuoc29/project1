USE QuanLyBanHang
GO

-- Liệt kê danh sách nhân viên kèm chức vụ
SELECT nv.id_nv,nv.ten,nv.tuoi,nv.dia_chi,nv.gioi_tinh,cv.ten
FROM dbo.NhanVien AS nv JOIN dbo.ChucVu AS cv
ON cv.id_cv = nv.id_cv
-- in ra hóa đơn bán hàng
SELECT dbo.HoaDon.id_hd,dbo.HoaDon.id_nv,dbo.SanPham.ten,dbo.SanPham.gia,dbo.Mua.so_luong,dbo.HoaDon.ngay,dbo.HoaDon.tong_sp,dbo.HoaDon.tong_tien
FROM dbo.HoaDon
LEFT JOIN dbo.SanPham ON SanPham.id_hd = HoaDon.id_hd
JOIN dbo.Mua ON Mua.id_sp = SanPham.id_sp


-- Liệt kê số sản phẩm mỗi nhân viên bán được
SELECT dbo.NhanVien.id_nv,SUM(dbo.HoaDon.tong_sp) AS [so sp]
FROM dbo.NhanVien,dbo.HoaDon
WHERE dbo.NhanVien.id_nv=dbo.HoaDon.id_nv
GROUP BY dbo.NhanVien.id_nv

-- Liệt kê những khách hàng mua hàng có địa chỉ ở Hà Nội và số lượng sản phẩm và tổng tiền
SELECT dbo.KhachHang.ten AS [tên khách hàng],dbo.KhachHang.dia_chi AS [địa chỉ],SUM(dbo.Mua.so_luong) AS [số sản phẩm],
dbo.HoaDon.tong_tien AS [Tổng tiền mua]
FROM dbo.KhachHang
JOIN dbo.Mua ON Mua.id_KH = KhachHang.id_KH
JOIN dbo.SanPham ON SanPham.id_sp = Mua.id_sp
JOIN dbo.HoaDon ON HoaDon.id_hd = SanPham.id_hd
WHERE dbo.KhachHang.dia_chi LIKE 'H%'
GROUP BY dbo.KhachHang.ten,dbo.KhachHang.dia_chi,tong_tien
ORDER BY dbo.KhachHang.ten
