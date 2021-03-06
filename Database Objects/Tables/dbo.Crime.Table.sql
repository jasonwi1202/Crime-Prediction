USE [Crime]
GO
/****** Object:  Table [dbo].[Crime]    Script Date: 1/18/2020 3:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime](
	[CrimeDate] [date] NULL,
	[CrimeTime] [time](7) NULL,
	[CrimeCode] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[InsideOutside] [varchar](max) NULL,
	[Weapon] [varchar](max) NULL,
	[Post] [varchar](max) NULL,
	[District] [varchar](max) NULL,
	[Neighborhood] [varchar](max) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Premise] [varchar](max) NULL,
	[TotalIncidents] [int] NULL,
	[BotLeftLatitude] [float] NULL,
	[TopRightLatitude] [float] NULL,
	[BotLeftLongitude] [float] NULL,
	[TopRightLongitude] [float] NULL,
	[CrimeOrder] [int] NULL,
	[CrimeId] [int] IDENTITY(1,1) NOT NULL,
	[GeoLatLong] [geography] NULL,
	[GridSmallId] [int] NULL,
	[GridLargeId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IDX_Crime_CrimeId]    Script Date: 1/18/2020 3:25:09 PM ******/
CREATE CLUSTERED INDEX [IDX_Crime_CrimeId] ON [dbo].[Crime]
(
	[CrimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Crime_CrimeDate]    Script Date: 1/18/2020 3:25:10 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Crime_CrimeDate] ON [dbo].[Crime]
(
	[CrimeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Crime_LatLong]    Script Date: 1/18/2020 3:25:10 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Crime_LatLong] ON [dbo].[Crime]
(
	[Latitude] ASC,
	[Longitude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
