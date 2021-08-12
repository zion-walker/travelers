library(readr)
library(dplyr)
library(lme4)
library(stats)
library(tidyr)
library(purrr)

## Mixed Effects Logistic Regression. 
# Load in Full Dataset
logistic_data <- read_csv("logistic_data.csv")
#remove column X1
clean_logistic_data <- subset(logistic_data, select = -c(X1))

logreg1 <- glmer(hit_binary ~ mascot_name + condition + (1 | Participant_Public_ID), data = clean_logistic_data, family = "binomial")
summary(logreg1)
sos_total <- sum((fitted(logreg1) - clean_logistic_data$hit_binary)^2) + sum((fitted(logreg1) - mean(clean_logistic_data$hit_binary))^2)
sos_total
anova(logreg1)
# Sum of squares across mascots is 17.1003?

# Start the clock!
ptm <- proc.time()
# Permutation 
dist_permut_log_sos <- data.frame(stringsAsFactors = FALSE)
nperm <- 1000
for (i in 1:nperm)
{
  permut_logistic_data <- clean_logistic_data %>%
  # creating a df w/ a participant and a hit_binary row, and a list-column containing a df with the mascot & condition of a participant/response grouping.
  # by folding all observations into a separate column called "mascots_etc" and using a negative vector to hold grouping-level variables out of that folded column
    nest(mascots_etc = -c(Participant_Public_ID, hit_binary)) %>%
    mutate(perm_mascot = map(mascots_etc, ~sample(x = .$mascot_name, size = length(.$mascot_name), replace = FALSE))) %>%
    unnest(cols = c(mascots_etc, perm_mascot))
  
  #fit perm data to logistic regression
  perm_logreg <- glmer(hit_binary ~ perm_mascot + condition + (1 | Participant_Public_ID), data = permut_logistic_data, family = "binomial")
  sos_total_perm <- sum((fitted(perm_logreg) - permut_logistic_data$hit_binary)^2) + sum((fitted(perm_logreg) - mean(permut_logistic_data$hit_binary))^2)
  sos_total_perm_data <- data.frame(sos_total_perm)
  
    if(dim(dist_permut_log_sos)[1] == 0)
    {
      dist_permut_log_sos <- sos_total_perm_data 
    } else 
    {
      cur_data <- sos_total_perm_data  
    
      dist_permut_log_sos <- bind_rows(dist_permut_log_sos, sos_total_perm_data)
    }
}

# Compute permuted p-values
exceeds_obs <- sum(dist_permut_log_sos$sos_total_perm > sos_total) 
dist_permut_log_sos_pvals <- (exceeds_obs + 1) / (nperm + 1)
dist_permut_log_sos_pvals

# Stop the clock
proc.time() - ptm

hist_perm_sos <- ggplot(dist_permut_log_sos, aes(sos_total_perm))+ 
  geom_histogram(fill = "purple") +
  geom_vline(aes(xintercept = 5379.514)) +
  labs(title="Histogram for Sum of Squares Distribution", x="Sum of Squares", y="Count")
hist_perm_sos
