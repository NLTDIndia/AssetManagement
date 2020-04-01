USE [AssetManagement]
GO
/****** Object:  Table [dbo].[AssetTypeSpecification]    Script Date: 4/1/2020 5:32:34 PM ******/
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
SET IDENTITY_INSERT [dbo].[AssetTypeSpecification] ON 
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (1, 1, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.717' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (2, 1, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.717' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (3, 1, N'Processor', 1, N'Single', CAST(N'2020-04-01T17:04:55.720' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (4, 1, N'RAM', 1, N'Single', CAST(N'2020-04-01T17:04:55.720' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (5, 1, N'HDD', 1, N'Single', CAST(N'2020-04-01T17:04:55.720' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (6, 1, N'Charger', 1, N'Single', CAST(N'2020-04-01T17:04:55.720' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (7, 1, N'OS', 1, N'Single', CAST(N'2020-04-01T17:04:55.720' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (8, 1, N'Service Tag Number', 1, N'Single', CAST(N'2020-04-01T17:04:55.723' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (9, 1, N'Express Service code', 1, N'Single', CAST(N'2020-04-01T17:04:55.723' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (10, 1, N'Software Details', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.723' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (11, 2, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.723' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (12, 2, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.727' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (13, 2, N'Processor', 1, N'Single', CAST(N'2020-04-01T17:04:55.727' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (14, 2, N'RAM', 1, N'Single', CAST(N'2020-04-01T17:04:55.727' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (15, 2, N'HDD', 1, N'Single', CAST(N'2020-04-01T17:04:55.727' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (16, 2, N'OS', 1, N'Single', CAST(N'2020-04-01T17:04:55.727' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (17, 2, N'Service Tag Number', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (18, 2, N'Express Service code', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (19, 2, N'Software Details', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (20, 3, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (21, 3, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (22, 3, N'Display Size', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (23, 3, N'PORT', 1, N'Single', CAST(N'2020-04-01T17:04:55.730' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (24, 3, N'Service Tag Number', 1, N'Single', CAST(N'2020-04-01T17:04:55.733' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (25, 3, N'Express Service Code', 1, N'Single', CAST(N'2020-04-01T17:04:55.733' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (26, 4, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.733' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (27, 4, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.733' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (28, 4, N'Service Tag Number', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (29, 5, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (30, 5, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (31, 6, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (32, 6, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (33, 7, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.737' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (34, 7, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (35, 7, N'Capacity', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (36, 8, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (37, 8, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (38, 8, N'Color/Black', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (39, 9, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (40, 9, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (41, 9, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (42, 10, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.740' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (43, 10, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (44, 10, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (45, 11, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (46, 11, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (47, 11, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (48, 12, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (49, 12, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.743' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (50, 12, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.747' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (51, 13, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.747' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (52, 13, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.747' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (53, 13, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.747' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (54, 14, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.747' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (55, 14, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (56, 14, N'Display Size', 1, N'Single', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (57, 14, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (58, 15, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (59, 15, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (60, 15, N'Extension', 1, N'Single', CAST(N'2020-04-01T17:04:55.750' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (61, 15, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.753' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (62, 16, N'Make', 1, N'Single', CAST(N'2020-04-01T17:04:55.753' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (63, 16, N'Model', 1, N'Single', CAST(N'2020-04-01T17:04:55.753' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (64, 16, N'Extension', 1, N'Single', CAST(N'2020-04-01T17:04:55.753' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (65, 16, N'Others', 1, N'Multiline', CAST(N'2020-04-01T17:04:55.757' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (66, 36, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.757' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (67, 36, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.757' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (68, 36, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.760' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (69, 36, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.760' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (70, 36, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.760' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (71, 36, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.760' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (72, 36, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.760' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (73, 37, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.763' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (74, 37, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.763' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (75, 37, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.763' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (76, 37, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.763' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (77, 37, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.767' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (78, 37, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.767' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (79, 37, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.767' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (80, 38, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.770' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (81, 38, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.770' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (82, 38, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.770' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (83, 38, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.770' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (84, 38, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.770' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (85, 38, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.773' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (86, 38, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.773' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (87, 39, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.773' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (88, 39, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.773' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (89, 39, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.777' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (90, 39, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.777' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (91, 39, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.777' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (92, 39, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.780' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (93, 39, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.780' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (94, 40, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.780' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (95, 40, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.780' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (96, 40, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.780' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (97, 40, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.783' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (98, 40, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.783' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (99, 40, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.783' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (100, 40, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.787' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (101, 41, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.787' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (102, 41, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.787' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (103, 41, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.787' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (104, 41, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.790' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (105, 41, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.790' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (106, 41, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.790' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (107, 41, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.790' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (108, 42, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.790' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (109, 42, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.793' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (110, 42, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.793' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (111, 42, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.793' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (112, 42, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.797' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (113, 42, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.797' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (114, 42, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.797' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (115, 43, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (116, 43, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (117, 43, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (118, 43, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (119, 43, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (120, 43, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.800' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (121, 43, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.803' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (122, 44, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.803' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (123, 44, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.803' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (124, 44, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.807' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (125, 44, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.807' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (126, 44, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.807' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (127, 44, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.810' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (128, 44, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.810' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (129, 45, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.810' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (130, 45, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.810' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (131, 45, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.810' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (132, 45, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.813' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (133, 45, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.813' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (134, 45, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.813' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (135, 45, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.817' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (136, 46, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.817' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (137, 46, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.817' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (138, 46, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.817' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (139, 46, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.817' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (140, 46, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.820' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (141, 46, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.820' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (142, 46, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.820' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (143, 47, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.820' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (144, 47, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.823' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (145, 47, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.823' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (146, 47, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.823' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (147, 47, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.827' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (148, 47, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.827' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (149, 47, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.827' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (150, 48, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.827' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (151, 48, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.830' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (152, 48, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.830' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (153, 48, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.830' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (154, 48, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.830' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (155, 48, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.833' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (156, 48, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.833' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (157, 49, N'Manufacturer', 1, N'Single', CAST(N'2020-04-01T17:04:55.833' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (158, 49, N'Version', 1, N'Single', CAST(N'2020-04-01T17:04:55.833' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (159, 49, N'Edition', 1, N'Single', CAST(N'2020-04-01T17:04:55.837' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (160, 49, N'Product Key', 1, N'Single', CAST(N'2020-04-01T17:04:55.837' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (161, 49, N'Project', 1, N'Single', CAST(N'2020-04-01T17:04:55.837' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (162, 49, N'Vendor Name', 1, N'Single', CAST(N'2020-04-01T17:04:55.840' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (163, 49, N'Remarks', 1, N'Single', CAST(N'2020-04-01T17:04:55.840' AS DateTime), 5, NULL, NULL)
GO
INSERT [dbo].[AssetTypeSpecification] ([Id], [AssetTypeId], [Name], [IsActive], [ValueType], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy]) VALUES (164, 50, N'Normal keyboard', 1, N'Single', CAST(N'2020-04-01T17:04:55.840' AS DateTime), 5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AssetTypeSpecification] OFF
GO
ALTER TABLE [dbo].[AssetTypeSpecification] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AssetTypeSpecification]  WITH CHECK ADD FOREIGN KEY([AssetTypeId])
REFERENCES [dbo].[AssetType] ([Id])
GO
