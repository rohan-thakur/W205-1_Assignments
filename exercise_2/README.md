# Exercise 2: 

##Initial Setup:

The exercise is run on the UCB W205 Spring Ex 2 Image AMI (ami-4cf9f826), and assumes installation of postgres (this may be done by simply mounting the EBS volume in the /data directory.

##Instructions to run the application:

1. Copy over the EXTweetwordcount and the serving_scripts directories from this submission
2. Run the following command to start the correct python environment - 'source /opt/py27environment/bin/activate'
2. Start Postgres: /data/start_postgres.sh
3. Log in to the postgres database by typing the following command: 'psql -U postgres'
4. Create the initial database by running the provided file: '\i Initial_create.sql'
5. Exit Postgres using \q
6. Now, go into the EXTweetwordcount, our Storm application: cd EXTweetwordcount
7. Run the application with 'sparse run'. You should see a stream of words being added into the Database. You can stop the stream at any time using Ctrl + c. Please note that the application can be run as many times as needed, and the database will be updated, not set back to 0.
8. When you finally stop the stream, you can go to the serving scripts in the serving_scripts folder, and run them with the correct arguments in order to get the results. Eg.: 
  * 'histogram.py 5 10' - Returns words occuring between 5 and 10 times inclusive of both aguments, sorted by descending count 
  * 'finalresults.py hello' - Returns the number of times the word 'hello' occurs 
  * 'finalresults.py' - Returns counts of all words, sorted in ascending order of count, then alphabetically.
9. An image of the plot with 20 most frequent words is provided. However, the script generating this plot is also provided in the serving_scripts folder, so you can generate the plot yourself. You simply need to run 'plot.py' and it will generate 'Plot.png' in the same directory
