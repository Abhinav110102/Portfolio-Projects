-- Step1: Create the Table

IF OBJECT_ID('Raw_Data_GDP') IS NOT NULL DROP TABLE Raw_Data_GDP

CREATE TABLE Raw_Data_GDP
(DEMO_IND NVARCHAR(200),
Indicator NVARCHAR(200),
[LOCATION] NVARCHAR(200),
Country NVARCHAR(200),
[TIME] NVARCHAR(200),
[Value] FLOAT,
[Flag Codes] NVARCHAR(200),
Flags NVARCHAR(200)
)

-- SELECT * FROM Raw_Data_GDP

-- Step 2: Import the Data

BULK INSERT Raw_Data_GDP
FROM "C:\Users\abhin\Desktop\Projects\Power BI Projects\Power BI Project 4\gdp_raw_data.csv"
WITH (FORMAT='CSV');

-- SELECT * FROM Raw_Data_GDP

-- Step 3: Create the view we need - This is a "One off"
--/*
-- DROP VIEW GDP_Excel_Input

CREATE VIEW GDP_Excel_Input AS

SELECT a.*,b.GDP_Per_Capita FROM

	(SELECT Country, [TIME] AS Year_No, [Value] as GDP_Value FROM Raw_Data_GDP
	 WHERE Indicator = 'GDP (current US$)') a
	
	LEFT JOIN
	(SELECT Country, [TIME] AS Year_No, [Value] AS GDP_Per_Capita FROM Raw_Data_GDP
	WHERE Indicator = 'GDP per capita (current US$)') b
	ON a.Country = b.Country and a.Year_No = b.Year_No

-- SELECT DISTINCT Indicator FROM Raw_Data_GDP
-- SELECT * from GDP_Excel_Input
--*/
--STEP 4: Creating a Store Procedure


CREATE PROCEDURE GDP_Excel_Input_Monthly AS

IF OBJECT_ID('Raw_Data_GDP') IS NOT NULL DROP TABLE Raw_Data_GDP

CREATE TABLE Raw_Data_GDP
(DEMO_IND NVARCHAR(200),
Indicator NVARCHAR(200),
[LOCATION] NVARCHAR(200),
Country NVARCHAR(200),
[TIME] NVARCHAR(200),
[Value] FLOAT,
[Flag Codes] NVARCHAR(200),
Flags NVARCHAR(200)
)

-- Step 2: Import the Data

BULK INSERT Raw_Data_GDP
FROM "C:\Users\abhin\Desktop\Projects\Power BI Projects\Power BI Project 4\gdp_raw_data.csv"
WITH (FORMAT='CSV');

-- EXEC GDP_Excel_Input_Monthly