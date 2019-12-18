USE [Crime]
GO
/****** Object:  Table [dbo].[CrimeGrid]    Script Date: 12/18/2019 4:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrimeGrid](
	[CrimeDate] [date] NULL,
	[DayOfWeek] [int] NULL,
	[MonthOfYear] [int] NULL,
	[IncidentOccurred] [int] NULL,
	[PriorIncident1Day] [int] NULL,
	[PriorIncident2Days] [int] NULL,
	[PriorIncident3Days] [int] NULL,
	[PriorIncident7Days] [int] NULL,
	[PriorIncident14Days] [int] NULL,
	[PriorIncident30Days] [int] NULL,
	[PriorIncident60Days] [int] NULL,
	[GridSmallId] [int] NULL,
	[GridLargeId] [int] NULL,
	[CrimeGridId] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CrimeGrid_CrimeGridId]    Script Date: 12/18/2019 4:08:27 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CrimeGrid_CrimeGridId] ON [dbo].[CrimeGrid]
(
	[CrimeGridId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CrimeGrid_GridSmallIdCrimeDateIncident]    Script Date: 12/18/2019 4:08:27 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CrimeGrid_GridSmallIdCrimeDateIncident] ON [dbo].[CrimeGrid]
(
	[GridSmallId] ASC,
	[CrimeDate] ASC,
	[IncidentOccurred] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
