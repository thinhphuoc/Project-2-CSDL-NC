USE FlowerShop;

--Insert TAIKHOAN
BULK INSERT dbo.TAIKHOAN
from 'D:\Data\TAIKHOAN.csv'
with 
(
	 FIELDQUOTE = '"',
     FIRSTROW = 2,
     FIELDTERMINATOR = ',', 
     ROWTERMINATOR = '\n',  
     TABLOCK
)
go
--delete from TAIKHOAN

--Insert NHANVIEN
BULK INSERT dbo.NHANVIEN
from 'D:\Data\NHANVIEN.csv'
with 
(
	 FIELDQUOTE = '"',
     FIRSTROW = 2,
     FIELDTERMINATOR = ',', 
     ROWTERMINATOR = '\n',  
     TABLOCK
)
go

--Insert LUONG
BULK INSERT dbo.LUONG
from 'D:\Data\LUONG.csv'
with 
(
	 FIELDQUOTE = '"',
     FIRSTROW = 2,
     FIELDTERMINATOR = ',', 
     ROWTERMINATOR = '\n',  
     TABLOCK
)
go

--Insert SANPHAM
BULK INSERT dbo.SANPHAM
from 'D:\Data\SANPHAM.csv'
with 
(
	 FIELDQUOTE = '"',
     FIRSTROW = 2,
     FIELDTERMINATOR = ',', 
     ROWTERMINATOR = '\n',  
     TABLOCK
)
go

select * from TAIKHOAN
select * from NHANVIEN
select * from LUONG
select * from SANPHAM