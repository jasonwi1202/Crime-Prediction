USE [Crime]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Crime]    Script Date: 1/18/2020 3:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Wittenauer
-- Create date: 12/18/2019
-- Description:	Move data from staging table into a table with formatted data types.
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Crime]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Remove prior data from crime table. This is assuming a full reimport every time. In a production environment this would probably merge new data and old data.
	TRUNCATE TABLE Crime

	-- Insert data into main crime table with formatted data types.
	INSERT INTO Crime(
		CrimeDate,
		CrimeTime,
		CrimeCode,
		Address,
		Description,
		InsideOutside,
		Weapon,
		Post,
		District,
		Neighborhood,
		Longitude,
		Latitude,
		Premise,
		TotalIncidents,
		GeoLatLong
		)
	SELECT	CrimeDate,
			CrimeTime,
			CrimeCode,
			Address,
			Description,
			InsideOutside,
			Weapon,
			Post,
			District,
			Neighborhood,
			LEFT(RIGHT(Location, 15), 9),
			REPLACE(LEFT(Location, 9), '(', ''),
			Premise,
			TotalIncidents,
			geography::Point(REPLACE(LEFT(Location, 9), '(', ''), LEFT(RIGHT(Location, 15), 9), 4326)
	FROM Staging_Crime

END
GO
