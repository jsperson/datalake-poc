CREATE EXTERNAL TABLE example_stock_ticker(
row_timestamp TIMESTAMP
, ticker VARCHAR(10)
, sector VARCHAR(50)
, change DECIMAL(10,2)
, price DECIMAL(10,2)
  )
PARTITIONED BY ( 
  record_date string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  's3://datalake-poc-data/feeds/stock_ticker/example/clean/orc'
TBLPROPERTIES (
  'orc.compress'='snappy')
