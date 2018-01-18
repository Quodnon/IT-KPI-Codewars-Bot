CREATE SCHEMA [Audit]
GO

CREATE SCHEMA [Rating]
GO

CREATE SCHEMA [User]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rating].[WeeklyRatingUserModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodewarsUsername] [nvarchar](50) NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_WeeklyRatingUserModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rating].[Weeks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Weeks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodewarsUsername] [nvarchar](100) NOT NULL,
	[CodewarsFullname] [nvarchar](100) NULL,
	[TelegramUsername] [nvarchar](100) NULL,
	[TelegramId] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
