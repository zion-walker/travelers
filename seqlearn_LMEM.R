# importing necessay packages
library(readr)
library(dplyr)
library(lme4)
library(stats)

# Start the clock!
ptm <- proc.time()

## Linear Mixed Effect Model

# Load in dataset
final_LMEM_data <- read_csv("final_LMEM_data.csv")
# drop random extra column, and video context column bc irrelevant for this analysis
LMEM_data <- select (final_LMEM_data,-c(X1, video_context))
print(colnames(LMEM_data))

# LMEM formula where fixed effect is mascot
LMEM_mascot = lm(Hit_Rate ~  mascot_name, data = LMEM_data)
summary(LMEM_mascot)
## how do the R^2s compare between HR LMEM and hit-binomial logreg?  0.01366 vs. 
# p-value = probability under condition that null hypothesis = true. Low=low probability of no effect.

## Bootstrap confidence intervals for regression coefficients
# how many replications? 
# this is a basic non-parametric bootstrap.

## Bootstrap confidence intervals for regression coefficients
# Creating the Bootstrap Population.
nb = 1000 # number of bootstrap samples... small for now
coefficent_matrix = matrix(0, nb, 8) # where the bootstrapped coefficents will get stored, 8 mascots
resids = residuals(LMEM_mascot) # extracting residuals from our LMER
resids

predicted_vals = fitted(LMEM_mascot) # A fitted value is a statistical model’s prediction of the mean response value when you input the data values you collected I think?
predicted_vals #there should be 8 "predicted values" in this set, and I think each datapoint gets assigned a predicted value based on which mascot is in the video,
# and I think that the 8 predicted values should be those that are returned by the original LMEM

for (i in 1:3)
{
  cur_sample <- sample(resids, replace = TRUE)
  cat(head(cur_sample), " is cur_sample")
  which(resids == cur_sample)
}
sample(resids, replace = TRUE)

for (i in 1:nb) #for each bootstrap sample x in x_i:
{
  booty <-  predicted_vals + sample(resids, replace = TRUE) # sampling from Hr/video data to generate an estimated coefficent value? 
  bootstrap_model <- update(LMEM_mascot, booty ~ .) # refit model, update function makes it faster.
  coefficent_matrix[i,] = coef(bootstrap_model) # extract estimated coefficents from all bootstrap samples and put them into the matrix
}
colnames(coefficent_matrix) = c("Intercept", "Chibakun", "Fukaya", "Jarbo", "Kapal", "Kounudoun", "OnoJoe", "Shimanekko")           
coefficent_matrix <- data.frame(coefficent_matrix)
head(coefficent_matrix)

confidence_intervals = apply(coefficent_matrix, 2, function(x) quantile(x, c(.025, .975)))
print(confidence_intervals)

# Stop the clock
proc.time() - ptm

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
  mutate(perm_mascot = map(responses, ~sample(x = .$mascot_name, size = length(.$mascot_name), replace = FALSE)))%>%
  unnest(cols = c(responses, perm_mascot))

perm_logreg <- glmer(hit_binary ~ perm_mascot + condition + (1 | Participant_Public_ID), data = permut_logistic_data, family = "binomial")
summary(perm_logreg)
anova(perm_logreg)

# Visualizing average memorability per mascot
library(ggplot2)

x=c(0, 0.128221, 0.012409,
    0.067110, 0.042566, -0.023623,
    0.028283, -0.053254)
y=c(0,0,0,0,0,0,0,0)
mas_data <- data.frame(x=x, y=y)

plot_mas_data <- ggplot(mas_data, aes(x, y)) +
  geom_point() +
  scale_x_continuous(limits = c(-0.10, 0.15)) +
  scale_y_continuous(limits = c(0, 0.05))

Barasi <- 0
new_plot <- plot_mas_data +                               # Add vertical line & label
  geom_vline(aes(xintercept = Barasi)) +
  geom_text(aes(Barasi, 0.01, label = "Barasi", hjust = 1))
ChibaKun <- 0.128221
plot <- new_plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = ChibaKun )) +
  geom_text(aes(ChibaKun, 0.005, label = "ChibaKun", hjust = 1))
Fukaya <- 0.012409
plot2 <- plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = Fukaya)) +
  geom_text(aes(Fukaya, 0.01, label = "Fukaya", hjust = 1))
Jarbo <- 0.067110
plot3 <- plot2 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Jarbo)) +
  geom_text(aes(Jarbo, 0.005, label = "Jarbo", hjust = 1))
Kapal <- 0.042566
plot4 <- plot3 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kapal)) +
  geom_text(aes(Kapal, 0.01, label = "Kapal", hjust = 1))
Kounudoun <- -0.023623
plot5 <- plot4 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kounudoun)) +
  geom_text(aes(Kounudoun, 0.005, label = "Kounudoun", hjust = 1))
OnoJoe <- 0.028283
plot6 <- plot5 +                               # Add vertical line & label
  geom_vline(aes(xintercept = OnoJoe)) +
  geom_text(aes(OnoJoe, 0.01, label = "OnoJoe", hjust = 1))
Shimanekko <- -0.053254
plot7 <- plot6 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Shimanekko)) +
  geom_text(aes(Shimanekko, 0.005, label = "Shimanekko", hjust = 1))

## saved in case I need it
coefficent_matrix = matrix(0, nb, 8)
# ________
# extract coefficients estimated for permutation sample
coefficent_matrix[i,] = unique(coef(perm_logreg)) # 1 coeff per mascot n times where n=101 
coefficent_matrix <- data.frame(coefficent_matrix)
# ________
colnames(dist_permut_log_coefs) = c("Intercept", "Chibakun", "Fukaya", "Jarbo", "Kapal", "Kounudoun", "OnoJoe", "Shimanekko")           
dist_permut_log_coefs.head()