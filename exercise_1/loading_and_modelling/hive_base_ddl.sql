CREATE EXTERNAL TABLE Hospitals_raw (provider_id int, hospital_name string, address string, city string, state string, zipode string, county_name string, phone_no string, hospital_type string, hospital_ownership string, em_services string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

CREATE EXTERNAL TABLE Measures_raw (measure_name string, measure_id string, measure_start_qtr string, measure_start_date date, measure_end_qtr string, measure_end_date date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

CREATE EXTERNAL TABLE effective_care_raw (provider_id int, hospital_name string, address string, city string, state string, zipode string, county_name string, phone_no string, condition string, measure_id string, measure_name string, score string, sample string, footnote string, measure_start_date string, measure_end_date string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

CREATE EXTERNAL TABLE readmissions_raw (provider_id int, hospital_name string, address string, city string, state string, zipode string, county_name string, phone_no string, measure_name string, measure_id string, compared_nat string, denominator string, score string, lower_est string, higher_est string, footnote string, measure_start_date string, measure_end_date string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

CREATE EXTERNAL TABLE surveys_responses_raw (provider_id int, hospital_name string, address string, city string, state string, zipode string, county_name string, comm_w_nurses_ach string, comm_w_nurses_imp string, comm_w_nurses_dim string, comm_w_doc_ach string, comm_w_doc_imp string, comm_w_doc_dim string, comm_w_hos_staff_ach string, comm_w_hos_staff_imp string, comm_w_hos_staff_dim string, pain_mgmt_ach string, pain_mgmt_imp string, pain_mgmt_dim string, comm_ab_med_ach string, comm_ab_med_imp string, comm_ab_med_dim string, clean_and_quiet_ach string, clean_and_quiet_imp string, clean_and_quiet_dim string, discharge_info_ach string, discharge_info_imp string, discharge_info_dim string, overall_ach string, overall_imp string, overall_dim string, hcahps_base string, hcahps_consistency string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';