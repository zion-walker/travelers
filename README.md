
# 🏖️ Travelers 🏝️ 

In this study, some mascots are encountered doing new actions in different locations each trial (ex. waving in classroom vs. running on a baseball field vs. watching fireworks) whereas other mascots videos are very similar across trials (ex. doing different actions in the same shopping mall)

*are mascots that travel often more memorable than others?* 

<img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775324-02370200-d278-11eb-99c6-57cc9ea41254.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775518-36122780-d278-11eb-9284-9ff3650efad8.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775285-f8150380-d277-11eb-9f00-1beaccf4e430.png">

<img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122774004-d2d3c580-d276-11eb-8eec-6f8fd255ba24.png"><img width="169" alt="image" src="https://user-images.githubusercontent.com/74158727/122774296-10385300-d277-11eb-8204-da4454d3852a.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122774404-25ad7d00-d277-11eb-8c94-5a8fe420cdb7.png">

This sub-analysis aims to address whether memory retrieval is influenced by the uniqueness of episodic events. 

### Overarching Study Description: What is seqlearn?  
The present study lead by Dr. Halle Dimsdale-Zucker aims to test whether statistical structure imposed at encoding and reinstated at retrieval can serve as a context to guide memory. We hypothesize that statistical structure facilitates learning, and maintaining statistical regularities at retrieval improves memory performance.

I will be determining the memorability of specific mascot videos by comparing the rates of correctly identifying studied videos as “old” vs. incorrectly judging unstudied videos as “old” across participants.

<img alt="Python" src="https://img.shields.io/badge/python-%2314354C.svg?style=for-the-badge&logo=python&logoColor=white"><img alt="Jupyter" src="https://img.shields.io/badge/Jupyter-%23F37626.svg?style=for-the-badge&logo=Jupyter&logoColor=white" />

## Step-by-Step Guide to Respresenting Mascot Memorability

> * import necessary packages (Pandas, Numpy, Matplotlib, Seaborn)
> * Load/Read Datafile
> * Clean Dataset
* **In Cleaned Dataset, Isolate columns relevant to Recognition Phase**
```
["phase_id", "mascot_name", "video_context", "Response", 'stim_type']
```
> * Isolate all responses where "phase_id" is equal to "recog_random" and "recog_ordered"
* **Determine whether response is a Hit or Other Response**
> * when studied and sure/maybe/guess old, = Hit
> * Create a Boolean mask in a new column True = Hit
> * Rename items in Boolean Column so that TRUE = Hit,
>  False = Miss, Incorrect rejection, Correct rejection, False Alarm
* **Determine the total number of responses for each video in a new column** 
* **Calculate the “Hit Rate” per mascot video in a new column by dividing total Hit across participants by total number of responses**
* **Create a DataFrame indexed by Mascot Video with Hit Rate as column**
> * Visualize this data in a bar graph

Create a new df indexed by mascot video w/ columns: HR, phase_id, mascot
Calculate the average HR per mascot
Create a new series w/ mascot and respective avg. HR
Visualize this data graphically... again by bar graph?
Create a Mixed effect model: HR ~ mascot, phase_id
