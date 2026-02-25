# 01_data_generation.py
# ----------------------------------------
# Synthetic Fraud Transaction Data Generator
# ----------------------------------------

import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

# Set random seed for reproducibility
np.random.seed(42)

# Number of records
num_records = 450

# Generate transaction IDs
transaction_id = range(100001, 100001 + num_records)

# Generate user IDs
user_id = np.random.randint(1000, 1100, num_records)

# Transaction amount (₹100 – ₹200000)
transaction_amount = np.random.randint(100, 200001, num_records)

# Transaction dates (last 12 months)
end_date = datetime.today()
start_date = end_date - timedelta(days=365)

transaction_date = [
    start_date + timedelta(days=random.randint(0, 365))
    for _ in range(num_records)
]

# Cities
cities = [
    "Mumbai", "Delhi", "Bengaluru", "Hyderabad",
    "Chennai", "Pune", "Kolkata", "Ahmedabad"
]
city = np.random.choice(cities, num_records)

# Merchant categories
merchant_category = np.random.choice(
    ["Electronics", "Grocery", "Travel", "Clothing", "Restaurant"],
    num_records
)

# International transactions (0 = No, 1 = Yes)
is_international = np.random.choice([0, 1], num_records, p=[0.8, 0.2])

# Previous failed attempts
previous_failed_attempts = np.random.randint(0, 6, num_records)

# Fraud flag (15% fraud)
fraud_flag = np.random.choice([0, 1], num_records, p=[0.85, 0.15])

# Create DataFrame
df = pd.DataFrame({
    "transaction_id": transaction_id,
    "user_id": user_id,
    "transaction_amount": transaction_amount,
    "transaction_date": transaction_date,
    "city": city,
    "merchant_category": merchant_category,
    "is_international": is_international,
    "previous_failed_attempts": previous_failed_attempts,
    "fraud_flag": fraud_flag
})

# Save to CSV
df.to_csv("../data/fraud_transactions.csv", index=False)

print("Dataset generated successfully!")
print(df.head())