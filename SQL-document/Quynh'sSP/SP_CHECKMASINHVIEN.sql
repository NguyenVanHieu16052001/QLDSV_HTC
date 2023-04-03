USE [QLDSV_HTC]
GO

/****** Object:  StoredProcedure [dbo].[SP_CHECKMASINHVIEN]    Script Date: 5/23/2022 6:19:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_CHECKMASINHVIEN] 
@MSV NCHAR(10)
AS
BEGIN
	IF EXISTS(SELECT MASV FROM DBO.SINHVIEN WHERE MASV = @MSV)
	BEGIN
		SELECT 'SV' = 1 
	END
ELSE
IF EXISTS(SELECT MASV FROM LINK0.QLDSV_HTC.DBO.SINHVIEN WHERE MASV = @MSV)
	BEGIN
		SELECT 'SV' = 2
	END
ELSE
	SELECT 'SV' = 0
END
GO


