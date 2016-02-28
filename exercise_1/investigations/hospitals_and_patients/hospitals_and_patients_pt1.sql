--Creating temp table to get all scores together
CREATE TABLE temp AS
SELECT a.provider_id,
       AVG(a.score) as avg_score,
       MAX(a.score) - MIN(a.score) as variability,
       b.hcahps_consistency as survey_score
FROM provides a LEFT JOIN about b ON a.provider_id = b.provider_id
WHERE a.score IS NOT NULL
GROUP BY a.provider_id, b.hcahps_consistency;

--Finding Correlation between variability and survey_score
SELECT CORR(avg_score, survey_score) 
FROM temp;