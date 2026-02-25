/* =========================================================
   BUSINESS PROBLEM:
   Analyze fraudulent transactions to measure risk, loss,
   and identify high-risk patterns for decision-making.
   ========================================================= */

/* 1. Total number of transactions
   Business Question:
   How many total transactions are processed?
*/
SELECT COUNT(*) AS total_transactions
FROM transactions;

/* 2. Total fraud transactions
   Business Question:
   How many transactions are flagged as fraud?
*/
SELECT COUNT(*) AS fraud_transactions
FROM fraud_predictions
WHERE fraud_flag = 1;

/* 3. Fraud rate percentage
   Business Question:
   What percentage of transactions are fraudulent?
*/
SELECT 
    (SUM(fraud_flag) / COUNT(*)) * 100 AS fraud_rate_percent
FROM fraud_predictions;

/* 4. Total fraud loss
   Business Question:
   How much money is lost due to fraud?
*/
SELECT SUM(t.transaction_amount) AS total_fraud_loss
FROM transactions t
JOIN fraud_predictions f
ON t.transaction_id = f.transaction_id
WHERE f.fraud_flag = 1;

/* 5. Fraud by city
   Business Question:
   Which cities have the highest fraud cases?
*/
SELECT t.city, COUNT(*) AS fraud_count
FROM transactions t
JOIN fraud_predictions f
ON t.transaction_id = f.transaction_id
WHERE f.fraud_flag = 1
GROUP BY t.city
ORDER BY fraud_count DESC;

/* 6. High-risk transactions
   Business Question:
   Which high-value fraudulent transactions need attention?
*/
SELECT 
    t.transaction_id,
    t.transaction_amount,
    t.city,
    t.merchant_category
FROM transactions t
JOIN fraud_predictions f
ON t.transaction_id = f.transaction_id
WHERE f.fraud_flag = 1
AND t.transaction_amount > 100000;

/* 7. Fraud by international transactions
   Business Question:
   Is fraud higher in international transactions?
*/
SELECT 
    t.is_international,
    COUNT(*) AS fraud_count
FROM transactions t
JOIN fraud_predictions f
ON t.transaction_id = f.transaction_id
WHERE f.fraud_flag = 1
GROUP BY t.is_international;