USE [QLDSV_HTC]
GO

/****** Object:  StoredProcedure [dbo].[SP_CHECK_LTC]    Script Date: 5/23/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_CHECK_LTC]
@NIENKHOA NCHAR(9), @MAMH NCHAR(10), @NHOM INT, @HOCKY INT
AS
BEGIN
	IF EXISTS(SELECT MALTC FROM LOPTINCHI WHERE NIENKHOA = @NIENKHOA AND MAMH = @MAMH AND NHOM = @NHOM AND HOCKY = @HOCKY)
		SELECT KT = 1
	ELSE
		IF EXISTS(SELECT MALTC FROM LINK0.QLDSV_HTC.DBO.LOPTINCHI WHERE NIENKHOA = @NIENKHOA AND MAMH = @MAMH AND NHOM = @NHOM AND HOCKY = @HOCKY)
			SELECT KT = 1
		ELSE
			SELECT KT = 0
END
GO

