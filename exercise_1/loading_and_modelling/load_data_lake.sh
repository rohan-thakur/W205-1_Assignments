#!/bin/bash
#Creating main hospital_compare directoy and downloading dataset
hdfs dfs -mkdir /user/w205/hospital_compare
wget -O Hospital_Revised_Flatfiles.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
hdfs dfs -put Hospital_Revised_Flatfiles.zip /user/w205/hospital_compare
unzip Hospital_Revised_Flatfiles.zip
#Selecting files to use and stripping headers
tail -n +2 Hospital\ General\ Information.csv > hospitals.csv
tail -n +2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2 Measure\ Dates.csv > Measures.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > surveys_responses.csv
tail -n +2 Readmissions\ and\ Deaths\ -\ Hospital.csv > readmissions.csv
#Creating directories for each hive table, and placing each csv apporpriately
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put Measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
#deleting unnecessary files
find -type f -name "*.csv" -and -not -name "weblog_lab.csv" -and -not -name "userdata_lab.csv" -and -not -name "Crime_-_2001_to_present.csv" -delete
rm Hospital.pdf
rm Hospital_Revised_Flatfiles.zip
