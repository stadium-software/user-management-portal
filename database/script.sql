USE [master]
GO
CREATE DATABASE [StadiumUserManager]
GO
USE [StadiumUserManager]
GO
CREATE TABLE [dbo].[portalapplications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[application] [varchar](150) NULL,
	[url] [varchar](350) NULL,
	[apikey] [varchar](50) NULL,
	[emailauth] [bit] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[portalusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NULL,
	[name] [varchar](150) NULL
) ON [PRIMARY]
GO
