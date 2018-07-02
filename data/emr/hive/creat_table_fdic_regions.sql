CREATE EXTERNAL TABLE fdic_regions(
state_abbreviation varchar(2),
region_name varchar(50))
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ( 
  'quoteChar'='\"', 
  'separatorChar'=',') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://datalake-poc-data/curated/utility_tables/fdic_regions/csv'
TBLPROPERTIES (
  'serialization.null.format'='', 
  'skip.header.line.count'='1')