USE [master]
GO
/****** Object:  Database [ProiectAsociatie]    Script Date: 3/8/2020 4:42:03 PM ******/
CREATE DATABASE [ProiectAsociatie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProiectAsociatie', FILENAME = N'C:\Users\Lenovo\ProiectAsociatie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProiectAsociatie_log', FILENAME = N'C:\Users\Lenovo\ProiectAsociatie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProiectAsociatie] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProiectAsociatie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProiectAsociatie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProiectAsociatie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProiectAsociatie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProiectAsociatie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProiectAsociatie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProiectAsociatie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProiectAsociatie] SET  MULTI_USER 
GO
ALTER DATABASE [ProiectAsociatie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProiectAsociatie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProiectAsociatie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProiectAsociatie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProiectAsociatie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProiectAsociatie] SET QUERY_STORE = OFF
GO
USE [ProiectAsociatie]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProiectAsociatie]
GO
/****** Object:  Table [dbo].[apartment]    Script Date: 3/8/2020 4:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apartment_number] [int] NOT NULL,
	[user_id] [int] NULL,
	[building_id] [int] NOT NULL,
 CONSTRAINT [PK_apartment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[building]    Script Date: 3/8/2020 4:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[building](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[building_number] [int] NOT NULL,
 CONSTRAINT [PK_building] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 3/8/2020 4:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_number] [nvarchar](50) NOT NULL,
	[apartment_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[due_date] [datetime2](7) NULL,
	[pay_date] [datetime2](7) NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/8/2020 4:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[user_type] [int] NOT NULL,
	[password] [nvarchar](50) NULL,
	[mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 3/8/2020 4:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[id] [int] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[apartment]  WITH CHECK ADD  CONSTRAINT [FK_apartment_building_id] FOREIGN KEY([building_id])
REFERENCES [dbo].[building] ([id])
GO
ALTER TABLE [dbo].[apartment] CHECK CONSTRAINT [FK_apartment_building_id]
GO
ALTER TABLE [dbo].[apartment]  WITH CHECK ADD  CONSTRAINT [FK_apartment_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[apartment] CHECK CONSTRAINT [FK_apartment_user_id]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_apartment_id] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[apartment] ([id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_apartment_id]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_type_id] FOREIGN KEY([user_type])
REFERENCES [dbo].[user_type] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_type_id]
GO
USE [master]
GO
ALTER DATABASE [ProiectAsociatie] SET  READ_WRITE 
GO
