CREATE DATABASE tcount;
\c tcount;
CREATE TABLE tweetwordcount
       (word TEXT PRIMARY KEY NOT NULL,
       count INT NOT NULL);