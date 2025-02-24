select name from customer
where ifnull(referee_id,0) != '2'


select tweet_id from Tweets
where length(content) > 15