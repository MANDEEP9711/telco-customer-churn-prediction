import pandas as pd
def load_data(path):
    return pd.read_csv(path)

import os
path=os.getcwd() + "/telco-customer-churn-prediction/data/raw-data/raw_data.csv"

# Load the CSV into a DataFrame
df = load_data(path)
def inspect_data(df):
    print("Shape:", df.shape)
    print("\nMissing values:")
    print(df.isnull().sum())
    print("\nData types:")
    print(df.dtypes)
    
import subprocess
import sys

from pathlib import Path
import subprocess
import sys

PROJECT_ROOT = Path(__file__).resolve().parent.parent

notebooks = [
    PROJECT_ROOT / "notebook" / "01_data_understanding.ipynb",
    PROJECT_ROOT / "notebook" / "02_eda.ipynb",
    PROJECT_ROOT / "notebook" / "03_model_training.ipynb",
]

def execute_notebooks(notebooks):
    for notebook in notebooks:
        if not notebook.exists():
            raise FileNotFoundError(f"Notebook not found: {notebook}")

        subprocess.run(
            [
                sys.executable,
                "-m", "nbconvert",
                "--to", "notebook",
                "--execute",
                "--inplace",
                str(notebook),
            ],
            check=True,
            cwd=str(PROJECT_ROOT),
        )
