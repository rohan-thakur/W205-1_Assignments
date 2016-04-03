source /opt/py27environment/bin/activate

#Assume postgres + streamparse set up on AMI
/data/start_postgres.sh
psql -U postgres

#run initial_create.sql

#copy over project EXTweetwordcount
sparse run

