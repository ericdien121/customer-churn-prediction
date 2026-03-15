# Customer Churn Prediction
Machine learning project that predicts whether a customer will cancel their streaming subscription using behavioral and subscription data.

This project combines **SQL analysis and gradient boosting (XGBoost)** to model customer retention and identify the key factors associated with churn.

---

## Results

| Metric | Score |
|--------|-------|
| Validation AUC | 0.942 |
| Baseline AUC (no tuning) | 0.940 |

**Key churn drivers identified:**
- High customer service inquiries (~75% churn rate for high-inquiry users)
- Low weekly hours (churned users spend ~28% less time on the platform)
- High song skip rate (strong content dissatisfaction signal)
- Frequent subscription pauses
- Free subscription type (79% churn rate vs 34% for Premium)

---

## Project Overview

Customer churn is a critical problem for subscription-based businesses. Accurately predicting which customers are likely to churn allows companies to:
- Target retention campaigns
- Improve customer experience
- Reduce revenue loss

This project builds an end-to-end pipeline combining SQL exploratory analysis and machine learning to predict churn probability based on historical customer behavior.

---

## Methods

### SQL Analysis
Business questions answered using SQLite:
- Churn rate by subscription type — Free users churn at 79% vs 34% for Premium/Family
- Churn rate by customer service inquiry level — High inquiry users churn at 3x the rate of Low
- Behavioral comparison of churned vs retained customers — weekly hours and skip rate are the strongest differentiators
- Payment plan and method breakdown — churn is consistent across payment types (~51%), showing payment method is not a driver

### Machine Learning Pipeline
1. **Exploratory Data Analysis** — visualized churn drivers across behavioral and demographic features
2. **Feature Engineering** — created behavioral ratio features from raw data
3. **Preprocessing Pipeline** — ordinal encoding, one-hot encoding, and standardization via sklearn Pipeline to prevent data leakage
4. **Model Training** — XGBoost classifier
5. **Hyperparameter Tuning** — Optuna with 50 trials and 3-fold cross-validation
6. **Evaluation** — ROC-AUC on held-out validation set
7. **Feature Importance** — identified top predictive features post-training

### Engineered Features
| Feature | Description |
|---------|-------------|
| `tenure_days` | Days since signup (converted from negative signup_date) |
| `engagement_ratio` | Unique songs / total songs played (listening diversity) |
| `playlist_share_rate` | Shared playlists / playlists created (social sharing tendency) |
| `social_engagement` | Platform friends + shared playlists |
| `notifications_per_session` | Notifications clicked / weekly hours (platform responsiveness) |

---

## Dataset

The dataset comes from the [Kaggle Streaming Subscription Churn Model competition](https://www.kaggle.com/competitions/streaming-subscription-churn-model).

| File | Rows | Description |
|------|------|-------------|
| `train.csv` | 125,000 | Training data with churn labels |
| `test.csv` | 75,000 | Test data for predictions |

**Dataset files are not included in this repository.** Download them directly from Kaggle:
- `train.csv`: https://www.kaggle.com/competitions/streaming-subscription-churn-model/data?select=train.csv
- `test.csv`: https://www.kaggle.com/competitions/streaming-subscription-churn-model/data?select=test.csv

Place both files in the root directory before running the notebooks.

---

## Repository Structure

```
customer-churn-prediction/
│
├── Churn Model.ipynb                                                
├── Customer Churn Prediction with SQL & Machine Learning.ipynb     
├── sql/
│   ├── churn_by_subscription_type.sql                  
│   ├── churn_by_service_inquiries.sql                  
│   ├── churned_vs_retained_behavior.sql                
│   └── churn_by_payment.sql                            
└── README.md
```

---

## How to Run

### Prerequisites

Python 3.9+ required. Install dependencies:

```bash
pip install pandas numpy scikit-learn xgboost matplotlib seaborn optuna
```

### Steps

1. Clone the repository:
```bash
git clone https://github.com/ericdien121/customer-churn-prediction.git
cd customer-churn-prediction
```

2. Download the dataset files from Kaggle (links above) and place `train.csv` and `test.csv` in the root directory.

3. Launch Jupyter Notebook:
```bash
jupyter notebook
```

4. Run the notebooks in order:
   - `Customer Churn Prediction with SQL & Machine Learning.ipynb` — SQL analysis
   - `Churn Model.ipynb` — ML pipeline, tuning, and submission

---

## Output

Running the notebooks produces:
- SQL query results showing churn patterns across key business dimensions
- EDA visualizations showing churn drivers
- Trained XGBoost model with optimized hyperparameters
- Validation AUC score
- Feature importance plot (top 15 features)
- `submission.csv` with churn probability predictions for the test set

---

## Skills Demonstrated

- SQL querying and business analytics (SQLite)
- End-to-end ML pipeline with sklearn
- Feature engineering (behavioral ratios, tenure calculation)
- Ordinal vs nominal encoding decisions based on EDA insights
- Hyperparameter tuning with Optuna (50 trials, 3-fold CV)
- XGBoost for tabular classification
- EDA and feature importance visualization
- Data leakage prevention via sklearn Pipeline
