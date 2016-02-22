SELECT provider_id,
       hospital_name,
       SUM(score) as agg_score,
       AVG(score) as avg_score,
       MAX(score) - MIN(score) as variability 
FROM provides
WHERE score IS NOT NULL
GROUP BY provider_id, hospital_name
ORDER BY avg_score DESC
LIMIT 10;