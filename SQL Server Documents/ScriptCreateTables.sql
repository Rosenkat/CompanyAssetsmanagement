USE [DbTeste]
GO
/****** Object:  Table [dbo].[CompanyAssets]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAssets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[DeliveryDate] [datetime2](4) NOT NULL,
	[ReturnDate] [datetime2](4) NULL,
 CONSTRAINT [PK_CompanyAssets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostCenter]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostCenter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CostCenter] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CostCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[ServiceTag] [varchar](50) NOT NULL,
	[RenterId] [bigint] NOT NULL,
	[RentValue] [decimal](18, 2) NOT NULL,
	[CancelDate] [datetime2](4) NULL,
 CONSTRAINT [PK_EquipmentId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Observation] [varchar](100) NULL,
 CONSTRAINT [PK_EquipmentTypeId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ConstractDate] [datetime2](4) NOT NULL,
	[CancelDate] [datetime2](4) NULL,
 CONSTRAINT [PK_RenterId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[User] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserTypeId] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CostCenterId] [bigint] NOT NULL,
	[Password] [varchar](100) NULL,
 CONSTRAINT [PK_UsersID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersType]    Script Date: 14/04/2023 21:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_UsersTypeID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyAssets]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentId] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipment] ([Id])
GO
ALTER TABLE [dbo].[CompanyAssets] CHECK CONSTRAINT [FK_EquipmentId]
GO
ALTER TABLE [dbo].[CompanyAssets]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CompanyAssets] CHECK CONSTRAINT [FK_UserId]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentTypeId] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[EquipmentType] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_EquipmentTypeId]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_RenterId] FOREIGN KEY([RenterId])
REFERENCES [dbo].[Renter] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_RenterId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_CostCenterID] FOREIGN KEY([CostCenterId])
REFERENCES [dbo].[CostCenter] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_CostCenterID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UsersUserTypeID] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UsersType] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UsersUserTypeID]
GO
