from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0].replace("'","")
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        cur.execute("SELECT count FROM tweetwordcount WHERE word='%s'" % (word))
        wordcount = cur.fetchone()
        self.counts[word] = 1 if wordcount is None else wordcount[0]+1
        
        if (self.counts[word] > 1):
            cur.execute("UPDATE tweetwordcount SET count=%s WHERE word='%s'" % (self.counts[word], word))
            conn.commit()
        else:
            cur.execute("INSERT INTO tweetwordcount (word, count) VALUES ('%s', %s)" % (word, self.counts[word]))
            conn.commit()
            
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
