---
title: "make-shots-data-script"
description: # processing of imported data that will be used to create shot charts later in the analysis
inputs: # csv files 
outputs: # csv files and txt files
---
  
# load packages
library(dplyr)

# 3. Data Preparation

# read files with relative paths
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
iguodala

green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
green

durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
durant

thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
thompson

curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
curry

# add column name to each data frame with each player's name
iguodala_new <- iguodala %>%
  mutate(name = 'Andre Iguodala') %>%
  select(name,colnames(iguodala))

green_new <- green %>%
  mutate(name = 'Draymond Green') %>%
  select(name,colnames(green))

durant_new <- durant %>%
  mutate(name = 'Kevin Durant') %>%
  select(name,colnames(durant))

thompson_new <- thompson %>%
  mutate(name = 'Klay Thompson') %>%
  select(name,colnames(thompson))

curry_new <- curry %>%
  mutate(name = 'Stephen Curry') %>%
  select(name,colnames(curry))

# change original values of 'shot-made-flag' with more descriptive values
iguodala_new$shot_made_flag[which(iguodala_new$shot_made_flag == 'y')] = 'made shot'
iguodala_new$shot_made_flag[which(iguodala_new$shot_made_flag == 'n')] = 'missed shot'
iguodala_new

green_new$shot_made_flag[which(green_new$shot_made_flag == 'y')] = 'made shot'
green_new$shot_made_flag[which(green_new$shot_made_flag == 'n')] = 'missed shot'
green_new

durant_new$shot_made_flag[which(durant_new$shot_made_flag == 'y')] = 'made shot'
durant_new$shot_made_flag[which(durant_new$shot_made_flag == 'n')] = 'missed shot'
durant_new

thompson_new$shot_made_flag[which(thompson_new$shot_made_flag == 'y')] = 'made shot'
thompson_new$shot_made_flag[which(thompson_new$shot_made_flag == 'n')] = 'missed shot'
thompson_new

curry_new$shot_made_flag[which(curry_new$shot_made_flag == 'y')] = 'made shot'
curry_new$shot_made_flag[which(curry_new$shot_made_flag == 'n')] = 'missed shot'
curry_new

# add a column minute that contains the minute number where a shot occurred
iguodala_new1 <- iguodala_new %>%
  mutate(minute = period*12 - minutes_remaining) %>%
  select(colnames(iguodala_new), minute)

green_new1 <- green_new %>%
  mutate(minute = period*12 - minutes_remaining) %>%
  select(colnames(green_new), minute)

durant_new1 <- durant_new %>%
  mutate(minute = period*12 - minutes_remaining) %>%
  select(colnames(durant_new), minute)

thompson_new1 <- thompson_new %>%
  mutate(minute = period*12 - minutes_remaining) %>%
  select(colnames(thompson_new), minute)

curry_new1 <- curry_new %>%
  mutate(minute = period*12 - minutes_remaining) %>%
  select(colnames(curry_new), minute)

# use the sink() function to send the summary() output of each data frame into text files saved in the output/ folder
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala_new1)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green_new1)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant_new1)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson_new1)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry_new1)
sink()

# use the rbind() function to stack all tables into one single data frame
shots_data <- rbind(iguodala_new1, green_new1, durant_new1, thompson_new1, curry_new1)
shots_data

# export the assembled table as a csv file saved in the data/ folder
write.csv(shots_data, file = '../data/shots-data.csv', row.names = FALSE)

# export the shots-data summary in text file format saved to the output/ folder
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()











