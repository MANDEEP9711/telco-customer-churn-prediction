# telco-customer-churn-prediction
End-to-end customer churn prediction using machine learning
Business Problem

In this project, we are working with a telecom company that is losing customers.

Our main goal is to understand why customers are leaving the company and predict which customers are more likely to leave (churn).

We will use customer information such as their tenure, contract type, services, monthly charges, payment method, and other details to find patterns related to customer churn.

Goal

Our goal is to build a machine learning model that can:

-> Predict whether a customer will churn or not.
-> Find the main reasons behind customer churn.
-> Identify customers who have a high chance of leaving.
-> Help the company take action to keep those customers


customer-churn-project/

├── data/

│   ├── raw/

│   └── processed/

├── notebooks/ 
│   ├── 01_data_understanding.ipynb

│   ├── 02_eda.ipynb

│   ├── 03_feature_engineering.ipynb

│   └── 04_modeling.ipynb

├── src/

│   ├── preprocessing.py

│   ├── train.py

│   └── predict.py

├── models/

├── sql/

├── requirements.txt

└── README.md


### PCA Model Comparison

Applied PCA to reduce feature dimensionality and evaluated its impact on Logistic Regression performance.

**Key Findings:**
- Accuracy improved from 80% to 81%.
- Churn-class precision increased from 64% to 67%.
- Churn-class recall remained unchanged at 54%.
- Churn-class F1-score improved from 0.58 to 0.59.

**Conclusion:** PCA provided a modest improvement in overall model performance and churn-class precision. However, recall remained unchanged, indicating that further optimization is needed to identify more customers likely to churn.
