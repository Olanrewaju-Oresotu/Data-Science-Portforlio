# Mushroom Dataset Analysis
# Author: Your Name
# Description: Data preparation and Exploration analysis of the mushroom dataset.

# Load Libraries
library(tidyverse)  # Data manipulation and visualization
library(naniar)     # Handling missing data
library(ggplot2)    # Data visualization

# Data Import
mushrooms <- read.csv("mushrooms.csv")

# Data Summary
dim(mushrooms) # Dimensions of the dataset

summary(mushrooms) # Summary of the dataset

# Data Cleaning 
colSums(is.na(mushrooms)) # Checking for missing values

vis_miss(mushrooms) # Visualizing missing data

mushrooms <- mushrooms[, -16] # Remove unnecessary columns (Veil_type, only contains one letter)

# Data Preparation
mushroom <- mushrooms %>%
  mutate_if(is.character, as.factor)

  # Redefine each of the category for each of the variables
levels(mushroom$class) <- c("edible", "poisonous")
levels(mushroom$cap.shape) <- c("bell", "conical", "flat", "knobbed", "sunken", "convex")
levels(mushroom$cap.color) <- c("buff", "cinnamon", "red", "gray", "brown", "pink", 
                                "green", "purple", "white", "yellow")
levels(mushroom$cap.surface) <- c("fibrous", "grooves", "scaly", "smooth")
levels(mushroom$bruises) <- c("False", "True")
levels(mushroom$odor) <- c("almond", "creosote", "foul", "anise", "musty", "none", "pungent", "spicy", "fishy")
levels(mushroom$gill.attachment) <- c("free", "attached")
levels(mushroom$gill.spacing) <- c("close", "crowded")
levels(mushroom$gill.size) <- c("broad", "narrow")
levels(mushroom$gill.color) <- c("buff", "red", "gray", "chocolate", "black", "brown", "orange", 
                                 "pink", "green", "purple", "white", "yellow")
levels(mushroom$stalk.shape) <- c("enlarging", "tapering")
levels(mushroom$stalk.root) <- c("missing", "bulbous", "club", "equal", "rooted")
levels(mushroom$stalk.surface.above.ring) <- c("fibrous", "silky", "smooth", "scaly")
levels(mushroom$stalk.surface.below.ring) <- c("fibrous", "silky", "smooth", "scaly")
levels(mushroom$stalk.color.above.ring) <- c("buff", "cinnamon", "red", "gray", "brown", "pink", 
                                             "green", "purple", "white", "yellow")
levels(mushroom$stalk.color.below.ring) <- c("buff", "cinnamon", "red", "gray", "brown", "pink", 
                                             "green", "purple", "white", "yellow")
levels(mushroom$veil.color) <- c("brown", "orange", "white", "yellow")
levels(mushroom$ring.number) <- c("none", "one", "two")
levels(mushroom$ring.type) <- c("evanescent", "flaring", "large", "none", "pendant")
levels(mushroom$spore.print.color) <- c("buff", "chocolate", "black", "brown", "orange", 
                                        "green", "purple", "white", "yellow")
levels(mushroom$population) <- c("abundant", "clustered", "numerous", "scattered", "several", "solitary")
levels(mushroom$habitat) <- c("wood", "grasses", "leaves", "meadows", "paths", "urban", "waste")


# Summary of the prepared dataset
summary(mushroom)

# Univariate EDA (UEDA)

# Data Visualization (Percentage)
# Calculate the percentage of edible and poisonous mushrooms
mushroom_summary <- mushrooms %>%
  group_by(class) %>%
  summarize(counts = n(), 
            percentage = n() / nrow(mushrooms))

# Plot a pie chart to visualize the percentage
pie(mushroom_summary$percentage, labels = c("Edible(51.8%)", "Poisonous(48.2%)"))

