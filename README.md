# NBA Data Analysis and Prediction 
Python script for analyzing and predicting NBA team and player valuations based on various factors such as attendance, endorsements, salaries, and performance metrics and incoorporates R as well for advanced Visualizations.

## Repository Structure

- `plot_team_cluster_R.R`: R script for clustering NBA teams based on various performance metrics.
- `Rstudio.R`: General R scripts for data manipulation and preliminary data analysis.
- `basketball_ref.ipynb`: Jupyter notebook analyzing data scraped from basketball-reference.com.
- `players_evaluation_nba.ipynb`: Notebook for detailed player performance and metric analysis.
- `team_evaluation_nba.ipynb`: Notebook for assessing team performance across different seasons.

## Libraries Used
The script uses the following Python libraries:

- pandas: for data manipulation and analysis
- statsmodels: for statistical modeling
- matplotlib: for data visualization
- seaborn: for data visualization
- stathelper: for statistical Calculations

Packeges for R:
- install.packages("tidyverse")
- install.packages("dplyr")
- install.packages("ggplot2")
- install.packages("cluster")
## Key Features

### Comprehensive Data Analysis
- **Player Evaluation**: Analyze individual player performance using both basic and advanced metrics to assess contributions and efficiency such as USG_PCT,TS_PCT,OFF_RATING, W_PCT etc.
- **Team Performance Assessment**: Evaluate team success and strategic effectiveness using statistical performance comparisons.

### Clustering and Segmentation
- **Team Clustering**: K-means and hierarchical clustering to categorize NBA teams based on *Elbow Method* and various plots.
- **Player Clustering**: Meaningful groups based on performance metrics.

### Data Visualization
- **Diverse Visualization Tools**: Leverage histograms, PCA scatter plots, and dendrograms to provide clear and insightful visual representations of complex datasets.
- **Interactive Visual Analysis**: Employed interactive plots(ggplot,px) to dynamically explore correlations and distributions within the data.

### Statistical Modeling and Machine Learning
- **Dimensionality Reduction**: Applied PCA to distill important information from numerous statistical metrics.
- **Clustering Algorithms**: Implement K-means clustering to uncover groupings in the data that reveal hidden patterns and validates the PCA results.

### Cross-language Integration
- **Python and R Integration**: Combine the statistical and graphical power of R with Python's robust data manipulation and machine learning capabilities to enhance analytical robustness.


# Usage
To run the script, make sure you have the required Python and R libraries installed and the data files in the data/ directory. Then, simply run the script, and it will execute the analysis and prediction steps.

# Future Updates
- Create a Script to keep the data scrapping from same sources anytime.
- Deploy all the Visualizations in Cloud.


