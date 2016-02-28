Explanation of ER diagram:

Explaining entities:
Hospitals: This is a self-explanatory entity for which we will keep certain distinguishing fields. Comes from Hospitals.csv
Procedures: This entity is taken from the Measures file in the database. Each item on which a hospital can be scored. Comes from Measures.csv
Surveys Responses: HCAHPS Base and Consistency scores will be the fields of interest on this entity. It has a unique primary key which will be created.
                   Comes from surveys_responses.csv

Explaining relations:
Provides: Hospitals provide procedures. Each hospital gets scored on procedures it provides. These scores will come from effective_care as well as 
          readmissions. We create a schema for the "provides" table and insert values from both effective_care as well as readmissions.
About: Though this relation does not need to be impllemented since it is a one-to-one, we implement it in order to get the hospital name field
       in alongside survey scores.


Steps to load data lake and create tables:
1. Mount your EBS volume on /data
2. Start Hadoop: /root/start-hadoop.sh
3. Start Postgres: /data/start_postgres.sh
4. Make sure you have the shell file and all sql files in /home/user/w205 with correct permissions to run from the w205 profile
5. Switch users: su - w205
6. Now, run the file: ./load_data_lake.sh
7. Run hive_base_ddl.sql

Steps to run transformations:
Make sure to run the files in the following order:
1. hospitals.sql
2. procedures.sql
3. surveys_responses.sql
4. provides.sql
5. about.sql

Rationale for transformations:
The scoring system used is simple. Since hospitals get high scores for good performance in the file effective_care.csv
and low scores for good performance in readmissions.csv, we score them based on the first score minus the second.
To achieve this, we created the schema "provides", into which we insert values for hospitals from both effective_care
and readmissions. Therefore, later on one can calculate aggregate scores from this table.

The first three questions can all be answered from the "provides" relation table. The last question about correlation
between scores on procedues and survey responses needs a join between "provides" and "about".
 
Steps to run investigations:
Run files in any order. Outputs are provided in the respective folders in .tsv format.