import pandas as pd
import numpy as np

print('packages successfully imported')

# Read the datafile
seqlearn_table = pd.read_csv("10_subject_data.csv")

# Remove white spaces in the column names and make them into strings
seqlearn_table.columns = seqlearn_table.columns.str.replace(' ', '_')

# selecting relevant columns
df = seqlearn_table.loc[:, ["phase_id", "mascot_name", "video_context", "Response", 'stim_type']]

# dropping all columns except recog_random and recog_ordered
data_recog = df[(df.phase_id == "recog_random") | (df.phase_id == "recog_ordered")]

# Dropping NaN values
clean_data_recog = data_recog.dropna()
print('clean_data_recog is the clean dataframe')

# look at the number of different kinds of responses across participants
test = clean_data_recog.groupby(['video_context', 'stim_type'])['Response'].value_counts()

#  How do you render tables in python?
# When stim_type = studied and response is sure/maybe/guess old, add value 'hit' in the same row in a new column

recog_test_data = pd.DataFrame(clean_data_recog, columns = ['Response', 'stim_type', 'video_context', 'response_type'])
recog_test_data['response_type'] = np.where((recog_test_data['stim_type'] == 'studied') & ((recog_test_data['Response'] == 'sure old') | (recog_test_data['Response'] == 'maybe old') | (recog_test_data['Response'] == 'guess old')), True, False)

# Add hits to the new column
recog_test_data['response_type'] = recog_test_data['response_type'].replace(True, 'Hit')
recog_test_data['response_type'] = recog_test_data['response_type'].replace(False, 'Miss/FA/CR')

hit_vals = recog_test_data.groupby(['video_context'])['response_type'].value_counts()

# total number of responses per video
print(clean_data_recog['video_context'].value_counts())

# can we find a way to put both of these values into a dataframe so that we can calculate hit rate?

hit = pd.DataFrame(recog_test_data.groupby(['video_context'])['response_type'].value_counts(), columns = ['response_type', 'resp_type_total'])

# maybe I could convert the value counts of video context into their own series and then incorperate them as the next column.
# for every value corresponding to a unique video context, add to the resp_type_total column the sum
