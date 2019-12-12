/****** Object:  Table [dbo].[Assets]    Script Date: 01-10-2019 11:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[AssetId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTagNumber] [nvarchar](255) NULL,
	[AssetRequestId] [bigint] NULL,
	[AssetIdentifier] [varchar](255) NULL,
	[Price] [bigint] NULL,
	[PurchaseOrderOn] [datetime] NOT NULL,
	[ServiceTagNumber] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[ActivationDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
 CONSTRAINT [PK__Assets] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSpecification]    Script Date: 01-10-2019 11:03:23 ******/
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
/****** Object:  View [dbo].[Vw_Assets]    Script Date: 01-10-2019 11:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Vw_Assets] AS
SELECT [AssetId]
      ,[AssetTagNumber]
      ,[AssetRequestId]
      ,[AssetIdentifier]
      ,[Price]
      ,[PurchaseOrderOn]
      ,[ServiceTagNumber]
      ,[IsActive]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[LastModifiedOn]
      ,[LastModifiedBy]
      ,[ActivationDate]
      ,[ExpiryDate]
	  ,Asp.AssetTypeId
  FROM [dbo].[Assets] Ast CROSS APPLY (select top 1 AssetTypeId from AssetSpecification ap where ap.AssetId = Ast.AssetId ) Asp
GO
/****** Object:  Table [dbo].[AssetLocation]    Script Date: 01-10-2019 11:03:23 ******/
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
/****** Object:  Table [dbo].[AssetRequest]    Script Date: 01-10-2019 11:03:23 ******/
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
/****** Object:  Table [dbo].[AssetType]    Script Date: 01-10-2019 11:03:23 ******/
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
	[AddonsTypeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01-10-2019 11:03:23 ******/
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
/****** Object:  View [dbo].[Vw_UnallocatedAssets]    Script Date: 01-10-2019 11:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create View [dbo].[Vw_UnallocatedAssets] As

WITH GetName_CTE(RequestedBy, UserId) AS
	 (SELECT FirstName + ' ' + LastName AS RequestedBy,UserId 
	  FROM      Employee
	  WHERE   (UserId IN(SELECT CreatedBy
      FROM      AssetRequest))
),

GetEmployeeName_CTE(RequestedFor, UserId) AS
    (SELECT FirstName + ' ' + LastName AS RequestedFor, UserId
     FROM      Employee AS emp
     WHERE   (UserId IN
                           (SELECT CreatedBy
                            FROM      AssetRequest AS ar)))
    SELECT AssetType.Name, empName.RequestedFor, 
                      getName.RequestedBy, vw_Assets.AssetTagNumber, AssetLocation.Name AS LocationName
    FROM     vw_Assets INNER JOIN
                      AssetType ON AssetType.Id = vw_Assets.AssetTypeId left JOIN
                      AssetRequest AS ar ON ar.Id = vw_Assets.AssetRequestId  left JOIN
                      GetName_CTE AS getName ON getName.UserId = ar.CreatedBy left JOIN
                      GetEmployeeName_CTE AS empName ON empName.UserId = ar.CreatedBy left JOIN
                      AssetLocation ON AssetLocation.Id = ar.LocationId
    WHERE  (vw_Assets.IsActive = 1)

GO
/****** Object:  Table [dbo].[AssetVendors]    Script Date: 01-10-2019 11:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetVendors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2000) NULL,
	[ContactPerson] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[Area] [nvarchar](3000) NULL,
	[City] [nvarchar](2000) NULL,
	[Pincode] [nvarchar](10) NULL,
	[State] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
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
/****** Object:  Table [dbo].[AssetQuotation]    Script Date: 01-10-2019 11:03:23 ******/
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
	[CGST] [money] NULL,
	[SGST] [money] NULL,
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
/****** Object:  View [dbo].[Vw_PendingAssets]    Script Date: 01-10-2019 11:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Vw_PendingAssets] AS

SELECT ar.CreatedOn, ar.PONumber, AssetType.Name, AssetQuotation.Quantity, AssetVendors.Name AS VendorName, AssetVendors.MobileNo, 
                  AssetQuotation.Price, AssetLocation.Name AS LocationName, emp.FirstName, emp.LastName, ar.Id, AssetVendors.Email, AssetVendors.LandLineNo, 
                  ar.CreatedBy, emp.UserId,emp.FirstName + ' ' + emp.LastName as RaisedBy
                    
FROM     AssetRequest AS ar INNER JOIN
                  AssetType ON ar.AssetTypeId = AssetType.Id INNER JOIN
                  AssetQuotation ON ar.Id = AssetQuotation.AssetRequestId INNER JOIN
                  AssetVendors ON AssetQuotation.AssetVendorId = AssetVendors.Id INNER JOIN
                  AssetLocation ON ar.LocationId = AssetLocation.Id INNER JOIN
                  Employee AS emp ON ar.CreatedBy = emp.UserId
WHERE  (ar.IsActive = 1) 
GO
/****** Object:  Table [dbo].[AssetAllocation]    Script Date: 01-10-2019 11:03:23 ******/
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
	[AllocationComments] [nvarchar](max) NULL,
	[CancellationComments] [nvarchar](max) NULL,
 CONSTRAINT [PK__AssetAlloc] PRIMARY KEY CLUSTERED 
(
	[AssetAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetCategory]    Script Date: 01-10-2019 11:03:23 ******/
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
/****** Object:  Table [dbo].[AssetDocuments]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetDocuments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityId] [bigint] NULL,
	[EntityTypeId] [bigint] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
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
/****** Object:  Table [dbo].[AssetHistory]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetRequestId] [bigint] NOT NULL,
	[TargetStatusId] [bigint] NOT NULL,
	[StatusChangedBy] [bigint] NOT NULL,
	[StatusModifiedOn] [datetime] NOT NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetPaymentMode]    Script Date: 01-10-2019 11:03:24 ******/
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
/****** Object:  Table [dbo].[AssetQuoteApprovals]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetQuoteApprovals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetQuotationId] [bigint] NULL,
	[ApprovedBy] [bigint] NULL,
	[ApprovedOn] [datetime] NULL,
	[IsAwaitingNextApproval] [bit] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedOn] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK__AssetQuo__3214EC07FDD50633] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRequestPayments]    Script Date: 01-10-2019 11:03:24 ******/
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
	[Payee] [varchar](50) NULL,
	[IsActive] [bigint] NULL,
 CONSTRAINT [PK__AssetReq__3214EC072B40DE68] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetRequestSpecification]    Script Date: 01-10-2019 11:03:24 ******/
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
/****** Object:  Table [dbo].[AssetStatus]    Script Date: 01-10-2019 11:03:24 ******/
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
/****** Object:  Table [dbo].[AssetTypeAddOns]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetTypeAddOns](
	[Id] [bigint] NOT NULL,
	[AddonsName] [nvarchar](2000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTypeOtherSpecification]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetTypeOtherSpecification](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetRequestId] [bigint] NULL,
	[OtherSpecification] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTypeSpecification]    Script Date: 01-10-2019 11:03:24 ******/
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
/****** Object:  Table [dbo].[Entity]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityId] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityName] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleMap]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMap](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeUserId] [bigint] NULL,
	[RoleId] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_UserRoleMap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-10-2019 11:03:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[EmployeeUserId] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]