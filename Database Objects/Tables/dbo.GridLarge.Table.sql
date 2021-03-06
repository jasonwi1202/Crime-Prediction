USE [Crime]
GO
/****** Object:  Table [dbo].[GridLarge]    Script Date: 1/18/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridLarge](
	[GridLargeId] [int] IDENTITY(1,1) NOT NULL,
	[BotLeftLatitude] [float] NULL,
	[TopRightLatitude] [float] NULL,
	[BotLeftLongitude] [float] NULL,
	[TopRightLongitude] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_GridLarge_PK]    Script Date: 1/18/2020 3:25:10 PM ******/
CREATE CLUSTERED INDEX [IDX_GridLarge_PK] ON [dbo].[GridLarge]
(
	[GridLargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_GridLarge_Coords]    Script Date: 1/18/2020 3:25:10 PM ******/
CREATE NONCLUSTERED INDEX [IDX_GridLarge_Coords] ON [dbo].[GridLarge]
(
	[BotLeftLatitude] ASC,
	[TopRightLatitude] ASC,
	[BotLeftLongitude] ASC,
	[TopRightLongitude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
