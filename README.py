
# min-travelers README

# import necessary packages
# Load the Dataset into Pandas:
#   *Open and Read the csv file
# Clean the Dataset:
#   *Make column names into strings and remove white space
#   *Create a new table with columns only relevant to recognition phase
#   *Drop all rows where phase_id is not recog_random or recog_ordered
#   *Drop NaN values
# Determine whether response is a Hit or False Alarm
#   *create an empty column
#   *when studied and sure/maybe/guess old, = HIT in a new column
#   *when lure and sure/maybe/guess new, = HIT in a new column
#   *when studied and sure/maybe/guess new, = False alarm in a new column
#   *when lure and sure/maybe/guess old, = False alarm in a new column
#   *alternatively, could this become a boolean mask where TRUE = hit?
# Create a function that will repeat this for all mascot videos
# Calculate the “Hit Rate” per mascot video, make it its own series.
#   *determine the number of participant responses per mascot video
#   *divide total Hit by total number of responses
# Create a new df indexed by mascot video w/ columns: HR, phase_id, mascot
# Visualize this data in a graph... bar graph?
# Calculate the average HR per mascot
# Create a new series w/ mascot and respective avg. HR
# Visualize this data graphically... again by bar graph?
# Create a Mixed effect model: HR ~ mascot, phase_id



