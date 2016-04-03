import sys
import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv)==1:
    print "Please give two arguments to the script"
else:
    lower = sys.argv[1]
    upper = sys.argv[2]
    cur.execute("SELECT * FROM tweetwordcount WHERE count BETWEEN %s and %s ORDER BY count desc" % (lower,upper))
    rows = cur.fetchall()
    for row in rows:
        print row[0] + ": " + str(row[1])
