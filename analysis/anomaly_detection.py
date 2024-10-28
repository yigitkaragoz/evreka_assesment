
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load and preprocess data
navigation_data = pd.read_csv('navigation_records.csv')
navigation_data['recorded_at'] = pd.to_datetime(navigation_data['recorded_at'])
navigation_data.sort_values(by=['route_id', 'recorded_at'], inplace=True)

# Detect anomalies
navigation_data['time_diff'] = navigation_data.groupby('route_id')['recorded_at'].diff().dt.total_seconds()
navigation_data['reset_flag'] = navigation_data.groupby('route_id')['distance'].diff() < 0

# Plotting code for anomalies, resets, distributions
# (Additional full code would go here)
