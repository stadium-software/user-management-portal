USE [StadiumPortal]
GO
/****** Object:  Table [dbo].[applicationroles]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[applicationid] [int] NULL,
	[roleid] [int] NULL,
 CONSTRAINT [PK_applicationroles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applications]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[application] [varchar](150) NULL,
	[url] [varchar](350) NULL,
	[apikey] [varchar](50) NULL,
	[emailauth] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicationusers]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[applicationid] [int] NULL,
	[userid] [int] NULL,
	[stadiumuserid] [varchar](150) NULL,
	[isadmin] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [varchar](150) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userapplicationroles]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userapplicationroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[applicationid] [int] NULL,
	[roleid] [int] NULL,
 CONSTRAINT [PK_userroles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 27/05/2024 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[applications] ADD  DEFAULT (NULL) FOR [apikey]
GO
ALTER TABLE [dbo].[applicationusers] ADD  DEFAULT (NULL) FOR [stadiumuserid]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'applications', @level2type=N'COLUMN',@level2name=N'apikey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'applicationusers', @level2type=N'COLUMN',@level2name=N'stadiumuserid'
GO
USE [master]
GO
ALTER DATABASE [StadiumPortal] SET  READ_WRITE 
GO
