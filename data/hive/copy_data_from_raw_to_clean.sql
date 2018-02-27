Note: these work in hive only
Copy data and partition on the fly
insert overwrite table hmda_lar_snappy partition (as_of_year) select * from hmda_lar;


set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE example_stock_ticker partition (record_date) SELECT 
FROM_UTC_TIMESTAMP(row_timestamp,'UTC') AS row_timestamp 
, ticker
, sector
, change
, price
, DATE_FORMAT(FROM_UTC_TIMESTAMP(row_timestamp,'UTC'),'YYYYMMdd') AS record_date
FROM stock_ticker.example_stock_ticker_raw;