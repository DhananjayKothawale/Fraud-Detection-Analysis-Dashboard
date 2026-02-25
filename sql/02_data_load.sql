-- STEP 1: Load unique users (staging)
CREATE TABLE if not exists temp_users (
    user_id INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fraud_transactions.csv'
INTO TABLE temp_users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  @transaction_id,
  user_id,
  @transaction_amount,
  @transaction_datetime,
  @city,
  @merchant_category,
  @is_international,
  @previous_failed_attempts,
  @fraud_flag
);

INSERT INTO users (user_id)
SELECT DISTINCT user_id FROM temp_users;

DROP TABLE temp_users;

-- STEP 2: Load transactions
DELETE FROM transactions;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fraud_transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  transaction_id,
  user_id,
  transaction_amount,
  @transaction_datetime,
  city,
  merchant_category,
  is_international,
  previous_failed_attempts,
  @fraud_flag
)
SET transaction_date = DATE(
  STR_TO_DATE(@transaction_datetime, '%Y-%m-%d %H:%i:%s.%f')
);

-- STEP 3: Load fraud flags
CREATE TABLE if not exists temp_fraud (
    transaction_id INT,
    fraud_flag TINYINT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fraud_transactions.csv'
INTO TABLE temp_fraud
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  transaction_id,
  @user_id,
  @transaction_amount,
  @transaction_datetime,
  @city,
  @merchant_category,
  @is_international,
  @previous_failed_attempts,
  fraud_flag
);

INSERT INTO fraud_predictions (transaction_id, fraud_flag)
SELECT transaction_id, fraud_flag FROM temp_fraud;

DROP TABLE temp_fraud;