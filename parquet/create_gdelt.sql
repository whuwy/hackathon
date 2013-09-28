
DROP TABLE IF EXISTS gdelt_historical_raw;

CREATE EXTERNAL TABLE gdelt_historical_raw
(
  GLOBALEVENTID BIGINT, 
  SQLDATE STRING, 
  MonthYear STRING, 
  Year STRING, 
  FractionDate DOUBLE, 
  Actor1Code STRING, 
  Actor1Name STRING, 
  Actor1CountryCode STRING, 
  Actor1KnownGroupCode STRING, 
  Actor1EthnicCode STRING, 
  Actor1Religion1Code STRING, 
  Actor1Religion2Code STRING, 
  Actor1Type1Code STRING, 
  Actor1Type2Code STRING, 
  Actor1Type3Code STRING, 
  Actor2Code STRING, 
  Actor2Name STRING, 
  Actor2CountryCode STRING, 
  Actor2KnownGroupCode STRING, 
  Actor2EthnicCode STRING, 
  Actor2Religion1Code STRING, 
  Actor2Religion2Code STRING, 
  Actor2Type1Code STRING, 
  Actor2Type2Code STRING, 
  Actor2Type3Code STRING, 
  IsRootEvent INT, 
  EventCode STRING, 
  EventBaseCode STRING, 
  EventRootCode STRING, 
  QuadClass INT, 
  GoldsteinScale DOUBLE, 
  NumMentions INT, 
  NumSources INT, 
  NumArticles INT, 
  AvgTone DOUBLE, 
  Actor1Geo_Type INT, 
  Actor1Geo_FullName STRING, 
  Actor1Geo_CountryCode STRING, 
  Actor1Geo_ADM1Code STRING, 
  Actor1Geo_Lat FLOAT, 
  Actor1Geo_Long FLOAT, 
  Actor1Geo_FeatureID INT, 
  Actor2Geo_Type INT, 
  Actor2Geo_FullName STRING, 
  Actor2Geo_CountryCode STRING, 
  Actor2Geo_ADM1Code STRING, 
  Actor2Geo_Lat FLOAT, 
  Actor2Geo_Long FLOAT, 
  Actor2Geo_FeatureID INT, 
  ActionGeo_Type INT, 
  ActionGeo_FullName STRING, 
  ActionGeo_CountryCode STRING, 
  ActionGeo_ADM1Code STRING, 
  ActionGeo_Lat FLOAT, 
  ActionGeo_Long FLOAT, 
  ActionGeo_FeatureID INT, 
  DATEADDED INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/user/ubuntu/gdelt_historical_tsv';


DROP TABLE IF EXISTS gdelt_dailyupdates_raw;

CREATE EXTERNAL TABLE gdelt_dailyupdates_raw
(
  GLOBALEVENTID BIGINT, 
  SQLDATE STRING, 
  MonthYear STRING, 
  Year STRING, 
  FractionDate DOUBLE, 
  Actor1Code STRING, 
  Actor1Name STRING, 
  Actor1CountryCode STRING, 
  Actor1KnownGroupCode STRING, 
  Actor1EthnicCode STRING, 
  Actor1Religion1Code STRING, 
  Actor1Religion2Code STRING, 
  Actor1Type1Code STRING, 
  Actor1Type2Code STRING, 
  Actor1Type3Code STRING, 
  Actor2Code STRING, 
  Actor2Name STRING, 
  Actor2CountryCode STRING, 
  Actor2KnownGroupCode STRING, 
  Actor2EthnicCode STRING, 
  Actor2Religion1Code STRING, 
  Actor2Religion2Code STRING, 
  Actor2Type1Code STRING, 
  Actor2Type2Code STRING, 
  Actor2Type3Code STRING, 
  IsRootEvent INT, 
  EventCode STRING, 
  EventBaseCode STRING, 
  EventRootCode STRING, 
  QuadClass INT, 
  GoldsteinScale DOUBLE, 
  NumMentions INT, 
  NumSources INT, 
  NumArticles INT, 
  AvgTone DOUBLE, 
  Actor1Geo_Type INT, 
  Actor1Geo_FullName STRING, 
  Actor1Geo_CountryCode STRING, 
  Actor1Geo_ADM1Code STRING, 
  Actor1Geo_Lat FLOAT, 
  Actor1Geo_Long FLOAT, 
  Actor1Geo_FeatureID INT, 
  Actor2Geo_Type INT, 
  Actor2Geo_FullName STRING, 
  Actor2Geo_CountryCode STRING, 
  Actor2Geo_ADM1Code STRING, 
  Actor2Geo_Lat FLOAT, 
  Actor2Geo_Long FLOAT, 
  Actor2Geo_FeatureID INT, 
  ActionGeo_Type INT, 
  ActionGeo_FullName STRING, 
  ActionGeo_CountryCode STRING, 
  ActionGeo_ADM1Code STRING, 
  ActionGeo_Lat FLOAT, 
  ActionGeo_Long FLOAT, 
  ActionGeo_FeatureID INT, 
  DATEADDED INT,
  SOURCEURL STRING 
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/user/ubuntu/gdelt_dailyupdates_tsv';

SET PARQUET_COMPRESSION_CODEC=snappy;

DROP TABLE IF EXISTS gdelt;

CREATE TABLE gdelt LIKE gdelt_dailyupdates_raw STORED AS PARQUETFILE;

INSERT INTO gdelt SELECT  
 GLOBALEVENTID, 
 SQLDATE, 
 MonthYear, 
 Year, 
 FractionDate, 
 Actor1Code, 
 Actor1Name, 
 Actor1CountryCode, 
 Actor1KnownGroupCode, 
 Actor1EthnicCode, 
 Actor1Religion1Code, 
 Actor1Religion2Code, 
 Actor1Type1Code, 
 Actor1Type2Code, 
 Actor1Type3Code, 
 Actor2Code, 
 Actor2Name, 
 Actor2CountryCode, 
 Actor2KnownGroupCode, 
 Actor2EthnicCode, 
 Actor2Religion1Code, 
 Actor2Religion2Code, 
 Actor2Type1Code, 
 Actor2Type2Code, 
 Actor2Type3Code, 
 IsRootEvent, 
 EventCode, 
 EventBaseCode, 
 EventRootCode, 
 QuadClass, 
 GoldsteinScale, 
 NumMentions, 
 NumSources, 
 NumArticles, 
 AvgTone, 
 Actor1Geo_Type, 
 Actor1Geo_FullName, 
 Actor1Geo_CountryCode, 
 Actor1Geo_ADM1Code, 
 Actor1Geo_Lat, 
 Actor1Geo_Long, 
 Actor1Geo_FeatureID, 
 Actor2Geo_Type, 
 Actor2Geo_FullName, 
 Actor2Geo_CountryCode, 
 Actor2Geo_ADM1Code, 
 Actor2Geo_Lat, 
 Actor2Geo_Long, 
 Actor2Geo_FeatureID, 
 ActionGeo_Type, 
 ActionGeo_FullName, 
 ActionGeo_CountryCode, 
 ActionGeo_ADM1Code, 
 ActionGeo_Lat, 
 ActionGeo_Long, 
 ActionGeo_FeatureID, 
 DATEADDED,
 "" as SOURCEURL
FROM gdelt_historical_raw;
 
INSERT INTO TABLE gdelt_dailyupdates SELECT * FROM gdelt_dailyupdates_raw;



