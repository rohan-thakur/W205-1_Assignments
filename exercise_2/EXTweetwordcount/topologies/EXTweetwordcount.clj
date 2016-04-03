(ns EXTweetwordcount
  (:use     [streamparse.specs])
  (:gen-class))

(defn EXTweetwordcount [options]
   [
    ;; spout configuration
    {"Tweet-spout" (python-spout-spec
          options
          "spouts.tweets.Tweets"
          ["tweet"]
          )
    }
    ;; bolt configuration 1
    {"Parse-tweet-bolt" (python-bolt-spec
          options
          {"Tweet-spout" :shuffle}
          "bolts.parse.ParseTweet"
          ["word"])          
    ;; bolt configuration 2
     "Count-bolt" (python-bolt-spec
          options
          {"Parse-tweet-bolt" :shuffle}
          "bolts.wordcount.WordCounter"
          ["word" "count"]
          )
    }
  ]
)
