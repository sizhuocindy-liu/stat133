---
title: "make-shots-charts-script"
description: # creating shot charts and facetted charts for all five players
inputs: # csv files and jpg file
outputs:# pdf files
---

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

# 4.1 create shot charts for each player

# create scatterplot for each player
iguodala_scatterplot <- ggplot(data = iguodala_new1) + geom_point(aes(x = x, y = y, color = shot_made_flag))
iguodala_scatterplot

green_scatterplot <- ggplot(data = green_new1) + geom_point(aes(x = x, y = y, color = shot_made_flag))
green_scatterplot

durant_scatterplot <- ggplot(data = durant_new1) + geom_point(aes(x = x, y = y, color = shot_made_flag))
durant_scatterplot

thompson_scatterplot <- ggplot(data = thompson_new1) + geom_point(aes(x = x, y = y, color = shot_made_flag))
thompson_scatterplot

curry_scatterplot <- ggplot(data = curry_new1) + geom_point(aes(x = x, y = y, color = shot_made_flag))
curry_scatterplot

# add background image
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
library(jpeg)
court_image <- grid::rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))

# shot chart with court background
iguodala_shot_chart <- ggplot(data = iguodala_new1) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
iguodala_shot_chart

green_shot_chart <- ggplot(data = green_new1) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
green_shot_chart

durant_shot_chart <- ggplot(data = durant_new1) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
durant_shot_chart

thompson_shot_chart <- ggplot(data = thompson_new1) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
thompson_shot_chart

curry_shot_chart <- ggplot(data = curry_new1) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
curry_shot_chart

# save the plots in PDF format in the images/ folder
pdf(file = '../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = '../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf(file = '../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = '../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf(file = '../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_shot_chart
dev.off()

# 4.2 create a facetted shot chart
facetted <- ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  facet_wrap(~ name)
facetted

# save the facetted shot chart in PDF format in the images/ folder
pdf(file = '../images/gsw-shot-chart.pdf', width = 8, height = 7)
facetted
dev.off()



