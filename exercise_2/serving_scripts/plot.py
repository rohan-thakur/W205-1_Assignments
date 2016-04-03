import sys
import psycopg2
import matplotlib.pyplot as plt
import numpy as np

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("SELECT * FROM tweetwordcount ORDER BY count desc LIMIT 20")
rows = cur.fetchall()
wordlist=[]
countlist=[]
for row in rows:
    wordlist.append(row[0])
    countlist.append(row[1])
x = np.arange(len(rows))
plt.bar(x, countlist)
plt.xticks(x+0.5,wordlist,rotation=90)
plt.title("Top 20 Words")
plt.xlabel("Words")
plt.ylabel("Frequency")
plt.savefig('Plot.png', bbox_inches='tight', pad_inches=0.3)
