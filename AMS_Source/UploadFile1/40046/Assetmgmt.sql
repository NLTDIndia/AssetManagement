USE [master]
GO
/****** Object:  Database [AMS1]    Script Date: 31-07-2018 18:53:01 ******/
CREATE DATABASE [AMS1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AMS1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16\MSSQL\DATA\AMS1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AMS1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16\MSSQL\DATA\AMS1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AMS1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AMS1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AMS1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AMS1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AMS1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AMS1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AMS1] SET ARITHABORT OFF 
GO
ALTER DATABASE [AMS1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AMS1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AMS1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AMS1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AMS1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AMS1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AMS1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AMS1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AMS1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AMS1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AMS1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AMS1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AMS1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AMS1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AMS1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AMS1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AMS1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AMS1] SET RECOVERY FULL 
GO
ALTER DATABASE [AMS1] SET  MULTI_USER 
GO
ALTER DATABASE [AMS1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AMS1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AMS1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AMS1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AMS1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AMS1] SET QUERY_STORE = OFF
GO
USE [AMS1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AMS1]
GO
/****** Object:  Table [dbo].[AssetAllocation]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetAllocation](
	[AssetAllocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetId] [bigint] NULL,
	[LocationId] [bigint] NULL,
	[EmployeeId] [bigint] NULL,
	[AssetAllocatedOn] [datetime] NOT NULL,
	[AssetCanceledOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetAlloc] PRIMARY KEY CLUSTERED 
(
	[AssetAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetCategory]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRequest]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTypeId] [bigint] NULL,
	[LocationId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[AssetQuotationId] [bigint] NULL,
	[PONumber] [nvarchar](50) NULL,
	[ARNumber] [nvarchar](500) NULL,
	[AssetStatusId] [bigint] NULL,
	[Quantity] [bigint] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetReq__3214EC073311C5D0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTagNumber] [nvarchar](255) NULL,
	[AssetRequestId] [bigint] NULL,
	[Price] [bigint] NULL,
	[PurchaseOrderOn] [datetime] NOT NULL,
	[ServiceTagNumber] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__Assets] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2000) NOT NULL,
	[AssetCategoryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UnallocatedAsset]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[UnallocatedAsset] AS
select ast.*, ats.Name AssetType, ac.Name AssetCategory from
(
select a.AssetId, a.AssetTagNumber, a.ServiceTagNumber, a.AssetRequestId from assets a where assetid not in (select assetid from AssetAllocation)
union all
select a.AssetId, a.AssetTagNumber, a.ServiceTagNumber, a.AssetRequestId from AssetAllocation aa
inner join assets a on aa.AssetId = a.AssetId
where AssetAllocatedOn is not null and AssetCanceledOn is not null
group by a.AssetId, a.AssetTagNumber, a.ServiceTagNumber, a.AssetRequestId
)ast
inner join AssetRequest ar on ast.AssetRequestId = ar.Id
inner join AssetType ats on ar.AssetTypeId = ats.Id
inner join AssetCategory ac on ats.AssetCategoryId = ac.Id
GO
/****** Object:  Table [dbo].[AssetLocation]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetLocation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](550) NOT NULL,
	[Address] [nvarchar](2000) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetLoc__3214EC0798A4E16E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [nvarchar](50) NULL,
	[LoginId] [nvarchar](50) NULL,
	[OfficeId] [bigint] NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[AvatarUrl] [nvarchar](500) NULL,
	[ReportingToId] [bigint] NULL,
	[OfficeHolidayId] [bigint] NULL,
	[EmployeeRoleId] [bigint] NULL,
	[IsHandleMembers] [bit] NULL,
	[IsInProbationaryPeriod] [bit] NULL,
	[CanAvailYearlyLeave] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ShiftID] [int] NULL,
	[CardID] [bigint] NULL,
	[DOJ] [datetime] NULL,
	[ConfirmationDate] [datetime] NULL,
	[RelievingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AvailableAsset]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[AvailableAsset] as
select a.AssetId,a.AssetTagNumber, ats.Name as AssetType, ac.Name as AssetCategory
, e.FirstName, al.Name as [Location], al.Id locationId,e.UserId empId
,aa.AssetAllocationId from assets a
inner join AssetAllocation aa on a.AssetId=aa.AssetId
inner join AssetRequest ar on a.AssetRequestId = ar.Id
inner join AssetType ats on ar.AssetTypeId = ats.Id
inner join AssetCategory ac on ats.AssetCategoryId = ac.Id
inner join Employee e on aa.EmployeeId =e.UserId
inner join AssetLocation al on aa.LocationId =al.Id
where aa.AssetCanceledOn is null
group by a.AssetId,aa.AssetAllocationId, a.AssetTagNumber, ats.Name, ac.Name , e.FirstName, al.Name , al.Id,e.UserId
GO
/****** Object:  Table [dbo].[AssetDocuments]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[AlterFileName] [nvarchar](max) NULL,
	[Entity] [nvarchar](500) NULL,
	[EntityId] [bigint] NULL,
	[FilePath] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetPaymentMode]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetPaymentMode](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetQuotation]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetQuotation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetRequestId] [bigint] NULL,
	[AssetVendorId] [bigint] NULL,
	[Price] [money] NULL,
	[Quantity] [bigint] NULL,
	[Comments] [nvarchar](max) NULL,
	[Documents] [nvarchar](2000) NULL,
	[CGST] [nvarchar](50) NULL,
	[SGST] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetQuo__3214EC078C6A97C4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetQuoteApprovals]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetQuoteApprovals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetQuotationId] [bigint] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedOn] [datetime] NULL,
	[IsAwaitingNextApproval] [bit] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRequestPayments]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetRequestPayments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetRequestId] [bigint] NULL,
	[PaymentModeId] [bigint] NULL,
	[BaseAmount] [money] NULL,
	[Tax] [int] NULL,
	[Amount] [nvarchar](2000) NULL,
	[CurrentDate] [datetime] NULL,
	[CreditCardNo] [nvarchar](20) NULL,
	[CreditCardOwner] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](25) NULL,
	[ChequeDate] [datetime] NULL,
	[ChequeBankName] [nvarchar](2000) NULL,
	[ChequeBranch] [nvarchar](2000) NULL,
	[DC_TransactionIdentifier] [nvarchar](max) NULL,
	[DC_Transferer] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetReq__3214EC072B40DE68] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRequestSpecification]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetRequestSpecification](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetRequestId] [bigint] NULL,
	[AssetTypeSpecId] [bigint] NULL,
	[AssetTypeSpecValue] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSpecification]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetSpecification](
	[AssetSpecId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetId] [bigint] NULL,
	[AssetTypeId] [bigint] NULL,
	[AssetTypeSpecId] [bigint] NULL,
	[AssetTypeSpecValue] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetSpec] PRIMARY KEY CLUSTERED 
(
	[AssetSpecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetStatus]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTypeSpecification]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetTypeSpecification](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTypeId] [bigint] NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[ValueType] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetVendors]    Script Date: 31-07-2018 18:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetVendors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2000) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[Area] [nvarchar](3000) NULL,
	[City] [nvarchar](2000) NULL,
	[Pincode] [nvarchar](10) NULL,
	[State] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[FaxNo] [nvarchar](20) NULL,
	[LandLineNo] [nvarchar](25) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetVen__3214EC07EB6A3860] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssetAllocation] ON 

INSERT [dbo].[AssetAllocation] ([AssetAllocationId], [AssetId], [LocationId], [EmployeeId], [AssetAllocatedOn], [AssetCanceledOn], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (35, 2, 5, 1, CAST(N'2018-07-26T00:00:00.000' AS DateTime), NULL, CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AssetAllocation] ([AssetAllocationId], [AssetId], [LocationId], [EmployeeId], [AssetAllocatedOn], [AssetCanceledOn], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (36, 3, 5, 1, CAST(N'2018-07-26T00:00:00.000' AS DateTime), NULL, CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AssetAllocation] ([AssetAllocationId], [AssetId], [LocationId], [EmployeeId], [AssetAllocatedOn], [AssetCanceledOn], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (37, 4, 5, 1, CAST(N'2018-07-26T00:00:00.000' AS DateTime), CAST(N'2018-07-26T15:47:59.897' AS DateTime), CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AssetAllocation] ([AssetAllocationId], [AssetId], [LocationId], [EmployeeId], [AssetAllocatedOn], [AssetCanceledOn], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (38, 5, 5, 1, CAST(N'2018-07-26T00:00:00.000' AS DateTime), CAST(N'2018-07-31T10:54:16.083' AS DateTime), CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AssetAllocation] ([AssetAllocationId], [AssetId], [LocationId], [EmployeeId], [AssetAllocatedOn], [AssetCanceledOn], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (39, 7, 5, 2, CAST(N'2018-07-26T00:00:00.000' AS DateTime), CAST(N'2018-07-26T16:10:28.007' AS DateTime), CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AssetAllocation] OFF
SET IDENTITY_INSERT [dbo].[AssetCategory] ON 

INSERT [dbo].[AssetCategory] ([Id], [Name], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, N'Hardware', 1, CAST(N'2018-06-20T17:34:09.297' AS DateTime), 1, CAST(N'2018-07-07T11:37:54.647' AS DateTime), 1)
INSERT [dbo].[AssetCategory] ([Id], [Name], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, N'Software', 1, CAST(N'2018-06-22T11:12:18.910' AS DateTime), 1, CAST(N'2018-06-22T11:12:18.910' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetCategory] OFF
SET IDENTITY_INSERT [dbo].[AssetLocation] ON 

INSERT [dbo].[AssetLocation] ([Id], [Name], [Address], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, N'Futura Tech Park', N'334, OMR, Futura Tech Park, Block B, 1st Floor, Chennai, Sholinganallur, Chennai, Tamil Nadu 600119', 1, CAST(N'2018-06-19T17:56:34.787' AS DateTime), 1, CAST(N'2018-06-19T17:56:34.343' AS DateTime), 1)
INSERT [dbo].[AssetLocation] ([Id], [Name], [Address], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (8, N'Tek Meadows', N'3rd Floor, Tower C, Tek Meadows, No: 51, OMR, Sholinganallur, Chennai, Tamil Nadu 600119', 1, CAST(N'2018-06-22T11:11:35.797' AS DateTime), 1, CAST(N'2018-06-22T11:11:35.797' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetLocation] OFF
SET IDENTITY_INSERT [dbo].[AssetPaymentMode] ON 

INSERT [dbo].[AssetPaymentMode] ([Id], [Name], [IsActive]) VALUES (1, N'Cheque', 1)
INSERT [dbo].[AssetPaymentMode] ([Id], [Name], [IsActive]) VALUES (2, N'Credit Card', 1)
INSERT [dbo].[AssetPaymentMode] ([Id], [Name], [IsActive]) VALUES (3, N'DC', 1)
SET IDENTITY_INSERT [dbo].[AssetPaymentMode] OFF
SET IDENTITY_INSERT [dbo].[AssetQuotation] ON 

INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, 2, NULL, 3200.0000, NULL, N'Test', N'Badminton_Schedule.xlsx', NULL, NULL, 1, CAST(N'2018-07-03T11:20:39.317' AS DateTime), 1, CAST(N'2018-07-03T11:20:39.620' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, 2, NULL, 32000.0000, NULL, N'Test Comments', N'Badminton_Schedule_new.xlsx', NULL, NULL, 1, CAST(N'2018-07-03T15:01:53.793' AS DateTime), 1, CAST(N'2018-07-03T15:01:53.793' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10, 5, 1, 23.0000, 0, NULL, NULL, N'23', N'2', 1, CAST(N'2018-07-08T20:56:36.537' AS DateTime), 1, CAST(N'2018-07-08T20:56:36.957' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, 15, 1, 20000.0000, 15, N'Test', NULL, N'5', N'2', 1, CAST(N'2018-07-13T15:14:30.787' AS DateTime), 1, CAST(N'2018-07-13T15:14:30.787' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (13, 17, 1, 15000.0000, 1, N'Approved', NULL, N'15', N'25', 1, CAST(N'2018-07-19T11:42:18.803' AS DateTime), 1, CAST(N'2018-07-19T11:42:18.803' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (14, 17, 4, 13000.0000, 1, N'Suggestion', NULL, N'2', N'1', 1, CAST(N'2018-07-19T11:48:10.217' AS DateTime), 1, CAST(N'2018-07-19T11:48:10.217' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (21, NULL, 1, 2.0000, 2, N'22', NULL, N'2', N'2', 1, CAST(N'2018-07-26T18:45:06.340' AS DateTime), 1, CAST(N'2018-07-26T18:45:07.613' AS DateTime), 1)
INSERT [dbo].[AssetQuotation] ([Id], [AssetRequestId], [AssetVendorId], [Price], [Quantity], [Comments], [Documents], [CGST], [SGST], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (22, 28, 1, 23.0000, 33, N'33', NULL, N'33', N'22', 1, CAST(N'2018-07-26T18:57:37.790' AS DateTime), 1, CAST(N'2018-07-26T18:57:37.790' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetQuotation] OFF
SET IDENTITY_INSERT [dbo].[AssetQuoteApprovals] ON 

INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, 1, 1, CAST(N'2018-07-04T19:15:00.057' AS DateTime), 0, N'', CAST(N'2018-07-04T19:15:01.087' AS DateTime), 1, CAST(N'2018-07-04T19:15:01.440' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, 10, 1, CAST(N'2018-07-08T23:08:33.577' AS DateTime), 1, N'sdsds', CAST(N'2018-07-08T23:08:35.203' AS DateTime), 1, CAST(N'2018-07-08T23:08:35.573' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (8, 11, 1, CAST(N'2018-07-13T15:24:37.770' AS DateTime), 0, N'Approved', CAST(N'2018-07-13T15:24:37.770' AS DateTime), 1, CAST(N'2018-07-13T15:24:37.770' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (9, 14, 1, CAST(N'2018-07-19T11:51:40.047' AS DateTime), 1, N'Test for Approval', CAST(N'2018-07-19T11:51:40.770' AS DateTime), 1, CAST(N'2018-07-19T11:51:41.127' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10, 14, 1, CAST(N'2018-07-19T15:53:21.890' AS DateTime), 0, N'', CAST(N'2018-07-19T15:53:21.890' AS DateTime), 1, CAST(N'2018-07-19T15:53:21.890' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, 14, 1, CAST(N'2018-07-19T15:54:45.940' AS DateTime), 1, N'', CAST(N'2018-07-19T15:54:45.940' AS DateTime), 1, CAST(N'2018-07-19T15:54:45.940' AS DateTime), 1)
INSERT [dbo].[AssetQuoteApprovals] ([Id], [AssetQuotationId], [ApprovedBy], [ApprovedOn], [IsAwaitingNextApproval], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10003, 13, 1, CAST(N'2018-07-27T12:04:58.243' AS DateTime), 0, N'', CAST(N'2018-07-27T12:04:58.243' AS DateTime), 1, CAST(N'2018-07-27T12:04:58.243' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetQuoteApprovals] OFF
SET IDENTITY_INSERT [dbo].[AssetRequest] ON 

INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, 1, 5, 1, NULL, NULL, NULL, 3, NULL, NULL, CAST(N'2018-06-26T19:37:22.107' AS DateTime), 1, CAST(N'2018-07-26T18:13:25.783' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, 11, 5, 1, 10, N'PO-08-07-2018 00:00:00-10', NULL, 5, NULL, NULL, CAST(N'2018-06-27T10:12:06.920' AS DateTime), 1, CAST(N'2018-07-08T23:08:31.510' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, 12, 8, 1, NULL, NULL, NULL, 3, NULL, NULL, CAST(N'2018-06-27T14:41:46.823' AS DateTime), 1, CAST(N'2018-07-26T18:18:22.120' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (7, 1, 5, 1, NULL, NULL, NULL, 3, NULL, NULL, CAST(N'2018-07-08T18:25:08.863' AS DateTime), 1, CAST(N'2018-07-26T18:56:13.883' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, 13, 5, 1, 11, N'PO-13-07-2018 00:00:00-11', NULL, 4, NULL, NULL, CAST(N'2018-07-13T15:11:26.613' AS DateTime), 1, CAST(N'2018-07-26T17:34:56.523' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (17, 13, 5, 1, 13, N'PO-27-07-2018 00:00:00-13', NULL, 4, NULL, NULL, CAST(N'2018-07-19T11:39:05.330' AS DateTime), 1, CAST(N'2018-07-27T12:04:57.870' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (18, 5, 5, 1, NULL, NULL, NULL, 3, NULL, NULL, CAST(N'2018-07-19T14:43:29.507' AS DateTime), 1, CAST(N'2018-07-26T18:44:56.053' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20, 5, 5, 1, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2018-07-19T15:42:25.240' AS DateTime), 1, CAST(N'2018-07-19T15:42:25.240' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (24, 13, 5, 1, NULL, NULL, NULL, 3, 1, N'Tested', CAST(N'2018-07-20T17:13:06.837' AS DateTime), 1, CAST(N'2018-07-26T18:07:46.367' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (25, 13, 5, 1, NULL, NULL, N'AR_25_24072018', 3, 1, N'Tested', CAST(N'2018-07-24T10:42:24.097' AS DateTime), 1, CAST(N'2018-07-26T18:37:30.297' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (27, 1, 5, 1, NULL, NULL, N'AR_26_26072018', 3, 2, N'Requisition for 2 laptops', CAST(N'2018-07-26T17:11:44.223' AS DateTime), 1, CAST(N'2018-07-26T18:11:38.963' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (28, 14, 5, 1, NULL, NULL, N'AR_28_26072018', 3, 1, N'test', CAST(N'2018-07-26T18:57:03.930' AS DateTime), 1, CAST(N'2018-07-26T18:57:37.763' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10026, 12, 8, 1, NULL, NULL, N'AR_29_27072018', 2, 1, N'test', CAST(N'2018-07-27T11:00:13.140' AS DateTime), 1, CAST(N'2018-07-27T11:00:13.140' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10027, 15, 5, 1, NULL, NULL, N'AR_10027_27072018', 2, 2, N'We need Adobe ', CAST(N'2018-07-27T12:11:02.003' AS DateTime), 1, CAST(N'2018-07-27T12:11:09.490' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10028, 15, 5, 1, NULL, NULL, N'AR_10028_27072018', 2, 1, N'', CAST(N'2018-07-27T12:11:43.203' AS DateTime), 1, CAST(N'2018-07-27T12:36:38.993' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10029, 11, 5, 0, NULL, NULL, N'AR_10029_27072018', 1, 1, N'', CAST(N'2018-07-27T12:12:44.643' AS DateTime), 1, CAST(N'2018-07-27T12:36:48.060' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10031, 13, 5, 1, NULL, NULL, N'AR_10030_27072018', 2, 1, N'', CAST(N'2018-07-27T12:14:04.627' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.627' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10032, 5, 5, 1, NULL, NULL, N'AR_10032_27072018', 2, 1, N'', CAST(N'2018-07-27T12:16:28.507' AS DateTime), 1, CAST(N'2018-07-27T12:16:28.507' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10033, 11, 5, 1, NULL, NULL, N'AR_10033_30072018', 2, 1, N'', CAST(N'2018-07-30T15:35:57.733' AS DateTime), 1, CAST(N'2018-07-30T15:35:57.733' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10034, 12, 8, 1, NULL, NULL, N'AR_10034_30072018', 2, 1, N'', CAST(N'2018-07-30T15:36:17.113' AS DateTime), 1, CAST(N'2018-07-30T15:36:20.550' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10035, 1, NULL, 0, NULL, NULL, N'AR_10035_30072018', 1, 1, N'', CAST(N'2018-07-30T16:01:27.487' AS DateTime), 1, CAST(N'2018-07-30T16:01:40.710' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10040, 1, NULL, 1, NULL, NULL, N'AR_10036_30072018', 1, 1, N'', CAST(N'2018-07-30T16:41:35.430' AS DateTime), 1, CAST(N'2018-07-30T16:41:35.430' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10041, 11, NULL, 1, NULL, NULL, N'AR_10041_30072018', 1, 1, N'', CAST(N'2018-07-30T17:47:02.360' AS DateTime), 1, CAST(N'2018-07-30T17:47:02.360' AS DateTime), 1)
INSERT [dbo].[AssetRequest] ([Id], [AssetTypeId], [LocationId], [IsActive], [AssetQuotationId], [PONumber], [ARNumber], [AssetStatusId], [Quantity], [Comments], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20033, 1, NULL, 1, NULL, NULL, N'AR_10042_31072018', 1, 1, N'', CAST(N'2018-07-31T18:23:54.237' AS DateTime), 1, CAST(N'2018-07-31T18:23:54.237' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetRequest] OFF
SET IDENTITY_INSERT [dbo].[AssetRequestPayments] ON 

INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17T11:24:15.223' AS DateTime), 1, CAST(N'2018-07-17T11:24:15.223' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10, 15, 1, 9500.0000, 500, N'10000', CAST(N'2018-07-17T11:48:09.187' AS DateTime), NULL, NULL, N'11111', CAST(N'2018-07-08T06:00:46.000' AS DateTime), N'HDFC', N'Thoraipakkam', NULL, NULL, CAST(N'2018-07-17T11:48:14.057' AS DateTime), 1, CAST(N'2018-07-17T11:48:14.453' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, 15, 2, 5000.0000, 20, N'5000', CAST(N'2018-07-17T11:48:19.997' AS DateTime), N'4444', N'suresh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17T11:48:24.220' AS DateTime), 1, CAST(N'2018-07-17T11:48:24.610' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (12, 15, 3, 2500.0000, 1500, N'4000', CAST(N'2018-07-17T11:48:31.243' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'23232323', N'Suresh', CAST(N'2018-07-17T11:48:33.967' AS DateTime), 1, CAST(N'2018-07-17T11:48:34.387' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (13, 15, 1, 18000.0000, 2000, N'20000', CAST(N'2018-07-19T12:36:08.297' AS DateTime), NULL, NULL, N'12345', CAST(N'2018-07-16T07:00:54.000' AS DateTime), N'HDFC', N'Thoriapakkam', NULL, NULL, CAST(N'2018-07-19T12:36:08.307' AS DateTime), 1, CAST(N'2018-07-19T12:36:08.310' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (14, 15, 2, 18500.0000, 1500, N'20000', CAST(N'2018-07-19T12:36:08.637' AS DateTime), N'4444', N'Ram', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-19T12:36:08.637' AS DateTime), 1, CAST(N'2018-07-19T12:36:08.637' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-26T17:30:52.667' AS DateTime), 1, CAST(N'2018-07-26T17:30:52.667' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (16, 15, 1, 20000.0000, 1000, N'0', CAST(N'2018-07-26T17:31:17.053' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'12345', N'1231232', CAST(N'2018-07-26T17:31:17.053' AS DateTime), 1, CAST(N'2018-07-26T17:31:17.053' AS DateTime), 1)
INSERT [dbo].[AssetRequestPayments] ([Id], [AssetRequestId], [PaymentModeId], [BaseAmount], [Tax], [Amount], [CurrentDate], [CreditCardNo], [CreditCardOwner], [ChequeNo], [ChequeDate], [ChequeBankName], [ChequeBranch], [DC_TransactionIdentifier], [DC_Transferer], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (17, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-26T17:34:56.510' AS DateTime), 1, CAST(N'2018-07-26T17:34:56.510' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetRequestPayments] OFF
SET IDENTITY_INSERT [dbo].[AssetRequestSpecification] ON 

INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, 2, 1, N'3', CAST(N'2018-06-26T19:37:22.130' AS DateTime), 1, CAST(N'2018-06-26T19:37:22.130' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, 2, 2, N'3', CAST(N'2018-06-26T19:37:22.193' AS DateTime), 1, CAST(N'2018-06-26T19:37:22.193' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, 5, 11, N'3', CAST(N'2018-06-27T10:12:06.950' AS DateTime), 1, CAST(N'2018-06-27T10:12:06.950' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (16, 5, 12, N'3', CAST(N'2018-06-27T10:12:06.950' AS DateTime), 1, CAST(N'2018-06-27T10:12:06.950' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (17, 5, 13, N'3', CAST(N'2018-06-27T10:12:06.967' AS DateTime), 1, CAST(N'2018-06-27T10:12:06.967' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (18, 6, 14, N'test tocuh phone', CAST(N'2018-06-27T14:41:46.923' AS DateTime), 1, CAST(N'2018-06-27T14:41:46.923' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (19, 6, 15, N'Test Normal Phone', CAST(N'2018-06-27T14:41:46.943' AS DateTime), 1, CAST(N'2018-06-27T14:41:46.943' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20, 7, 1, N'3', CAST(N'2018-07-08T18:25:09.163' AS DateTime), 1, CAST(N'2018-07-08T18:25:09.163' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (21, 7, 2, N'3', CAST(N'2018-07-08T18:25:09.263' AS DateTime), 1, CAST(N'2018-07-08T18:25:09.263' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (22, 15, 16, N'Dell', CAST(N'2018-07-13T15:11:26.670' AS DateTime), 1, CAST(N'2018-07-13T15:11:26.670' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (23, 15, 17, N'38.6 Centimeters', CAST(N'2018-07-13T15:11:26.710' AS DateTime), 1, CAST(N'2018-07-13T15:11:26.710' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (24, 15, 18, N'48.9 Centimeters', CAST(N'2018-07-13T15:11:26.763' AS DateTime), 1, CAST(N'2018-07-13T15:11:26.763' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (25, 15, 19, N'54.61 Centimeters', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (26, 15, 21, N'1920x1080', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (27, 15, 22, N'22 Watts', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (34, 17, 16, N'Dell', CAST(N'2018-07-19T11:39:05.343' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.343' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (35, 17, 17, N'12 inch', CAST(N'2018-07-19T11:39:05.357' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.357' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (36, 17, 18, N'12 inch', CAST(N'2018-07-19T11:39:05.367' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.367' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (37, 17, 19, N'1039 X 1040', CAST(N'2018-07-19T11:39:05.377' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.377' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (38, 17, 21, N'3000', CAST(N'2018-07-19T11:39:05.390' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.390' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (39, 17, 22, N'230', CAST(N'2018-07-19T11:39:05.400' AS DateTime), 1, CAST(N'2018-07-19T11:39:05.400' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (40, 18, 4, N'1 GB', CAST(N'2018-07-19T14:43:29.683' AS DateTime), 1, CAST(N'2018-07-19T14:43:29.683' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (41, 18, 5, N'Yes', CAST(N'2018-07-19T14:43:29.720' AS DateTime), 1, CAST(N'2018-07-19T14:43:29.720' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (42, 20, 4, N'1 GB', CAST(N'2018-07-19T15:42:25.263' AS DateTime), 1, CAST(N'2018-07-19T15:42:25.263' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (43, 20, 5, N'Yes', CAST(N'2018-07-19T15:42:25.280' AS DateTime), 1, CAST(N'2018-07-19T15:42:25.280' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (62, 24, 16, N'VC', CAST(N'2018-07-20T17:13:10.907' AS DateTime), 1, CAST(N'2018-07-20T17:13:11.467' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (63, 24, 17, N'32', CAST(N'2018-07-20T17:13:14.610' AS DateTime), 1, CAST(N'2018-07-20T17:13:15.020' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (64, 24, 18, N'3222', CAST(N'2018-07-20T17:13:17.623' AS DateTime), 1, CAST(N'2018-07-20T17:13:18.120' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (65, 24, 19, N'190', CAST(N'2018-07-20T17:13:20.700' AS DateTime), 1, CAST(N'2018-07-20T17:13:21.107' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (66, 24, 21, N'30000', CAST(N'2018-07-20T17:13:25.150' AS DateTime), 1, CAST(N'2018-07-20T17:13:25.557' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (67, 24, 22, N'230', CAST(N'2018-07-20T17:13:28.697' AS DateTime), 1, CAST(N'2018-07-20T17:13:29.107' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (68, 25, 16, N'Test Brand', CAST(N'2018-07-24T10:42:31.653' AS DateTime), 1, CAST(N'2018-07-24T10:42:32.503' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (69, 25, 17, N'32', CAST(N'2018-07-24T10:42:37.053' AS DateTime), 1, CAST(N'2018-07-24T10:42:37.457' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (70, 25, 18, N'32', CAST(N'2018-07-24T10:42:40.067' AS DateTime), 1, CAST(N'2018-07-24T10:42:40.650' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (71, 25, 19, N'22', CAST(N'2018-07-24T10:42:43.550' AS DateTime), 1, CAST(N'2018-07-24T10:42:43.977' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (72, 25, 21, N'1098X1035', CAST(N'2018-07-24T10:42:46.460' AS DateTime), 1, CAST(N'2018-07-24T10:42:46.847' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (73, 25, 22, N'230', CAST(N'2018-07-24T10:42:49.507' AS DateTime), 1, CAST(N'2018-07-24T10:42:49.953' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (80, 27, 1, N'Screen Size', CAST(N'2018-07-26T17:11:44.750' AS DateTime), 1, CAST(N'2018-07-26T17:11:44.750' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (81, 27, 2, N'16GB', CAST(N'2018-07-26T17:11:44.807' AS DateTime), 1, CAST(N'2018-07-26T17:11:44.807' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (82, 28, 23, N'23/02/2018', CAST(N'2018-07-26T18:57:04.180' AS DateTime), 1, CAST(N'2018-07-26T18:57:04.180' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10074, 10026, 14, N'Samsung', CAST(N'2018-07-27T11:00:13.553' AS DateTime), 1, CAST(N'2018-07-27T11:00:13.553' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10075, 10026, 15, NULL, CAST(N'2018-07-27T11:00:13.593' AS DateTime), 1, CAST(N'2018-07-27T11:00:13.593' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10076, 10029, 11, NULL, CAST(N'2018-07-27T12:12:44.650' AS DateTime), 1, CAST(N'2018-07-27T12:12:44.650' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10077, 10029, 12, NULL, CAST(N'2018-07-27T12:12:44.717' AS DateTime), 1, CAST(N'2018-07-27T12:12:44.717' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10078, 10029, 13, NULL, CAST(N'2018-07-27T12:12:44.720' AS DateTime), 1, CAST(N'2018-07-27T12:12:44.720' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10079, 10031, 16, NULL, CAST(N'2018-07-27T12:14:04.633' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.633' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10080, 10031, 17, NULL, CAST(N'2018-07-27T12:14:04.640' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.640' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10081, 10031, 18, NULL, CAST(N'2018-07-27T12:14:04.643' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.643' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10082, 10031, 19, NULL, CAST(N'2018-07-27T12:14:04.643' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.643' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10083, 10031, 21, NULL, CAST(N'2018-07-27T12:14:04.647' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.647' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10084, 10031, 22, NULL, CAST(N'2018-07-27T12:14:04.647' AS DateTime), 1, CAST(N'2018-07-27T12:14:04.647' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10085, 10032, 4, NULL, CAST(N'2018-07-27T12:16:28.517' AS DateTime), 1, CAST(N'2018-07-27T12:16:28.517' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10086, 10032, 5, NULL, CAST(N'2018-07-27T12:16:28.523' AS DateTime), 1, CAST(N'2018-07-27T12:16:28.523' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10087, 10033, 11, N'yes', CAST(N'2018-07-30T15:35:58.503' AS DateTime), 1, CAST(N'2018-07-30T15:35:58.503' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10088, 10033, 12, N'yes', CAST(N'2018-07-30T15:35:58.647' AS DateTime), 1, CAST(N'2018-07-30T15:35:58.647' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10089, 10033, 13, N'no', CAST(N'2018-07-30T15:35:58.650' AS DateTime), 1, CAST(N'2018-07-30T15:35:58.650' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10090, 10034, 14, N'yes', CAST(N'2018-07-30T15:36:17.120' AS DateTime), 1, CAST(N'2018-07-30T15:36:17.120' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10091, 10034, 15, N'no', CAST(N'2018-07-30T15:36:17.127' AS DateTime), 1, CAST(N'2018-07-30T15:36:17.127' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10092, 10035, 1, NULL, CAST(N'2018-07-30T16:01:27.747' AS DateTime), 1, CAST(N'2018-07-30T16:01:27.747' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10093, 10035, 2, NULL, CAST(N'2018-07-30T16:01:27.827' AS DateTime), 1, CAST(N'2018-07-30T16:01:27.827' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10094, 10040, 1, NULL, CAST(N'2018-07-30T16:41:35.463' AS DateTime), 1, CAST(N'2018-07-30T16:41:35.463' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10095, 10040, 2, NULL, CAST(N'2018-07-30T16:41:35.530' AS DateTime), 1, CAST(N'2018-07-30T16:41:35.530' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10096, 10041, 11, NULL, CAST(N'2018-07-30T17:47:02.373' AS DateTime), 1, CAST(N'2018-07-30T17:47:02.373' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10097, 10041, 12, NULL, CAST(N'2018-07-30T17:47:02.387' AS DateTime), 1, CAST(N'2018-07-30T17:47:02.387' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10098, 10041, 13, NULL, CAST(N'2018-07-30T17:47:02.387' AS DateTime), 1, CAST(N'2018-07-30T17:47:02.387' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20087, 20033, 1, NULL, CAST(N'2018-07-31T18:23:54.873' AS DateTime), 1, CAST(N'2018-07-31T18:23:54.873' AS DateTime), 1)
INSERT [dbo].[AssetRequestSpecification] ([Id], [AssetRequestId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20088, 20033, 2, NULL, CAST(N'2018-07-31T18:23:54.987' AS DateTime), 1, CAST(N'2018-07-31T18:23:54.987' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetRequestSpecification] OFF
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([AssetId], [AssetTagNumber], [AssetRequestId], [Price], [PurchaseOrderOn], [ServiceTagNumber], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, N'Asset_002', 2, 35000, CAST(N'2018-07-09T00:00:00.000' AS DateTime), N'Service_002', 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Assets] ([AssetId], [AssetTagNumber], [AssetRequestId], [Price], [PurchaseOrderOn], [ServiceTagNumber], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, N'Asset_003', 5, 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), N'Service_003', 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Assets] ([AssetId], [AssetTagNumber], [AssetRequestId], [Price], [PurchaseOrderOn], [ServiceTagNumber], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, N'Asset_004', 7, 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), N'Service_004', 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Assets] ([AssetId], [AssetTagNumber], [AssetRequestId], [Price], [PurchaseOrderOn], [ServiceTagNumber], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, N'Asset_005', 15, 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), N'Service_005', 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Assets] ([AssetId], [AssetTagNumber], [AssetRequestId], [Price], [PurchaseOrderOn], [ServiceTagNumber], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (7, N'Asset_006', 18, 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), N'Service_005', 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-09T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Assets] OFF
SET IDENTITY_INSERT [dbo].[AssetSpecification] ON 

INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, 2, 1, 2, N'8GB RAM', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, 2, 1, 2, N'Sensitive Touch', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, 7, 14, 23, N'31/12/2019', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, 4, 1, 2, N'Sensitive Touch', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, 4, 1, 2, N'8GB RAM', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetSpecification] ([AssetSpecId], [AssetId], [AssetTypeId], [AssetTypeSpecId], [AssetTypeSpecValue], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (7, 5, 1, 2, N'Sensitive Touch', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetSpecification] OFF
SET IDENTITY_INSERT [dbo].[AssetStatus] ON 

INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, N'New', CAST(N'2018-06-25T12:39:09.367' AS DateTime), 1, CAST(N'2018-06-25T12:39:09.367' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, N'Quotation In Progress', CAST(N'2018-06-25T12:39:22.540' AS DateTime), 1, CAST(N'2018-06-25T12:39:22.540' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, N'Awaiting Quotation Approval', CAST(N'2018-06-25T12:42:17.087' AS DateTime), 1, CAST(N'2018-06-25T12:42:17.087' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, N'Awaiting PO', CAST(N'2018-06-25T12:42:30.197' AS DateTime), 1, CAST(N'2018-06-25T12:42:30.197' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, N'Raised PO', CAST(N'2018-06-25T12:42:37.787' AS DateTime), 1, CAST(N'2018-06-25T12:42:37.787' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, N'Received Asset', CAST(N'2018-07-08T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-08T00:00:00.000' AS DateTime), -1)
INSERT [dbo].[AssetStatus] ([Id], [Name], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (7, N'Materialized', CAST(N'2018-07-08T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-08T00:00:00.000' AS DateTime), -1)
SET IDENTITY_INSERT [dbo].[AssetStatus] OFF
SET IDENTITY_INSERT [dbo].[AssetType] ON 

INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, N'Laptop', 1, 1, CAST(N'2018-06-21T12:36:00.240' AS DateTime), 1, CAST(N'2018-07-07T18:53:57.310' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, N'MSDN', 2, 1, CAST(N'2018-06-25T12:10:15.877' AS DateTime), 1, CAST(N'2018-06-25T12:10:17.013' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, N'Mouse', 1, 1, CAST(N'2018-06-27T09:56:54.427' AS DateTime), 1, CAST(N'2018-06-27T09:56:55.133' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (12, N'Mobile', 1, 1, CAST(N'2018-06-27T14:40:42.493' AS DateTime), 1, CAST(N'2018-06-27T14:40:42.493' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (13, N'Monitor', 1, 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (14, N'MSDN', 2, 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1)
INSERT [dbo].[AssetType] ([Id], [Name], [AssetCategoryId], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, N'Adobe', 2, 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.633' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetType] OFF
SET IDENTITY_INSERT [dbo].[AssetTypeSpecification] ON 

INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, 1, N'AssetTypeSpecification', 0, N'Single', CAST(N'2018-06-21T12:50:12.477' AS DateTime), 1, CAST(N'2018-06-21T12:50:12.477' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, 1, N'Ram', 0, N'Multiline', CAST(N'2018-06-24T14:36:55.933' AS DateTime), 1, CAST(N'2018-06-24T14:36:55.933' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, 5, N'Ram', 1, N'Single', CAST(N'2018-06-25T12:10:31.307' AS DateTime), 1, CAST(N'2018-06-25T12:10:32.360' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, 5, N'TouchPad', 1, N'Single', CAST(N'2018-06-25T12:10:36.550' AS DateTime), 1, CAST(N'2018-06-25T12:10:37.050' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, 11, N'wireless', 1, N'Single', CAST(N'2018-06-27T09:57:00.567' AS DateTime), 1, CAST(N'2018-06-27T09:57:00.937' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (12, 11, N'bluetooth ', 1, N'Single', CAST(N'2018-06-27T09:57:05.023' AS DateTime), 1, CAST(N'2018-06-27T09:57:05.587' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (13, 11, N'Normal Mouse', 1, N'Single', CAST(N'2018-06-27T09:57:09.713' AS DateTime), 1, CAST(N'2018-06-27T09:57:10.100' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (14, 12, N'Tocuh Phone', 1, N'Single', CAST(N'2018-06-27T14:40:42.877' AS DateTime), 1, CAST(N'2018-06-27T14:40:42.877' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, 12, N'Normal Phone', 1, N'Multiline', CAST(N'2018-06-27T14:40:42.947' AS DateTime), 1, CAST(N'2018-06-27T14:40:42.947' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (16, 13, N'Brand', 1, N'Single', CAST(N'2018-07-13T15:09:31.740' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.740' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (17, 13, N'Item Height', 1, N'Single', CAST(N'2018-07-13T15:09:31.887' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.887' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (18, 13, N'Item Width', 1, N'Single', CAST(N'2018-07-13T15:09:31.913' AS DateTime), 1, CAST(N'2018-07-13T15:09:31.913' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (19, 13, N'Screen Size', 1, N'Single', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (21, 13, N'Maximum Display Resolution', 1, N'Single', CAST(N'2018-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (22, 13, N'Wattage', 1, N'Single', CAST(N'2018-07-18T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (23, 14, N'Expiry Date', 1, N'Single', CAST(N'2018-07-18T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-18T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetTypeSpecification] OFF
SET IDENTITY_INSERT [dbo].[AssetVendors] ON 

INSERT [dbo].[AssetVendors] ([Id], [Name], [AddressLine1], [AddressLine2], [Area], [City], [Pincode], [State], [MobileNo], [FaxNo], [LandLineNo], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, N'Dell Show Room', N'No 28, First Floor A Block,', N'Lattice Bridge Road', N'Adyar', N'Chennai', N'600020', N'Tamil Nadu', N'9965742123', N'', N'044 2446 4481', 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AssetVendors] ([Id], [Name], [AddressLine1], [AddressLine2], [Area], [City], [Pincode], [State], [MobileNo], [FaxNo], [LandLineNo], [IsActive], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, N'Merchy Systems', N'OMR', N'Shollinaganallur', N'Chennai', N'Chennai', N'600095', N'TN', NULL, NULL, NULL, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AssetVendors] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([UserId], [EmployeeId], [LoginId], [OfficeId], [FirstName], [LastName], [EmailAddress], [MobileNumber], [Gender], [AvatarUrl], [ReportingToId], [OfficeHolidayId], [EmployeeRoleId], [IsHandleMembers], [IsInProbationaryPeriod], [CanAvailYearlyLeave], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ShiftID], [CardID], [DOJ], [ConfirmationDate], [RelievingDate]) VALUES (1, N'101', NULL, NULL, N'Suresh', N'S', N'sureshs@nltechdev.com', N'9999990002', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([UserId], [EmployeeId], [LoginId], [OfficeId], [FirstName], [LastName], [EmailAddress], [MobileNumber], [Gender], [AvatarUrl], [ReportingToId], [OfficeHolidayId], [EmployeeRoleId], [IsHandleMembers], [IsInProbationaryPeriod], [CanAvailYearlyLeave], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ShiftID], [CardID], [DOJ], [ConfirmationDate], [RelievingDate]) VALUES (2, N'001', N'1', 111, N'Monish', N'Jain', N'mjain@nltechdev.com', N'9876543210', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-06-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([UserId], [EmployeeId], [LoginId], [OfficeId], [FirstName], [LastName], [EmailAddress], [MobileNumber], [Gender], [AvatarUrl], [ReportingToId], [OfficeHolidayId], [EmployeeRoleId], [IsHandleMembers], [IsInProbationaryPeriod], [CanAvailYearlyLeave], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ShiftID], [CardID], [DOJ], [ConfirmationDate], [RelievingDate]) VALUES (3, N'002', N'1', 111, N'Bala', N'S', N'balas@nltechdev.com', N'9876543211', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-06-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([UserId], [EmployeeId], [LoginId], [OfficeId], [FirstName], [LastName], [EmailAddress], [MobileNumber], [Gender], [AvatarUrl], [ReportingToId], [OfficeHolidayId], [EmployeeRoleId], [IsHandleMembers], [IsInProbationaryPeriod], [CanAvailYearlyLeave], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ShiftID], [CardID], [DOJ], [ConfirmationDate], [RelievingDate]) VALUES (4, N'039', N'1', 111, N'Suganya', N'Sabapathi', N'suganyas@nltechdev.com', N'9876513210', N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-06-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([UserId], [EmployeeId], [LoginId], [OfficeId], [FirstName], [LastName], [EmailAddress], [MobileNumber], [Gender], [AvatarUrl], [ReportingToId], [OfficeHolidayId], [EmployeeRoleId], [IsHandleMembers], [IsInProbationaryPeriod], [CanAvailYearlyLeave], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ShiftID], [CardID], [DOJ], [ConfirmationDate], [RelievingDate]) VALUES (5, N'006', N'1', 111, N'Mohanram ', N'RJ', N'mohanrj@nltechdev.com', N'7876513210', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-07-06T00:00:00.000' AS DateTime), 1, CAST(N'2018-06-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
ALTER TABLE [dbo].[AssetAllocation] ADD  DEFAULT (getdate()) FOR [AssetAllocatedOn]
GO
ALTER TABLE [dbo].[AssetAllocation] ADD  DEFAULT (getdate()) FOR [AssetCanceledOn]
GO
ALTER TABLE [dbo].[AssetAllocation] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetCategory] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetDocuments] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetLocation] ADD  CONSTRAINT [DF__AssetLoca__Creat__108B795B]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetQuotation] ADD  CONSTRAINT [DF__AssetQuot__Creat__656C112C]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetQuoteApprovals] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetRequest] ADD  CONSTRAINT [DF__AssetRequ__Creat__4CA06362]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetRequestPayments] ADD  CONSTRAINT [DF__AssetRequ__Creat__7A672E12]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetRequestSpecification] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Assets] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetSpecification] ADD  CONSTRAINT [DF__AssetSpec__Creat__3E1D39E1]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetStatus] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetType] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetTypeSpecification] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetVendors] ADD  CONSTRAINT [DF__AssetVend__Creat__02084FDA]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetAllocation]  WITH CHECK ADD FOREIGN KEY([AssetId])
REFERENCES [dbo].[Assets] ([AssetId])
GO
ALTER TABLE [dbo].[AssetAllocation]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([UserId])
GO
ALTER TABLE [dbo].[AssetAllocation]  WITH CHECK ADD FOREIGN KEY([LocationId])
REFERENCES [dbo].[AssetLocation] ([Id])
GO
ALTER TABLE [dbo].[AssetQuotation]  WITH CHECK ADD  CONSTRAINT [FK__AssetQuot__Asset__2645B050] FOREIGN KEY([AssetVendorId])
REFERENCES [dbo].[AssetVendors] ([Id])
GO
ALTER TABLE [dbo].[AssetQuotation] CHECK CONSTRAINT [FK__AssetQuot__Asset__2645B050]
GO
ALTER TABLE [dbo].[AssetQuotation]  WITH CHECK ADD  CONSTRAINT [FK__AssetQuot__Asset__66603565] FOREIGN KEY([AssetRequestId])
REFERENCES [dbo].[AssetRequest] ([Id])
GO
ALTER TABLE [dbo].[AssetQuotation] CHECK CONSTRAINT [FK__AssetQuot__Asset__66603565]
GO
ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Asset__1332DBDC] FOREIGN KEY([AssetQuotationId])
REFERENCES [dbo].[AssetQuotation] ([Id])
GO
ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK__AssetRequ__Asset__1332DBDC]
GO
ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Asset__4D94879B] FOREIGN KEY([AssetTypeId])
REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK__AssetRequ__Asset__4D94879B]
GO
ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Asset__4E88ABD4] FOREIGN KEY([AssetStatusId])
REFERENCES [dbo].[AssetStatus] ([Id])
GO
ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK__AssetRequ__Asset__4E88ABD4]
GO
ALTER TABLE [dbo].[AssetRequest]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Locat__4F7CD00D] FOREIGN KEY([LocationId])
REFERENCES [dbo].[AssetLocation] ([Id])
GO
ALTER TABLE [dbo].[AssetRequest] CHECK CONSTRAINT [FK__AssetRequ__Locat__4F7CD00D]
GO
ALTER TABLE [dbo].[AssetRequestPayments]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Asset__7D439ABD] FOREIGN KEY([AssetRequestId])
REFERENCES [dbo].[AssetRequest] ([Id])
GO
ALTER TABLE [dbo].[AssetRequestPayments] CHECK CONSTRAINT [FK__AssetRequ__Asset__7D439ABD]
GO
ALTER TABLE [dbo].[AssetRequestPayments]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Payme__7E37BEF6] FOREIGN KEY([PaymentModeId])
REFERENCES [dbo].[AssetPaymentMode] ([Id])
GO
ALTER TABLE [dbo].[AssetRequestPayments] CHECK CONSTRAINT [FK__AssetRequ__Payme__7E37BEF6]
GO
ALTER TABLE [dbo].[AssetRequestSpecification]  WITH CHECK ADD  CONSTRAINT [FK__AssetRequ__Asset__534D60F1] FOREIGN KEY([AssetRequestId])
REFERENCES [dbo].[AssetRequest] ([Id])
GO
ALTER TABLE [dbo].[AssetRequestSpecification] CHECK CONSTRAINT [FK__AssetRequ__Asset__534D60F1]
GO
ALTER TABLE [dbo].[AssetRequestSpecification]  WITH CHECK ADD FOREIGN KEY([AssetTypeSpecId])
REFERENCES [dbo].[AssetTypeSpecification] ([Id])
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK__Assets__AssetReq__5AB9788F] FOREIGN KEY([AssetRequestId])
REFERENCES [dbo].[AssetRequest] ([Id])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK__Assets__AssetReq__5AB9788F]
GO
ALTER TABLE [dbo].[AssetSpecification]  WITH CHECK ADD  CONSTRAINT [FK__AssetSpec__Asset__3F115E1A] FOREIGN KEY([AssetId])
REFERENCES [dbo].[Assets] ([AssetId])
GO
ALTER TABLE [dbo].[AssetSpecification] CHECK CONSTRAINT [FK__AssetSpec__Asset__3F115E1A]
GO
ALTER TABLE [dbo].[AssetSpecification]  WITH CHECK ADD  CONSTRAINT [FK__AssetSpec__Asset__4D5F7D71] FOREIGN KEY([AssetTypeId])
REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[AssetSpecification] CHECK CONSTRAINT [FK__AssetSpec__Asset__4D5F7D71]
GO
ALTER TABLE [dbo].[AssetSpecification]  WITH CHECK ADD  CONSTRAINT [FK__AssetSpec__Asset__74794A92] FOREIGN KEY([AssetTypeSpecId])
REFERENCES [dbo].[AssetTypeSpecification] ([Id])
GO
ALTER TABLE [dbo].[AssetSpecification] CHECK CONSTRAINT [FK__AssetSpec__Asset__74794A92]
GO
ALTER TABLE [dbo].[AssetType]  WITH CHECK ADD FOREIGN KEY([AssetCategoryId])
REFERENCES [dbo].[AssetCategory] ([Id])
GO
ALTER TABLE [dbo].[AssetTypeSpecification]  WITH CHECK ADD FOREIGN KEY([AssetTypeId])
REFERENCES [dbo].[AssetType] ([Id])
GO
USE [master]
GO
ALTER DATABASE [AMS1] SET  READ_WRITE 
GO
