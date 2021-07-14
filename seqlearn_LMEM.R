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
plot(fitted(LMEM_phase),residuals(LMEM_phase))


# Mixed Effect Model 
LMEM_dual = lm(Hit_Rate ~  phase_id + mascot_name, data = LMEM_data)
summary(LMEM_dual)
# Residuals = data point fit to linear model?
# R^2= how well the model works, AKA variance in pitch accounted for by diff btw M/F 
# Adjusted R^2 = amount of variance explained given # of “fixed effects”
# p-value = probability under condition that null hypothesis = true. Low=low probability of no effect.
# In this case, null=“sex has no effect on pitch”
# Note overall p-value = p-value for “sexmale” because used only one fixed effect
# If multiple fixed effects, overall p-val != pval sexmale 

