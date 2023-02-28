library(randomForest)
library(Boruta)
library(dplyr)
library(tidyverse)
library(ggplot2)


# feature selection
data <- read.csv("cleaned_dataset.csv")
set.seed(11)

boruta <- Boruta(Target ~ ., data=data, doTrace = 2, maxRuns = 500)
print(boruta)

plot(boruta, las = 2, cex.axis = 0.7)
plotImpHistory(boruta)

getSelectedAttributes(boruta)

model_stats <- attStats(boruta)

model_stats



# rf <- randomForest(Target ~ ., data=data)