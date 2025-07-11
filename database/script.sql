USE [StadiumUserManager]
GO
/****** Object:  Table [dbo].[portalappaudit]    Script Date: 2025/06/30 09:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portalappaudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[applicationid] [int] NULL,
	[previouskey] [varchar](150) NULL,
	[newkey] [varchar](150) NULL,
	[updatedatetime] [datetime] NULL,
	[previousurl] [varchar](150) NULL,
	[newurl] [varchar](150) NULL,
	[applicationname] [varchar](150) NULL,
 CONSTRAINT [PK_portalappaudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[portalapplications]    Script Date: 2025/06/30 09:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portalapplications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[application] [varchar](150) NULL,
	[url] [varchar](350) NULL,
	[apikey] [varchar](50) NULL,
	[emailauth] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[portalaudit]    Script Date: 2025/06/30 09:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portalaudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](150) NULL,
	[loggedinemail] [varchar](150) NULL,
	[action] [varchar](12) NULL,
	[object] [varchar](500) NULL,
	[updatedatetime] [datetime] NULL,
	[loggedinuserid] [varchar](50) NULL,
	[application] [varchar](150) NULL,
	[applicationid] [int] NULL,
 CONSTRAINT [PK_portalaudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[portalusers]    Script Date: 2025/06/30 09:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portalusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NULL,
	[name] [varchar](150) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[portalappaudit] ADD  CONSTRAINT [DF_portalappaudit_updatedatetime]  DEFAULT (getdate()) FOR [updatedatetime]
GO
ALTER TABLE [dbo].[portalaudit] ADD  CONSTRAINT [DF_portalaudit_updatedatetime]  DEFAULT (getdate()) FOR [updatedatetime]
GO
