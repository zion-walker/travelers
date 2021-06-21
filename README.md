
# 🏖️ Travelers 🏝️ 

In this study, some mascots are encountered doing new actions in different locations each trial (ex. sleeping in a house vs. running on a baseball field vs. catching a train) whereas other mascots videos are very similar across trials (ex. doing different actions in the same shopping mall)

*are mascots that travel often more memorable than others?* 

This sub-analysis aims to address whether memory retrieval is influenced by the uniqueness of episodic events. 

### Overarching Study Description: What is seqlearn?  
The present study lead by Dr. Halle Dimsdale-Zucker aims to test whether statistical structure imposed at encoding and reinstated at retrieval can serve as a context to guide memory. We hypothesize that statistical structure facilitates learning, and maintaining statistical regularities at retrieval improves memory performance.

I will be determining the memorability of specific mascot videos by comparing the rates of correctly identifying studied videos as “old” vs. incorrectly judging unstudied videos as “old” across participants.

<img alt="Python" src="https://img.shields.io/badge/python-%2314354C.svg?style=for-the-badge&logo=python&logoColor=white"><img alt="Jupyter" src="https://img.shields.io/badge/Jupyter-%23F37626.svg?style=for-the-badge&logo=Jupyter&logoColor=white" />

## Step-by-Step Guide to Respresenting Mascot Memorability

* import necessary packages (Pandas, Numpy, Matplotlib, Seaborn)
* Load the Dataset into Pandas
* Clean the Dataset
* Create a new variable with columns only relevant to recognition phase
* Create a new variable indexed by video with participant response as column
* Determine whether response is a Hit or False Alarm
* create an empty column
* when studied and sure/maybe/guess old, = HIT in a new column
* when lure and sure/maybe/guess new, = HIT in a new column
* when studied and sure/maybe/guess new, = False alarm in a new column
* when lure and sure/maybe/guess old, = False alarm in a new column
* alternatively, could this become a boolean mask where TRUE = hit?

Create a function that will repeat this for all mascot videos
Calculate the “Hit Rate” per mascot video, make it its own series.
determine the number of participant responses per mascot video
divide total Hit by total number of responses
Create a new df indexed by mascot video w/ columns: HR, phase_id, mascot
Visualize this data in a graph... bar graph?
Calculate the average HR per mascot
Create a new series w/ mascot and respective avg. HR
Visualize this data graphically... again by bar graph?
Create a Mixed effect model: HR ~ mascot, phase_id
