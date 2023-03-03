library(randomForest)
library(Boruta)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)


# feature selection
data <- read.csv("cleaned_dataset.csv")
set.seed(11)

boruta <- Boruta(Target ~ ., data=data, doTrace = 2, maxRuns = 500)
print(boruta)

getSelectedAttributes(boruta)

model_stats <- attStats(boruta)

# top 20 data
top_20 <- model_stats[!(row.names(model_stats) %in% c('Flow_ID', 'Source_IP', 'Destination_IP', 'Timestamp', 'Label', 'Target')),] %>% 
  arrange(-medianImp)

top_20 <- head(top_20, 20)


# histogram/bar plot
c20 <- c(
  "dodgerblue2", "#E31A1C", "green4", "#6A3D9A", "gold1",
  "skyblue2", "#FB9A99", "palegreen2", "#CAB2D6", "#FDBF6F", 
  "khaki2", "maroon", "orchid1", "deeppink1", "blue1", 
  "steelblue4", "darkturquoise", "green1", "yellow4", "yellow3"
)

hist_plot <- top_20 %>% 
  mutate(medianImpSimplified = ((medianImp * 4) / 100.0)) %>% 
  select(medianImpSimplified) %>% 
  arrange(-medianImpSimplified) %>% 
  ggplot(aes(medianImpSimplified, reorder(row.names(top_20), medianImpSimplified))) +
  geom_col(aes(fill = c20)) +
  labs(x = "Median Importance", 
       y = "Features",
       title = "Median Importance of Top 20 Features") + 
  theme(legend.position="none")

# importance of all features
plot(boruta, las = 2, cex.axis = 0.7)

# importance history during 500 runs
plotImpHistory(boruta)

# 

# rf <- randomForest(Target ~ ., data=data)