CREATE EXTERNAL TABLE race_by_state_big(
   location varchar(50)
,  white decimal(3,2)
,  black decimal(3,2)
,  hispanic decimal(3,2)
,  asian decimal(3,2)
,  american_indian decimal(3,2)
,  pacific_islander decimal(3,2)
,  two_or_more decimal(3,2)
,  total decimal(3,2)
, as_of_year string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION
  's3://datalake-poc-data/users/sperson/race_by_state_big/csv'
TBLPROPERTIES (
  'skip.header.line.count'='1')