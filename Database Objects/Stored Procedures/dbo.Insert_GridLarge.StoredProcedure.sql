USE [Crime]
GO
/****** Object:  StoredProcedure [dbo].[Insert_GridLarge]    Script Date: 1/18/2020 3:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Wittenauer
-- Create date: 12/18/2019
-- Description:	Create square areas on a map based on coordinates and box size passed in. This is specifically to do larger groups of data.
-- =============================================
CREATE PROCEDURE [dbo].[Insert_GridLarge]
	@MaxLatitude FLOAT,
	@MinLatitude FLOAT,
	@MaxLongitude FLOAT,
	@MinLongitude FLOAT,
	@GridSize INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Generate square coordinates for latitudes
	IF OBJECT_ID('tempdb..#TempLatGen') IS NOT NULL
	BEGIN
		DROP TABLE #TempLatGen
	END

	;WITH latGen AS (
		SELECT @MinLatitude AS Latitude
		UNION ALL
		SELECT Latitude + ((@MaxLatitude - @MinLatitude) / @GridSize) FROM latGen WHERE Latitude + ((@MaxLatitude - @MinLatitude) / @GridSize) <= @MaxLatitude
	)
	SELECT *
	INTO #TempLatGen
	FROM latGen
	OPTION (MAXRECURSION 500)

	-- Generate square coordinates for longitudes
	IF OBJECT_ID('tempdb..#TempLongGen') IS NOT NULL
	BEGIN
		DROP TABLE #TempLongGen
	END

	;WITH longGen AS (
		SELECT @MinLongitude AS Longitude
		UNION ALL
		SELECT Longitude + ((@MaxLongitude - @MinLongitude) / @GridSize) FROM longGen WHERE Longitude + ((@MaxLongitude - @MinLongitude) / @GridSize) <= @MaxLongitude
	)
	SELECT *
	INTO #TempLongGen
	FROM longGen
	OPTION (MAXRECURSION 500)

	-- Remove prior data from grid table.
	TRUNCATE TABLE GridLarge

	-- Insert final data set into grid
	INSERT INTO GridLarge(
		BotLeftLatitude,
		BotLeftLongitude,
		TopRightLatitude,		
		TopRightLongitude
	)
	SELECT	lat.Latitude AS 'BotLeftLatitude',
			long.Longitude AS 'BotLeftLongitude',
			lat.Latitude + ((@MaxLatitude - @MinLatitude) / @GridSize) AS 'TopRightLatitude',
			long.Longitude + ((@MaxLongitude - @MinLongitude) / @GridSize) AS 'TopRightLongitude'
	FROM #TempLatGen lat
	CROSS JOIN #TempLongGen long

	-- Add IDs to the GridSmall table
	UPDATE GridSmall
	SET GridLargeId = gl.GridLargeId
	FROM GridSmall gs
	JOIN GridLarge gl
		ON (gs.BotLeftLatitude + gs.TopRightLatitude) / 2 >= gl.BotLeftLatitude
		AND (gs.BotLeftLatitude + gs.TopRightLatitude) / 2 < gl.TopRightLatitude
		AND (gs.BotLeftLongitude + gs.TopRightLongitude) / 2 >= gl.BotLeftLongitude
		AND (gs.BotLeftLongitude + gs.TopRightLongitude) / 2 < gl.TopRightLongitude


END
GO
