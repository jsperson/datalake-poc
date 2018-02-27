select from_unixtime(row_timestamp/1000) as timestamp_without_ms
, cast(date_add('millisecond',row_timestamp % 1000, from_unixtime(row_timestamp/1000)) as timestamp) as timestamp_with_ms
, cast(row_timestamp as varchar(30))
from example_stock_ticker_raw
order by 1 desc