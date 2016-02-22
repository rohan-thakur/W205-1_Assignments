ADD JAR /usr/lib/hive/lib/hive-contrib.jar;
ADD JAR /usr/lib/hive/lib/hive-exec.jar;
CREATE TEMPORARY FUNCTION incr AS 'org.apache.hadoop.hive.contrib.udf.UDFRowSequence';
CREATE TABLE surveys_responses AS 
       SELECT incr() as sid, 
                        provider_id, 
                        cast(hcahps_base as int), 
                        cast(hcahps_consistency as int)
       FROM surveys_responses_raw; 
