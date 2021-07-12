# LMEM: HR ~ mascot, phase_id
getwd()
# Load in dataset
library(readr)
final_LMEM_data <- read_csv("final_LMEM_data.csv")
# drop random extra column, and video context column bc irrelevant for this analysis
library(dplyr)
LMEM_data <- select (final_LMEM_data,-c(X1, video_context))
print(colnames(LMEM_data))
LMEM_mascot = lm(Hit_Rate ~  mascot_name, data = LMEM_data)
summary(LMEM_mascot)

LMEM_phase = lm(Hit_Rate ~  phase_id, data = LMEM_data)
summary(LMEM_phase)

LMEM_dual = lm(Hit_Rate ~  phase_id, mascot_name, data = LMEM_data)
summary(LMEM_dual)

