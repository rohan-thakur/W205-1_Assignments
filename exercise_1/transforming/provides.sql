--Creating schema for provides table
CREATE TABLE provides 
(provider_id int,
 hospital_name string,
 state string,
 measure_id string,
 measure_name string,
 score decimal(8,2) 
);

--Inserting values from effective_care
INSERT INTO TABLE provides
SELECT a.provider_id,
       a.hospital_name,
       a.state,
       b.measure_id,
       b.measure_name,
       CASE WHEN a.score like 'NOT%' THEN NULL
            WHEN a.score like 'Low%' THEN 50
            WHEN a.score like 'Med%' THEN 75
            WHEN a.score like 'High%' THEN 250
            WHEN a.score like 'Very%' THEN 750
            ELSE cast(score as decimal(8,2)) END
FROM effective_care_raw a LEFT JOIN procedures b
     ON a.measure_id = b.measure_id;


--Inserting values from readmissions
INSERT INTO TABLE provides
SELECT a.provider_id,
       a.hospital_name,
       a.state,
       b.measure_id,
       b.measure_name,
       CASE WHEN a.score like 'NOT%' THEN NULL
            ELSE -cast(score as decimal(8,2)) END
FROM readmissions_raw a LEFT JOIN procedures b
     ON a.measure_id = b.measure_id;
