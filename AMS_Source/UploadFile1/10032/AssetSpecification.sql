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

ALTER TABLE [dbo].[AssetSpecification] ADD  CONSTRAINT [DF__AssetSpec__Creat__3E1D39E1]  DEFAULT (getdate()) FOR [CreatedOn]
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


