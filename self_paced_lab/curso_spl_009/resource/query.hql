INSERT OVERWRITE DIRECTORY '${OUTPUT}/os_requests/'
SELECT
  os,
  COUNT(*) count
FROM cloudfront_logs
WHERE dateobject
BETWEEN '2014-07-05' AND '2014-08-05'
GROUP BY os;