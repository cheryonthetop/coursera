data("ToothGrowth") ## Loading the ToothGrowth dataset
names(ToothGrowth) ## Examine the column names
## Examine the class of each column
class(ToothGrowth[,1])
class(ToothGrowth[,2])
class(ToothGrowth[,3]) 

head(ToothGrowth) ## Get a peak at the dataset
summary(ToothGrowth) ## Summary of the data

grouped <- ToothGrowth %>% 
  group_by(supp, dose) %>%  ## Group the data by supp and dose 
  mutate(supp_dose = gsub(' ','_', paste(supp, dose))) ## Add a column that combines column supp and dose

head(grouped)

library(dplyr)
grouped_summary <- ToothGrowth %>% 
  group_by(supp, dose) %>%  ## Group the data by supp and dose 
  summarize_all(mean) %>%  ## Get the mean of each group
  mutate(supp_dose = gsub(' ','_', paste(supp, dose))) ## Add a column that combines column supp and dose

grouped_summary
barplot(grouped_summary$len, ylab = 'tooth growth', names.arg = grouped_summary$supp_dose, col = 'blue') # barplot the tooth growth vs supp + dose used


## From the graph, we can see pretty clearly that using dosage of 2 is the way to go,
## regardless if you use OJ or VC, since OJ_2 and VC_2 have the same amount of toothgrowth.

## We are, however, interested in if OJ_2 outperforms OJ_1 by a statistically significant margin
## So we perform a t test, assuming unequal variance
t.test(grouped$len[grouped$supp_dose == 'OJ_2'], grouped$len[grouped$supp_dose == 'OJ_1'], alternative = "greater", var.equal = FALSE)$p.value

