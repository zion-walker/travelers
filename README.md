
# 🏖️ Travelers 🏝️ 

In this study, some mascots are encountered doing new actions in different locations each trial (ex. waving in classroom vs. running on a baseball field vs. watching fireworks) whereas other mascots videos are very similar across trials (ex. doing different actions in the same shopping mall)

*are mascots that travel often more memorable than others?* 

<img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775324-02370200-d278-11eb-99c6-57cc9ea41254.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775518-36122780-d278-11eb-9284-9ff3650efad8.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122775285-f8150380-d277-11eb-9f00-1beaccf4e430.png">

<img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122774004-d2d3c580-d276-11eb-8eec-6f8fd255ba24.png"><img width="169" alt="image" src="https://user-images.githubusercontent.com/74158727/122774296-10385300-d277-11eb-8204-da4454d3852a.png"><img width="168" alt="image" src="https://user-images.githubusercontent.com/74158727/122774404-25ad7d00-d277-11eb-8c94-5a8fe420cdb7.png">

This sub-analysis aims to address whether memory retrieval is influenced by the uniqueness of episodic events. 

### Overarching Study Description: What is seqlearn?  
The present study lead by Dr. Halle Dimsdale-Zucker aims to test whether statistical structure imposed at encoding and reinstated at retrieval can serve as a context to guide memory. We hypothesize that statistical structure facilitates learning, and maintaining statistical regularities at retrieval improves memory performance.

I will be determining the memorability of specific mascot videos by comparing the rates of correctly identifying studied videos as “old” vs. incorrectly judging unstudied videos as “old” across participants.

## Step-by-Step Guide to Respresenting Mascot Memorability <img alt="Python" src="https://img.shields.io/badge/python-%2314354C.svg?style=for-the-badge&logo=python&logoColor=white">  <img alt="Jupyter" src="https://img.shields.io/badge/Jupyter-%23F37626.svg?style=for-the-badge&logo=Jupyter&logoColor=white" />

1. import necessary packages (Pandas, Numpy, Matplotlib, Seaborn)
2. Load/Read Datafile
3. Clean Dataset
4. In Cleaned Dataset, Isolate columns relevant to Recognition Phase
```
["phase_id", "mascot_name", "video_context", "Response", 'stim_type']
```
5. Isolate all responses where "phase_id" is equal to "recog_random" and "recog_ordered"
6. Determine whether response is a Hit or Other Response
7. when studied and sure/maybe/guess old, = Hit
8. Create a Boolean mask in a new column True = Hit
```
np.where((recog_test_data['stim_type'] == 'studied') & 
((recog_test_data['Response'] == 'sure old') | (recog_test_data['Response'] == 
'maybe old') | (recog_test_data['Response'] == 'guess old')), True, False)

```
9. Rename items in Boolean Column so that TRUE = Hit,
10. False = Miss, Incorrect rejection, Correct rejection, False Alarm
11. Determine the total number of responses for each video in a new column** 
```
hit['resp_type_total'] = hit.groupby('video_context')['response_count'].transform('sum')
```
12. Calculate the “Hit Rate” per mascot video in a new column
13. divide total Hit across participants by total number of responses
14. Create a DataFrame indexed by Mascot Video with Hit Rate as column
15. Visualize this data in a bar graph

## Creating a Linear Mixed Effect Model <img alt="R" src="https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white"/>
Linear Mixed Effect Models (LMEM) aim to determine the extent to which data values are influenced by different factors, or 'fixed effects'. In this case we are investigating the following:
 
 _To what extent is 'hit rate' determined by whether the video is viewed during the ordered vs. random condition?_
 
 _To what extent is the 'hit rate', or memorability of each video determined by the mascot in the video?_
