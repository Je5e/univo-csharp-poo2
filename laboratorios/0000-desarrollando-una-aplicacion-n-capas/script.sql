USE [master]
GO
/****** Object:  Database [NWind]    Script Date: 12/1/2021 7:38:46 AM ******/
CREATE DATABASE [NWind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NWind', FILENAME = N'C:\Users\jesea\NWind.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NWind_log', FILENAME = N'C:\Users\jesea\NWind_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NWind] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NWind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NWind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NWind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NWind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NWind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NWind] SET ARITHABORT OFF 
GO
ALTER DATABASE [NWind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NWind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NWind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NWind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NWind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NWind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NWind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NWind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NWind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NWind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NWind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NWind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NWind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NWind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NWind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NWind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NWind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NWind] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NWind] SET  MULTI_USER 
GO
ALTER DATABASE [NWind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NWind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NWind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NWind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NWind] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NWind] SET QUERY_STORE = OFF
GO
USE [NWind]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NWind]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/1/2021 7:38:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/1/2021 7:38:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UnitPrice] [decimal](9, 2) NOT NULL,
	[UnitsInStock] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [NWind] SET  READ_WRITE 
GO
