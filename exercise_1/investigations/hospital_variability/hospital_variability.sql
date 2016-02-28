--Measuring variability by each procedure, along with average and aggregate scores
SELECT measure_id,
       measure_name,
       SUM(score) as agg_score,
       AVG(score) as avg_score,
       MAX(score) - MIN(score) as variability 
FROM provides
WHERE score IS NOT NULL AND measure_id IS NOT NULL
GROUP BY measure_id, measure_name
ORDER BY variability DESC
LIMIT 10;