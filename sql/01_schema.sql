CREATE DATABASE if not exists fraud_analysis_db;
USE fraud_analysis_db;

CREATE TABLE if not exists users (
    user_id INT PRIMARY KEY
);

CREATE TABLE if not exists transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    transaction_amount INT,
    transaction_date DATE,
    city VARCHAR(50),
    merchant_category VARCHAR(50),
    is_international TINYINT,
    previous_failed_attempts INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE if not exists fraud_predictions (
    transaction_id INT PRIMARY KEY,
    fraud_flag TINYINT,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);