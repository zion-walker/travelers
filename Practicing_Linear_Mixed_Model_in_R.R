# Creating a Linear Mixed Model

# sample data
pitch = c(233,204,242,130,112,142)
sex = c(rep("female",3),rep("male",3))
# combine the two objects into a dataframe
# Where sex is a categorical column
my.df = data.frame(sex,pitch)
print(my.df)

# model pitch as a function of sex, taken from my.df, saved model into xmdl
xmdl = lm(pitch ~ sex, my.df)
summary(xmdl)
# Residuals = data point fit to linear model?
# R^2= how well the model works, AKA variance in pitch accounted for by diff btw M/F 
# Adjusted R^2 = amount of variance explained given # of “fixed effects”
# p-value = probability under condition that null hypothesis = true. Low=low probability of no effect.
# In this case, null=“sex has no effect on pitch”
# Note overall p-value = p-value for “sexmale” because used only one fixed effect
# If multiple fixed effects, overall p-val != pval sexmale 
mean(my.df[my.df$sex=="female",]$pitch)
# intercept of line = mean female value
# estimate “sexmale” is the difference between the females and the male category.
age = c(14,23,35,48,52,67)
pitch = c(252,244,240,233,212,204) 
new.df = data.frame(age,pitch) 
next_one = lm(pitch ~ age, new.df) 
summary(next_one)
plot(fitted(next_one),residuals(next_one))
hist(residuals(next_one))
qnorm(residuals(next_one))
# see section on recreating a meaningful intercept for this multi-category model 
