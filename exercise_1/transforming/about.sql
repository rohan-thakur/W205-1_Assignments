CREATE TABLE about AS
SELECT a.provider_id as provider_id,
       b.sid as sid,
       a.hospital_name as hospital_name,
       cast(b.hcahps_base as int) as hcahps_base,
       cast (b.hcahps_consistency as int) as hcahps_consistency
FROM hospitals a LEFT JOIN surveys_responses b ON a.provider_id=b.provider_id;
