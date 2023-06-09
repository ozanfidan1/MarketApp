USE [master]
GO
/****** Object:  Database [market]    Script Date: 20.03.2023 13:31:05 ******/
CREATE DATABASE [market]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'market', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\market.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'market_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\market_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [market] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [market].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [market] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [market] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [market] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [market] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [market] SET ARITHABORT OFF 
GO
ALTER DATABASE [market] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [market] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [market] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [market] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [market] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [market] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [market] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [market] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [market] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [market] SET  DISABLE_BROKER 
GO
ALTER DATABASE [market] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [market] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [market] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [market] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [market] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [market] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [market] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [market] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [market] SET  MULTI_USER 
GO
ALTER DATABASE [market] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [market] SET DB_CHAINING OFF 
GO
ALTER DATABASE [market] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [market] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [market] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [market] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [market] SET QUERY_STORE = OFF
GO
USE [market]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20.03.2023 13:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20.03.2023 13:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [uniqueidentifier] NOT NULL,
	[SubcategoryID] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Price] [money] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategories]    Script Date: 20.03.2023 13:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategories](
	[id] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Subcategories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'932df56c-2fe5-45ee-b811-045060f68b81', N'Süt, Kahvaltılık', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Et, Tavuk, Balık', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'8efb1671-2167-4207-9def-402f2b8c20da', N'Temizlik Ürünleri', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'45e1549e-054c-4393-bdbe-605b94bd7489', N'Temel Gıda, Atıştırmalık', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'367ca6ee-a096-4364-a117-84ee0bec5580', N'Meyve, Sebze', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'a3476fd4-0e8b-4c3b-925a-88295d4cd78f', N'Elektronik Eşya', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'64acac4a-ccb7-42ec-b7b2-9afda09d534d', N'Ev, Yaşam, Eğlence', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'e54e2e08-7b7d-4eaf-b315-bdd2963215ea', N'Bebek Dünyası', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'İçecekler', NULL)
INSERT [dbo].[Categories] ([id], [Name], [Description]) VALUES (N'c6bcd827-f5ca-4f97-8b4b-d0456de664c5', N'Kişisel Bakım, Kozmetik', NULL)
GO
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'ddfd7360-a1db-48b7-88ab-0b41b635295b', N'2b5c6a65-d565-43c7-b6cc-e521ce465ac3', N'Tulum Peyniri', NULL, 200.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'f396121e-e6ca-46f0-9f1a-2a5847bd9832', N'c38b5a80-2088-4d1d-9ede-666a4d00d2c5', N'Meyve Suyu', N'250 ml teneke', 11.0000, 1, N'tane', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'2cb3e357-6089-4a89-b304-446c8fdfba19', N'c49e4a00-131f-4b6d-9c17-72d5de57e45f', N'Siyah Zeytin', NULL, 90.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'17bb2203-c9dc-4f18-b951-4fa1b5bb1d38', N'2b5c6a65-d565-43c7-b6cc-e521ce465ac3', N'Beyaz Peynir', NULL, 170.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'ffd5192f-e55d-437a-b25e-519648edc3a1', N'c49e4a00-131f-4b6d-9c17-72d5de57e45f', N'Yeşil Zeytin', NULL, 70.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'62dd1ee0-5ad7-4268-8678-5d86370d8474', N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'Schnitzel', NULL, 26.0000, 300, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'a43b0357-26dc-4a93-a0ec-5fec5fa9a9fb', N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'Nugget', NULL, 30.0000, 300, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'c7c7add1-96b5-46b1-b38e-62f81c0e3af0', N'213cf625-e43e-46ea-801e-19917a825fd0', N'Sosis', NULL, 30.0000, 450, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'81d0eaac-5cb9-4a90-9124-7d039cb6ac14', N'c399d369-891a-45c6-a0c8-22f074561668', N'Külbastı', NULL, 50.0000, 500, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'6a79b42d-a47e-405c-a817-7e9725323059', N'099ab698-3b2c-4eca-9fa0-df0f853a5ddb', N'Pastırma', NULL, 70.0000, 100, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'4b945c5d-42a2-4650-bd3c-96e8988f0f66', N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'But', NULL, 50.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'69690cc6-6657-4fea-b8f1-b0ed767e6935', N'213cf625-e43e-46ea-801e-19917a825fd0', N'Salam', NULL, 12.0000, 250, N'gram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'8c2df35f-79e7-408a-98b1-b65ce801d014', N'79774388-40d5-4bc4-978e-a8124bd595c1', N'Soğuk Kahve', N'250 ml kutu', 21.0000, 1, N'tane', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'bbdc6c43-a5d2-4e3f-86e5-b959fb59de58', N'f2323521-a74f-4b63-90de-c6e7fd5cd9b1', N'Meyveli Gazoz', N'1 litre şişe', 17.0000, 1, N'tane', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'86141ad1-2edc-4a63-81d7-bc9febf1a9e4', N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'Baget', NULL, 60.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'7c653701-72ba-4c9b-942a-c1016864ff6a', N'f636ba9c-028f-4f37-b72f-56133909b493', N'Su', N'6x1 litre', 35.0000, 1, N'paket', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'd00b4095-6647-4a22-bec9-e653b548be94', N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'Bonfile', NULL, 100.0000, 1, N'kilogram', 0)
INSERT [dbo].[Products] ([id], [SubcategoryID], [Name], [Description], [Price], [Quantity], [Unit], [Deleted]) VALUES (N'4d78bb0c-e3f4-4637-8ea3-f5d2ff7dbf0f', N'8454fb1c-2f97-48a3-b610-b1ca3b8320db', N'Enerji İçeceği', N'4x250 ml kutu', 75.0000, 1, N'paket', 0)
GO
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'c9802070-6ff9-4827-93a5-0b8a43fdaac1', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Kuzu Eti', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'b27a13e7-f6f8-43cc-beef-10d49da3691b', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Yoğurt', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'213cf625-e43e-46ea-801e-19917a825fd0', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Et Şarküteri', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'69ff8d8a-20c7-4537-b4d9-2143bd94ae48', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Balık', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'c399d369-891a-45c6-a0c8-22f074561668', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Hindi', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'47dc07c2-0830-4653-a2c8-47509b22ffa7', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Maden Suyu', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'1f110127-1f7d-4385-b0eb-5177ce5f17ed', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Kahvaltılıklar', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'fe4724ec-2a41-4d4c-bc71-53e054a24b5a', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Süt', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'f636ba9c-028f-4f37-b72f-56133909b493', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Su', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'c38b5a80-2088-4d1d-9ede-666a4d00d2c5', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Gazsız İçecekler', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'c49e4a00-131f-4b6d-9c17-72d5de57e45f', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Zeytin', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'd0f74c91-58de-4fea-b338-7f417854abfa', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Yumurta', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'b74da45a-19ce-4979-9054-a1fbaefa1c88', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Tereyağ', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'79774388-40d5-4bc4-978e-a8124bd595c1', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Kahve', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'8454fb1c-2f97-48a3-b610-b1ca3b8320db', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Enerji İçecekleri', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'f2323521-a74f-4b63-90de-c6e7fd5cd9b1', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Gazlı İçecekler', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'fa5571eb-2dfb-418f-8587-dae0d9ba228e', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Sakatat', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'099ab698-3b2c-4eca-9fa0-df0f853a5ddb', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Dana Eti', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'2b5c6a65-d565-43c7-b6cc-e521ce465ac3', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Peynir', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'295428d8-a1cb-4359-9676-eb3ca91c95c2', N'22b9806a-8e7c-4ab2-a2e5-1ea103a8af96', N'Tavuk', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'664fb381-4705-42ea-bfbb-f147dcc01859', N'932df56c-2fe5-45ee-b811-045060f68b81', N'Margarin', NULL)
INSERT [dbo].[Subcategories] ([id], [CategoryID], [Name], [Description]) VALUES (N'73e69548-bf47-461d-9ddd-f4db31c7aeb9', N'fbd2814a-414d-4fd4-88ab-cb9f4c5a682b', N'Çay', NULL)
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Subcategories] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[Subcategories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Subcategories]
GO
ALTER TABLE [dbo].[Subcategories]  WITH CHECK ADD  CONSTRAINT [FK_Subcategories_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Subcategories] CHECK CONSTRAINT [FK_Subcategories_Categories]
GO
USE [master]
GO
ALTER DATABASE [market] SET  READ_WRITE 
GO
