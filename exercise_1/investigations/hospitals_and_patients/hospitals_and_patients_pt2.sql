--Finding Correlation between variability and survey_score
SELECT CORR(variability, survey_score) 
FROM temp;

DROP TABLE temp;