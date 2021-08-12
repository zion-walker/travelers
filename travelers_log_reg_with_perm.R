library(readr)
library(dplyr)
library(lme4)
library(stats)
library(tidyr)
library(purrr)

## Mixed Effects Logistic Regression. 
# Load in Full Dataset
logistic_data <- read_csv("logistic_data.csv")
logistic_data$hit_binary <- as.factor(logistic_data$hit_binary)
class(logistic_data$hit_binary)
#remove column X1
clean_logistic_data <- subset(logistic_data, select = -c(X1))

logreg1 <- glmer(hit_binary ~ mascot_name + condition + (1 | Participant_Public_ID), data = logistic_data, family = "binomial")
summary(logreg1)
anova(logreg1)
# Sum of squares across mascots is 17.1003

# Permutation 
permut_logistic_data <- logistic_data %>%
  nest(responses = -c(Participant_Public_ID, hit_binary)) %>%
  mutate(perm_mascot = map(responses, ~sample(x = .$mascot_name, size = length(.$mascot_name), replace = FALSE))) %>%
  unnest(cols = c(responses, perm_mascot))
permut_logistic_data

perm_logreg <- glmer(hit_binary ~ perm_mascot + condition + (1 | Participant_Public_ID), data = permut_logistic_data, family = "binomial")
summary(perm_logreg)
anova(perm_logreg)
