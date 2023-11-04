USE [master]
GO
/****** Object:  Database [PRUEBADGS]    Script Date: 4/11/2023 02:23:39 ******/
CREATE DATABASE [PRUEBADGS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRUEBADGS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRUEBADGS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRUEBADGS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRUEBADGS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRUEBADGS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRUEBADGS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRUEBADGS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRUEBADGS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRUEBADGS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRUEBADGS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRUEBADGS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRUEBADGS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRUEBADGS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRUEBADGS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRUEBADGS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRUEBADGS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRUEBADGS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRUEBADGS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRUEBADGS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRUEBADGS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRUEBADGS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRUEBADGS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRUEBADGS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRUEBADGS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRUEBADGS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRUEBADGS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRUEBADGS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRUEBADGS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRUEBADGS] SET RECOVERY FULL 
GO
ALTER DATABASE [PRUEBADGS] SET  MULTI_USER 
GO
ALTER DATABASE [PRUEBADGS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRUEBADGS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRUEBADGS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRUEBADGS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRUEBADGS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRUEBADGS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRUEBADGS', N'ON'
GO
ALTER DATABASE [PRUEBADGS] SET QUERY_STORE = OFF
GO
USE [PRUEBADGS]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[CATEGORYID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORYNAME] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[CATEGORYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTS]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTS](
	[CLIENTID] [int] IDENTITY(1,1) NOT NULL,
	[CLIENTNAME] [nvarchar](50) NULL,
	[COMPANYNAME] [nvarchar](50) NULL,
	[CLIENTTYPE] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED 
(
	[CLIENTID] ASC,
	[CLIENTTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTTYPE]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTTYPE](
	[CLIENTTYPEID] [int] IDENTITY(1,1) NOT NULL,
	[CLIENTTYPENAME] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CLIENTTYPEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[PRODUCTID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCTNAME] [varchar](80) NOT NULL,
	[CATEGORYID] [int] NOT NULL,
	[PROVEEDORID] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[PRODUCTID] ASC,
	[CATEGORYID] ASC,
	[PROVEEDORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[PROVEEDORID] [int] IDENTITY(1,1) NOT NULL,
	[PROVEEDORNAME] [varchar](50) NULL,
 CONSTRAINT [PK_PROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[PROVEEDORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALES]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CLIENTID] [int] NOT NULL,
	[SALESDATE] [date] NOT NULL,
	[SALESTOTAL] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALESDETAIL]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESDETAIL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SALEID] [int] NOT NULL,
	[PRODUCTID] [int] NOT NULL,
	[CATEGORYID] [int] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[PRICE] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLIENTS]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_SALES] FOREIGN KEY([CLIENTID])
REFERENCES [dbo].[SALES] ([ID])
GO
ALTER TABLE [dbo].[CLIENTS] CHECK CONSTRAINT [FK_CLIENTS_SALES]
GO
ALTER TABLE [dbo].[SALESDETAIL]  WITH CHECK ADD FOREIGN KEY([SALEID])
REFERENCES [dbo].[SALES] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[sp_catalogo_productos]    Script Date: 4/11/2023 02:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_catalogo_productos]
@categoryId int
AS
BEGIN
    SELECT
        *
    FROM Products
    WHERE CategoryId = @categoryId
END
GO
USE [master]
GO
ALTER DATABASE [PRUEBADGS] SET  READ_WRITE 
GO
