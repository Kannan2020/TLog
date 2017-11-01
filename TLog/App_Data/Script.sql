USE [master]
GO
/****** Object:  Database [TLog]    Script Date: 01-11-2017 11.42.25 PM ******/
CREATE DATABASE [TLog]
GO
USE [TLog]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 01-11-2017 11.42.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceLineId] [int] NOT NULL,
	[ActivityName] [varchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceLines]    Script Date: 01-11-2017 11.42.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceLineName] [varchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (1, 1, N'HS1', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (2, 1, N'HS2', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (3, 2, N'TS1', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (5, 2, N'TS4', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (6, 3, N'FS564', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (7, 3, N'FS98324', 1)
GO
INSERT [dbo].[Activity] ([Id], [ServiceLineId], [ActivityName], [IsActive]) VALUES (9, 3, N'FS834', 1)
GO
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceLines] ON 

GO
INSERT [dbo].[ServiceLines] ([Id], [ServiceLineName], [IsActive]) VALUES (1, N'H1', 1)
GO
INSERT [dbo].[ServiceLines] ([Id], [ServiceLineName], [IsActive]) VALUES (2, N'T2', 1)
GO
INSERT [dbo].[ServiceLines] ([Id], [ServiceLineName], [IsActive]) VALUES (3, N'F3', 1)
GO
SET IDENTITY_INSERT [dbo].[ServiceLines] OFF
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ServiceLines] ADD  CONSTRAINT [DF_ServiceLines_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ServiceLines] FOREIGN KEY([ServiceLineId])
REFERENCES [dbo].[ServiceLines] ([Id])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ServiceLines]
GO
USE [master]
GO
ALTER DATABASE [TLog] SET  READ_WRITE 
GO
