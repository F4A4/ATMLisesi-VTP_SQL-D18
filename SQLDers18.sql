USE [EczaneTakip]
GO
/****** Object:  Trigger [dbo].[trgDoktorYedegiAl]    Script Date: 01.04.2013 15:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Fatma Altay>
-- Create date: <Create Date,,2013-04-01>
-- Description:	<Description,,Doktor tablosundaki bilgileri yedeklemek ve üzerinde işlemler yapmak için kullanılır>
-- =============================================
ALTER TRIGGER [dbo].[trgDoktorYedegiAl]
   ON  [dbo].[Doktorlar]
   FOR DELETE
   
AS 
BEGIN
       --
	   --
       DECLARE @ID int
	   DECLARE @Ad nvarchar(50)
	   DECLARE @Soyad nvarchar(50)
	   DECLARE @DrKodu char(6)
	   DECLARE @KurumID int

	   SELECT @ID=ID,@Ad=Ad,@Soyad=Soyad,@DrKodu=DrKodu,@KurumID=KurumID from inserted
	   insert into tblDoktorlarYedek
	   values (@Ad,@Soyad,@DrKodu,@KurumID)
END
insert into Doktorlar values('Ayse','Gül','2334','15')