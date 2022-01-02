USE FlowerShop

--Câu 1: Tìm kiếm những Tài khoản khách hàng được tạo vào tháng 9 năm 2021
select * 
from TAIKHOAN tk
where tk.LoaiTK = 'KH' and month(tk.NgayLapTK) = 9 and year(tk.NgayLapTK) = 2021

--Tạo index
create nonclustered index LoaiTK_KH
on TAIKHOAN(LoaiTK)
include
(
	[TaiKhoan], [MatKhau], [NgayLapTK], [TrangThai]
)

select * 
from TAIKHOAN tk
with (index(LoaiTK_KH))
where tk.LoaiTK = 'KH' and month(tk.NgayLapTK) = 9 and year(tk.NgayLapTK) = 2021

--Câu 2: Tìm nhân viên có lương cứng cao nhất
select nv.MaNV,nv.HoTenNV,nv.SDT_NV,l.LuongCung
from NHANVIEN nv, LUONG l
where nv.MaNV = l.MaNV and l.LuongCung >= ( select max(l.LuongCung)
											from LUONG l)


create index Luong_Max
on Luong(LuongCung,MaNV)

select nv.MaNV,nv.HoTenNV,nv.SDT_NV,l.LuongCung
from NHANVIEN nv, LUONG l
with (index(Luong_Max))
where nv.MaNV = l.MaNV and l.LuongCung >= ( select max(l.LuongCung)
											from LUONG l)

--Câu 3: Tìm danh sách các loại hoa có tên là Tulip
Select *
from SANPHAM sp
where sp.TenSP like '%Tulip%'

Create nonclustered index SEEK_HOA
on SANPHAM(TenSP)

Select *
from SANPHAM sp
with (index(SEEK_HOA))
where sp.TenSP like '%Tulip%'

--Câu 4: Tìm sản phẩm có giá trị cao nhất
select sp.MaSP,sp.TenSP, sp.LoaiSP,sp.GiaSP,sp.SoLuongTonKho
from SANPHAM sp
where sp.GiaSP > = (select max(sp.GiaSP)
					from SANPHAM sp )

create index Max_GiaSP
on SANPHAM(GiaSP)

select sp.MaSP,sp.TenSP, sp.LoaiSP,sp.GiaSP,sp.SoLuongTonKho
from SANPHAM sp
with(index(Max_GiaSP))
where sp.GiaSP > = (select max(sp.GiaSP)
					from SANPHAM sp )
