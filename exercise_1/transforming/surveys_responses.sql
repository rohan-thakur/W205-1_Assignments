--Adding UDF functions to create a unique autoincrementing primary key on surveys_responses.
ADD JAR /usr/lib/hive/lib/hive-contrib.jar;
ADD JAR /usr/lib/hive/lib/hive-exec.jar;
CREATE TEMPORARY FUNCTION incr AS 'org.apache.hadoop.hive.contrib.udf.UDFRowSequence';

--Creating the surveys_reponses table, and only preserving scores we may be interested in
CREATE TABLE surveys_responses AS 
       SELECT incr() as sid, 
                        provider_id, 
                        cast(hcahps_base as int), 
                        cast(hcahps_consistency as int)
       FROM surveys_responses_raw; 
