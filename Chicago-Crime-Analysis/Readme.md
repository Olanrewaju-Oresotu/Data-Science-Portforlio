# Chicago Crime Dataset Analysis

This notebook serves as an introductory exploration of data analysis using Apache Spark and Python, focusing on a real-world dataset.

In this notebook, I utilize a combination of Apache Spark, Pandas, Matplotlib, and Seaborn for various data processing and visualization tasks. The primary objectives are as follows:

- Conduct data reading, transformation, and querying using Apache Spark.
- Visualize data using Python libraries, predominantly Seaborn while occasionally utilizing Matplotlib.
- Employ Pandas and NumPy for tasks that require seamless interoperability between Spark and Matplotlib.

Please note that this notebook is a work in progress, and I anticipate refining it in the coming weeks to improve its overall structure and clarity.

## Data Source

The dataset used for this analysis can be accessed from two different locations:

- Original dataset website: [Chicago Police Department - Illinois Uniform Crime Reporting (IUCR) Statistics](https://data.cityofchicago.org/Public-Safety/Chicago-Police-Department-Illinois-Uniform-Crime-R/c7ck-438e)
- Kaggle dataset: [Chicago Crime Data Analysis](https://www.kaggle.com/djonafegnem/chicago-crime-data-analysis) (I have used this compressed archive for convenience)

## Running the Notebook

This notebook was developed using Apache Spark version 2.3.0 and executed on a single machine using the `pyspark` shell without any issues. To run this notebook, follow these steps:

1. Download Apache Spark from the official website: [Apache Spark Downloads](https://spark.apache.org/downloads.html).

2. Ensure that you have Pandas, NumPy, Matplotlib, and other necessary libraries installed. If you haven't already, consider using Anaconda for simplified package management: [Anaconda Downloads](https://www.anaconda.com/download/).

Here are some important parameters to consider:

- Executor count: 4
- Executor Memory: 4G
- Driver Memory: 8G

While these parameters may not be universally necessary, it's worth noting that caching RDDs can significantly boost performance. The notebook was launched using the following command:

```shell
pyspark --driver-memory 8g --executor-memory 4g --master local[4]
```

By following these instructions, you can run this notebook and explore the analysis of the Chicago crime dataset using Apache Spark and Python.
