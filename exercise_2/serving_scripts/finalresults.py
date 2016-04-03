import sys
import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv)==1:
    cur.execute("SELECT * FROM tweetwordcount order by count, word")
    rows=cur.fetchall()
    count=0
    result_string = ""
    for row in rows:
        count+=1 
        if (count<len(rows)):
            result_string += "(" + row[0] + ", " + str(row[1]) + "), "
        else:
            result_string += "(" + row[0] + ", " + str(row[1]) + ")"
    print result_string
else:
    word = sys.argv[1]
    cur.execute("SELECT count FROM tweetwordcount WHERE word='%s'" % (word))
    wordcount = cur.fetchone()
    result = 0 if wordcount is None else wordcount[0]
    print "Total number of occurences of \'"+word+"\': "+ str(result)
        
