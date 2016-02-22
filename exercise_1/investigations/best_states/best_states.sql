SELECT state,
       SUM(score) as agg_score,
       AVG(score) as avg_score,
       MAX(score) - MIN(score) as variability 
FROM provides
WHERE score IS NOT NULL
GROUP BY state
ORDER BY avg_score DESC
LIMIT 10;