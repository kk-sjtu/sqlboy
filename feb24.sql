select name from customer
where ifnull(referee_id,0) != '2'


select tweet_id from Tweets
where length(content) > 15


# MySQL中的left join是一种连接方式，它以左表为基准，返回左表中所有的行，同时返回右表中与左表匹配的行。如果右表中没有匹配的行，则用NULL填充。


https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=sql-free-50

#找出访问了但没有交易的客户
#需要统计每个客户这种情况发生的次数
#需要使用 LEFT JOIN 来包含所有访问记录
#需要用 GROUP BY 来统计每个客户的次数

SELECT v.customer_id ,t.transaction_id
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
where t.transaction_id is null
GROUP BY customer_id;