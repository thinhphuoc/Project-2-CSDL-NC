USE FlowerShop

CREATE PROC tao_tai_khoan @tai_khoan VARCHAR(20), @mat_khau BINARY(16), 
						@ho_ten NVARCHAR(30), @dia_chi NVARCHAR(30),
						@sdt VARCHAR(10), @email VARCHAR(30),
						@ng_sinh DATE
AS
BEGIN TRANSACTION
BEGIN TRY
	INSERT INTO TAIKHOAN(TaiKhoan, MatKhau, LoaiTK)
	VALUES (@tai_khoan, @mat_khau, 'KH');

	INSERT INTO KHACHHANG(TaiKhoan, HoTenKH, DiaChiKH, SDT, EmailKH)
	VALUES (@tai_khoan, @ho_ten, @dia_chi, @sdt, @email, @ng_sinh);

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH
GO

CREATE PROC thanh_toan_HOADON_atm @ma_HD INT, @so_tk CHAR(10), @ten_tk NVARCHAR(30), @ngan_hang NVARCHAR(30)
AS
BEGIN TRANSACTION
BEGIN TRY
	DECLARE @ma_kh INT, @tong_tien DECIMAL;
	SET @ma_kh = (SELECT TOP 1 HD.MaKH FROM HOADON HD WHERE HD.MaHD = @ma_HD );
	SET @tong_tien = (SELECT TOP 1 HD.TongHD FROM HOADON HD WHERE HD.MaHD = @ma_HD);
	IF @ma_kh IS NULL
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END
	
	INSERT INTO THANH_TOAN_ATM(MaHD, STK)
	VALUES (@ma_HD, @so_tk);

	UPDATE KHACHHANG
	SET SoTienDaDung += @tong_tien, DiemTichLuy += (@tong_tien / 10);

	UPDATE HOADON
	SET MaHD = @ma_HD;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH
GO

CREATE PROC thanh_toan_HOADON_tien_mat @ma_HD INT, @cash DECIMAL(15, 2)
AS
BEGIN TRANSACTION
BEGIN TRY
	DECLARE @tong_tien DECIMAL(15, 2);
	SET @tong_tien = (SELECT TOP 1 TongHD FROM HOADON HD WHERE HD.MaHD = @ma_HD);
	
	IF @tong_tien IS NULL
		BEGIN
			ROLLBACK TRANSACTION;
			RETURN;
		END

	INSERT INTO THANH_TOAN_TIEN_MAT(MaHD, SoTienTraLai)
	VALUES (@ma_HD, @cash - @tong_tien);

	UPDATE KHACHHANG
	SET SoTienDaDung += @tong_tien, DiemTichLuy += (@tong_tien / 10);

	UPDATE HOADON
	SET MaHD = @ma_HD;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH
GO


CREATE PROC them_san_pham_vao_gio_hang @ma_kh CHAR(10), @ma_sp CHAR(10), @so_luong_them INT
AS
BEGIN TRANSACTION
BEGIN TRY
	DECLARE @so_luong_hien_tai INT;
	SET @so_luong_hien_tai = (SELECT SoLuongGioHang
								FROM GIO_HANG gh
								WHERE gh.MaKH = @ma_kh AND gh.MaSP = @ma_sp);

	UPDATE SANPHAM
	SET SoLuongTonKho -= @so_luong_them
	WHERE MaSP = @ma_sp;

	IF @so_luong_hien_tai IS NULL
		BEGIN
			INSERT INTO GIO_HANG(MaKH, MaSP, SoLuongGioHang)
			VALUES (@ma_kh, @ma_sp, @so_luong_them);
		END
	ELSE
		BEGIN
			DECLARE @so_luong_moi INT;
			SET @so_luong_moi = @so_luong_hien_tai + @so_luong_them;
			IF @so_luong_moi <= 0
				BEGIN
					DELETE FROM GIO_HANG
					WHERE MaKH = @ma_kh AND MaSP = @ma_sp;
				END
			ELSE
				BEGIN
					UPDATE GIO_HANG
					SET SoLuongGioHang += @so_luong_them
					WHERE MaKH = @ma_kh AND MaSP = @ma_sp;
				END
		END
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH
GO
