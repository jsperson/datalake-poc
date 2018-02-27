CREATE EXTERNAL TABLE example_stock_ticker_raw(
   row_timestamp string
,  ticker varchar(10)
,  sector varchar(50)
,  change decimal(10,2)
,  price decimal(10,2)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION
  's3://datalake-poc-data/feeds/stock_ticker/example/raw/csv'
  TBLPROPERTIES (
  'hive.input.dir.recursive' = 'TRUE', 
    'hive.mapred.supports.subdirectories' = 'TRUE',
    'hive.supports.subdirectories' = 'TRUE', 
    'mapred.input.dir.recursive' = 'TRUE')