# Plot the distribution of each variable
plot(mushroom$cap.shape, xlab='cap.shape', ylab='count')
plot(mushroom$cap.surface, xlab='cap.surface', ylab='count')
plot(mushroom$cap.color, xlab='cap.color', ylab='count')
plot(mushroom$bruises, xlab='bruises', ylab='count')
plot(mushroom$odor, xlab='odor', ylab='count')
plot(mushroom$gill.attachment, xlab='gill.attachment', ylab='count')
plot(mushroom$gill.spacing, xlab='gill.spacing', ylab='count')
plot(mushroom$gill.size, xlab='gill.size', ylab='count')
plot(mushroom$gill.color, xlab='gill.color', ylab='count')
plot(mushroom$stalk.shape, xlab='stalk.shape', ylab='count')
plot(mushroom$stalk.root, xlab='stalk.root', ylab='count')
plot(mushroom$stalk.surface.above.ring, xlab='stalk.surface.above.ring', ylab='count')
plot(mushroom$stalk.surface.below.ring, xlab='stalk.surface.below.ring', ylab='count')
plot(mushroom$stalk.color.above.ring, xlab='stalk.color.above.ring', ylab='count')
plot(mushroom$stalk.color.below.ring, xlab='cap.shape', ylab='count')
plot(mushroom$veil.type, xlab='veil.type', ylab='count')
plot(mushroom$veil.color, xlab='veil.color', ylab='count')
plot(mushroom$ring.number, xlab='ring.number', ylab='count')
plot(mushroom$ring.type, xlab='ring.type', ylab='count')
plot(mushroom$spore.print.color, xlab='spore.print.color', ylab='count')
plot(mushroom$population, xlab='population', ylab='count')
plot(mushroom$habitat, xlab='habitat', ylab='count')
plot(mushroom$class, xlab='class', ylab='count')


# Multivariate EDA (MVEDA): Using a mozaic plot we can try to see the distinctions between variables and mushroom class
ggplot(mushroom, aes(x = odor, y = gill.size, col = class)) + 
  geom_jitter(alpha = 0.5) + scale_color_manual(breaks = c("edible", "poisonous"), 
                                                values = c("green", "red"))
ggplot(mushroom, aes(x = class, y = spore.print.color, col = class)) + 
  geom_jitter(alpha = 0.5) + 
  scale_color_manual(breaks = c("edible", "poisonous"), 
                     values = c("green", "red"))
ggplot(mushroom, aes(x = class, y = odor, col = class)) + 
  geom_jitter(alpha = 0.5) + 
  scale_color_manual(breaks = c("edible", "poisonous"), 
                     values = c("green", "red"))

ggplot(mushroom, aes(x = class, y = veil.color, col = class)) + 
  geom_jitter(alpha = 0.5) + 
  scale_color_manual(breaks = c("edible", "poisonous"), 
                     values = c("green", "red"))

#Observation: From the mozaic plot - odor, veil-color, spore-print-color and population show greater distinctions \n
# between mushroom classes, therefore we dig deeper to see their variation with each class

o<- subset(mushroom, select=c('odor', 'class'))
odor <- table(o)
ggplot(as.data.frame(odor, responseName = 'count'), aes(odor, count, color = class, fill=class)) + 
  geom_bar(stat="identity", position = "dodge") + theme_minimal()

v<- subset(mushroom, select=c('veil.color', 'class'))
veil_color <- table(v)
ggplot(as.data.frame(veil_color, responseName = 'count'), aes(veil.color, count, color = class, fill=class)) + 
  geom_bar(stat="identity", position = "dodge") + theme_minimal()

s<- subset(mushroom, select=c('spore.print.color', 'class'))
spore<- table(s)
ggplot(as.data.frame(spore, responseName = 'count'), aes(spore.print.color, count, color = class, fill=class)) + 
  geom_bar(stat="identity", position = "dodge") + theme_minimal()

p<- subset(mushroom, select=c('population', 'class'))
pop <- table(p)
ggplot(as.data.frame(pop, responseName = 'count'), aes(population, count, color = class, fill=class)) + 
  geom_bar(stat="identity", position = "dodge") + theme_minimal()



# Save the dataset with factor variables for future modeling
write.csv(mushroom, "mushroom_prepared.csv", row.names = FALSE)

# End of script


