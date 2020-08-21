/***** notes: for the entire package the work fine

USE [esp]
GO
/****** Object:  View [dbo].[vw_1]   by Joel Kalonji Script Date: 8/5/2020 2:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_1]
AS
SELECT  ID,
	Name,
	esp,
	Bucket
FROM 
(
SELECT
	ID,
	'TimeSeries_MAX' AS Name,
	MAX(Score) AS esp,
	dbo.esp(MAX(Score)) AS Bucket
FROM 
	[dbo].tblTimeSeries
GROUP BY 
	ID
UNION ALL
SELECT
	ID,
	'TimeSeries_Avg' AS Name,
	AVG(Score) AS esp,
	dbo.esp(AVG(Score)) AS Bucket
FROM 
	[dbo].tblTimeSeries
GROUP BY 
	ID
)  T
GO
