ADD JAR /usr/lib/hive/lib/hive-contrib.jar
ADD JAR /usr/lib/hive/lib/hive-exec.jar
CREATE TEMPORARY FUNCTION incr AS 'org.apache.hadoop.hive.contrib.udf.UDFRowSequence';
CREATE TABLE surveys_responses AS SELECT incr() as sid, provider_id, hcahps_base, hcahps_consistency FROM surveys_responses_raw; 
