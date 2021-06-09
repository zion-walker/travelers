# min-travelers README

# import necessary packages
# Load the Dataset into Pandas:
#   *Open and Read the csv file
# Clean the Dataset:
#   *Make column names into strings and remove white space
#   *Create a new table with columns only relevant to retrieval phase
#   *Drop all rows where phase_id is not recog_random or recog_ordered
#   *Drop NaN values
# Visualizing the data in a table:

#seperate into two tables by phase_id
#you should be able to drop public ID
#trying to look at all responses for a single video
# rename response column and stim_type name to indicate video
#drop mascot name and vid context

#createa a function that will repeat this for all mascots
# create a function that will add these new dfs as columns to create a new table.

# determine whether response is a Hit or False Alarm
#   *create an empty column
#   *when studied and sure/maybe/guess old, = HIT in a new column
#   *when lure and sure/maybe/guess new, = HIT in a new column
#   *when studied and sure/maybe/guess new, = False alarm in a new column
#   *when lure and sure/maybe/guess old, = False alarm in a new column
#   *alternatively, could this become a boolean mask where TRUE = hit?

#Create a new table from data: columns: individual video, row: participant response
#Determine the number of participant responses per mascot video
#Identify the number of “Hit” per mascot video
#Calculate the “Hit Rate” per mascot video
#Merge mascot video HR data so that columns: mascot, row: HR
#Calculate the average HR per mascot
#Mixed effect model w/ HR, mascot, and condition



