USE [master]
GO
/****** Object:  Database [ecom]    Script Date: 3/1/2021 11:41:10 PM ******/
CREATE DATABASE [ecom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\ecom.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\ecom_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecom] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecom] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecom] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecom] SET RECOVERY FULL 
GO
ALTER DATABASE [ecom] SET  MULTI_USER 
GO
ALTER DATABASE [ecom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecom] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ecom] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecom', N'ON'
GO
USE [ecom]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Users_ID] [int] NOT NULL,
	[Product_Name] [varchar](50) NULL,
	[Product_Category] [varchar](50) NULL,
	[Created_Date] [datetime2](7) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Users_Name] [varchar](50) NOT NULL,
	[Updated_Date] [datetime2](7) NOT NULL,
	[ProdID] [int] NOT NULL,
	[CatID] [int] NOT NULL,
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Cat_Name] [varchar](50) NOT NULL,
	[Cat_Desc] [varchar](50) NULL,
	[Cat_ParentID] [int] NULL,
	[Cat_isDeleted] [int] NULL,
	[Cat_Create_Date] [datetime2](7) NOT NULL,
	[Cat_Update_Date] [datetime2](7) NOT NULL,
	[Cat_Updated_By] [varchar](50) NULL,
	[Cat_Img] [varchar](50) NULL,
	[CatID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Img_Name] [varchar](50) NOT NULL,
	[Img_Desc] [varchar](50) NULL,
	[Img_Updated_By] [varchar](50) NULL,
	[Img_Path] [varchar](50) NOT NULL,
	[Img_Type] [varchar](10) NOT NULL,
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[P_Name] [varchar](50) NULL,
	[P_Desc] [varchar](50) NULL,
	[P_Category] [varchar](50) NULL,
	[P_Img] [varchar](50) NULL,
	[ProdID] [int] IDENTITY(1,1) NOT NULL,
	[P_Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[U_Name] [varchar](50) NOT NULL,
	[U_address] [varchar](50) NULL,
	[U_Permanent_Addr] [varchar](100) NOT NULL,
	[U_DoB] [datetime] NOT NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[cartView]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cartView] as
select Users_Name, Product_Name, Product_Category, Updated_Date, Quantity, Amount
from Cart
GO
/****** Object:  View [dbo].[productsAndCategoryView]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[productsAndCategoryView] with schemabinding as
select P.P_Name as Product_Name, P.P_Desc as Product_Desc, C.Cat_Name as Category_Name, C.Cat_Desc as Category_Desc
from dbo.Products P inner join dbo.Categories C
on P.P_Category = C.Cat_Name
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [indx_productsAndCategoryView]    Script Date: 3/1/2021 11:41:10 PM ******/
CREATE UNIQUE CLUSTERED INDEX [indx_productsAndCategoryView] ON [dbo].[productsAndCategoryView]
(
	[Product_Name] ASC,
	[Category_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addToCart]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addToCart] (@userID int, @productID int, @quantity int) as
begin
	if(exists (select * from Cart where Users_ID = @userID and ProdID = @productID))
	begin
		update Cart
		set Quantity = Quantity + @quantity, Updated_Date = GETDATE()
		where Users_ID = @userID and ProdID = @productID
	end
	
	else
	begin
		insert into Cart (Users_ID, Users_Name, Product_Name, ProdID, Product_Category, Created_Date, Quantity, CatID, Updated_Date)
		select U.UserID, U.U_Name, P.P_Name, P.ProdID, P.P_Category, GETDATE(), @quantity, C.CatID, GETDATE()
		from Users U, Products P, Categories C
		where U.UserID = @userID and P.ProdID = @productID and P.P_Category = C.Cat_Name
	end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteFromCart]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteFromCart](@userID int, @productID int) as
begin
	delete from Cart where Users_ID = @userID and ProdID = @productID 
end
GO
/****** Object:  StoredProcedure [dbo].[getProductsByCategory]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getProductsByCategory] (@categoryName varchar(50)) as
begin 
	select * from products where p_category = @categoryName
end
GO
/****** Object:  StoredProcedure [dbo].[getTotalAmount]    Script Date: 3/1/2021 11:41:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTotalAmount](@userID int) as
begin
	select Users_Name, sum(Amount) as Total_Amount 
	from Cart
	where Users_ID = @userID
	group by Users_Name
end
GO
USE [master]
GO
ALTER DATABASE [ecom] SET  READ_WRITE 
GO
