USE [tokenCache]
GO

/****** Object:  Table [dbo].[SecurityTokenCache]    Script Date: 13/3/2014 4:23:56 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SecurityTokenCache](
	[Id] [uniqueidentifier] NOT NULL,
	[ContextID] [nvarchar](100) NOT NULL,
	[EndpointID] [nvarchar](100) NOT NULL,
	[KeyGeneration] [nvarchar](100) NULL,
	[ExpiryTime] [datetime2](7) NOT NULL,
	[RollingExpiryTime] [datetime2](7) NULL,
	[SessionSecurityTokenValue] [varbinary](max) NOT NULL,
	[SessionSecurityTokenID] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SecurityTokenCache] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



USE [tokenCache]
GO

/****** Object:  Index [IX_SecurityTokenCache_Expiration]    Script Date: 13/3/2014 4:24:06 μμ ******/
CREATE NONCLUSTERED INDEX [IX_SecurityTokenCache_Expiration] ON [dbo].[SecurityTokenCache]
(
	[ExpiryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_SecurityTokenCache_Expiration]    Script Date: 13/3/2014 4:24:06 μμ ******/
CREATE NONCLUSTERED INDEX [IX_SecurityTokenCache_RollingExpiration] ON [dbo].[SecurityTokenCache]
(
	[RollingExpiryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [tokenCache]
GO

/****** Object:  Index [IX_SecurityTokenCache_SessionID]    Script Date: 13/3/2014 4:24:15 μμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecurityTokenCache_SessionID] ON [dbo].[SecurityTokenCache]
(
	[SessionSecurityTokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


USE [tokenCache]
GO

/****** Object:  Index [UIX_SecurityTokenCache_ContextID_EndpointID]    Script Date: 13/3/2014 4:24:26 μμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_SecurityTokenCache_ContextID_EndpointID] ON [dbo].[SecurityTokenCache]
(
	[ContextID] ASC,
	[EndpointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [tokenCache]
GO

/****** Object:  Index [UIX_SecurityTokenCache_UserName]    Script Date: 13/3/2014 4:24:37 μμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_SecurityTokenCache_UserName_EndpointID] ON [dbo].[SecurityTokenCache]
(
	[UserName] ASC,
	[EndpointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO




USE [tokenCache]
GO

/****** Object:  Table [dbo].[TokenReplayCache]    Script Date: 13/3/2014 4:29:48 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TokenReplayCache](
	[Id] [uniqueidentifier] NOT NULL,
	[TokenKey] [nvarchar](100) NOT NULL,
	[ExpirationTime] [datetime] NOT NULL,
	[SecurityToken] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_TokenReplayCache] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tokenCache]
GO

/****** Object:  Index [IX_TokenReplayCache_Expiration]    Script Date: 13/3/2014 4:29:53 μμ ******/
CREATE NONCLUSTERED INDEX [IX_TokenReplayCache_Expiration] ON [dbo].[TokenReplayCache]
(
	[ExpirationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [tokenCache]
GO

/****** Object:  Index [IX_TokenReplayCache_TokenKey]    Script Date: 13/3/2014 4:30:00 μμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TokenReplayCache_TokenKey] ON [dbo].[TokenReplayCache]
(
	[TokenKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



