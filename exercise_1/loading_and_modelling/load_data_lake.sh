#Starting hadoop, postgres
/root/start-hadoop.sh
/data/start_postgres.sh
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip Hospital_Revised_Flatfiles.zip -d /user/w205/hospital_compare
#Selecting files to use and stripping headers
tail -n +2 /user/w205/hospital_compare/Hospital General Information.csv > /user/w205/hospital_compare/hospitals.csv
tail -n +2 /user/w205/hospital_compare/Timely and Effective Care - Hospital.csv > /user/w205/hospital_compare/effective_care.csv
tail -n +2 /user/w205/hospital_compare/Measure Dates.csv > /user/w205/hospital_compare/Measures.csv
tail -n +2 /user/w205/hospital_compare/hvbp_hcahps_05_28_2015.csv > /user/w205/hospital_compare/surveys_responses.csv


