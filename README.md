
# Evreka Data Engineer Assessment - Target Case 1

## Project Overview
This project addresses the requirements for the Evreka Data Engineer Assessment, including anomaly detection in distance data for different routes.

### Objectives
1. **Detect and Visualize Anomalies**: Identify resets, large distance jumps, and irregular time intervals in the navigation data.
2. **Calculate Total Distance and Duration**: Provide a SQL query to calculate cumulative distance and duration for each route while handling resets.
3. **Provide Visualizations**: Generate plots to highlight data distribution, anomaly frequency, and complex anomaly types.

### Repository Structure
```
evreka-data-engineer-assessment/
│
├── README.md                     # Overview of the project and instructions
├── data/
│   └── navigation_records.csv    # Original data file
├── sql/
│   └── calculate_total_distance_duration.sql  # SQL query for distance and duration calculation
├── analysis/
│   ├── anomaly_detection.py      # Python code for data analysis and anomaly detection
│   ├── anomaly_detection.ipynb   # Jupyter Notebook with findings, graphs, and code
│   └── graphs/
│       ├── all_anomalies.png     # Visualization of all detected anomalies
│       ├── complex_anomalies.png # Complex anomaly visualizations
│       ├── distance_distribution.png # Distance distribution plot
│       └── reset_frequency.png   # Reset frequency per route plot
└── requirements.txt              # Python dependencies for the project
```

### Insights and Findings

#### 1. Anomaly Detection
- **Resets**: Detected cases where the cumulative distance dropped unexpectedly, likely due to network or device issues.
- **Large Distance Jumps**: Identified unusually large increases in distance values, possibly indicating sensor errors.
- **Irregular Time Gaps**: Found instances with irregular time intervals, which could suggest missed readings or interruptions.

#### 2. SQL Query for Total Distance and Duration
- The SQL query accurately computes total distance and duration per route by handling distance resets. It calculates the maximum cumulative distance in each segment, grouped by `route_id`, and sums the durations between valid records.

#### 3. Key Visualizations
- **Distribution of Distances**: Showed the overall spread of distance values with anomalies marked in red, highlighting outliers.
- **All Detected Anomalies**: Mapped anomalies across routes, visually confirming patterns in resets, jumps, and time irregularities.
- **Reset Frequency**: Displayed the frequency of resets for each route, with some routes experiencing higher reset rates, suggesting recurrent data issues.

### Instructions
1. **SQL Query**: The SQL query for calculating total distance and duration is located in the `sql/` directory.
2. **Python Analysis**: Run the analysis by executing the `anomaly_detection.py` file or view the Jupyter Notebook `anomaly_detection.ipynb`.
3. **Visualizations**: Visualizations are saved as PNG files in the `analysis/graphs/` folder.

## Requirements
Install the necessary Python packages using:
```
pip install -r requirements.txt
```

---

We hope this project meets your expectations!
