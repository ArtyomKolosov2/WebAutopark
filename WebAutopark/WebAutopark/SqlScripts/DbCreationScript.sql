﻿USE [master]
GO

/****** Object:  Database [WebAutopark]    Script Date: 2/20/2021 7:41:22 PM ******/
CREATE DATABASE [WebAutopark]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebAutopark', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebAutopark.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebAutopark_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebAutopark_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAutopark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [WebAutopark] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [WebAutopark] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [WebAutopark] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [WebAutopark] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [WebAutopark] SET ARITHABORT OFF 
GO

ALTER DATABASE [WebAutopark] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [WebAutopark] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [WebAutopark] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [WebAutopark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [WebAutopark] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [WebAutopark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [WebAutopark] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [WebAutopark] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [WebAutopark] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [WebAutopark] SET  DISABLE_BROKER 
GO

ALTER DATABASE [WebAutopark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [WebAutopark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [WebAutopark] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [WebAutopark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [WebAutopark] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [WebAutopark] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [WebAutopark] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [WebAutopark] SET RECOVERY FULL 
GO

ALTER DATABASE [WebAutopark] SET  MULTI_USER 
GO

ALTER DATABASE [WebAutopark] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [WebAutopark] SET DB_CHAINING OFF 
GO

ALTER DATABASE [WebAutopark] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [WebAutopark] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [WebAutopark] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [WebAutopark] SET QUERY_STORE = OFF
GO

ALTER DATABASE [WebAutopark] SET  READ_WRITE 
GO

USE [WebAutopark]
GO

/****** Object:  Table [dbo].[Vehicles]    Script Date: 2/20/2021 7:43:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vehicles](
	[Id] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](20) NOT NULL,
	[Weight] [int] NOT NULL,
	[ManufactureYear] [int] NOT NULL,
	[Mileage] [int] NOT NULL,
	[CarColor] [nvarchar](50) NOT NULL,
	[FuelTankAmount] [int] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [WebAutopark]
GO

/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 2/20/2021 7:44:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VehicleTypes](
	[Id] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[TaxCoeff] [real] NOT NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [WebAutopark]
GO

/****** Object:  Table [dbo].[VehicleParts]    Script Date: 2/20/2021 7:45:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VehicleParts](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [WebAutopark]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 2/20/2021 7:45:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [WebAutopark]
GO

/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/20/2021 7:45:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[DetailId] [int] NOT NULL,
	[DetailAmount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



