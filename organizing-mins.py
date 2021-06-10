import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

#Read the datafile
seqlearn_table = pd.read_csv("10_subject_data.csv")

# Remove white spaces in the column names and make them into strings
seqlearn_table.columns = seqlearn_table.columns.str.replace(' ', '_')
seqlearn_table.columns
