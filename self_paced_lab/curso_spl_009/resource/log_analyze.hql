ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "^(?!#)([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+[^\(]+[\(](https://us-west-2-tcprod.s3.us-west-2.amazonaws.com/courses/spl-166/v1.0.25.prod-b15422f0/instructions/en_us/[^\;]+).*\%20([^\/]+)[\/](https://us-west-2-tcprod.s3.us-west-2.amazonaws.com/courses/spl-166/v1.0.25.prod-b15422f0/instructions/en_us/.*)$"
) LOCATION '${INPUT}/cloudfront/data/';