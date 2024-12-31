CREATE EXTERNAL TABLE IF NOT EXISTS cloudfront_logs (
DateObject Date,
Time STRING,
Location STRING,
Bytes INT,
RequestIP STRING,
Method STRING,
Host STRING,
Uri STRING,
Status INT,
Referrer STRING,
OS String,
Browser String,
BrowserVersion String
);