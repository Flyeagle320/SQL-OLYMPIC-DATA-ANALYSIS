/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ID]
      ,[Name] AS ' Competitor Name' -- Column Renamed--
      , CASE WHEN Sex = 'M' then 'Male' Else 'Female' End as Sex -- Better name for filters and visualisations-- 
      ,[Age]
	  ,case when [Age] < 18 then 'Under 18'
	  When [Age] Between 18 and 25 Then '18-25'
	  When[Age] Between 25 and 30 Then '25-30'
	  When[Age] >30 Then 'Over 30'
	  End as [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] As 'Nation Code' 
   --   ,CHARINDEX (' ',Games) - 1 AS 'Example 1'
	--  ,CHARINDEX(' ', Reverse(Games))-1 as 'Example 2'
	  , Left(Games, Charindex(' ',Games) -1) as 'Year' -- Split columns to get year wrt Season --
	--  ,[Games]
      ,--[City]-- not required as we need only country--
      [Sport]
      ,[Event]
      ,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal -- NA WILL BE REPLACED AS NOT REGISTERED--
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) = 'Summer'