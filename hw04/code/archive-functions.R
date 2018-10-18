# ---
# title: Archive Functions
# author: Sizhuo(Cindy) Liu
# description: creating archive functions
# outputs: archive-functions.R
# ---

# Load Packages
library(XML)
library(stringr)
library(ggplot2)

# 1) Archive of an R Package
# 1.1) Read Archive Data Table

# Write a function read_archive()
#' @title read_archive()
#' @description reading archive data 
#' @param len name of package (characters)
#' @return data frame 
read_archive <- function(x) {
  link<-str_replace('http://cran.r-project.org/src/contrib/Archive/stringr', 'stringr', x)
  as.data.frame(readHTMLTable(link))
}

# 1.2) Data Cleaning

# Write a function clean_archive()
#' @title clean_archive()
#' @description tidy up archive data 
#' @param len raw data (original archive data obtained from read_archive())
#' @return tidied data frame 

clean_archive <- function(x) {
  raw_data <- na.omit(x)[-1,]
  name <- as.character(str_extract(raw_data$NULL.Name, '[^_]+'))
  version1 <- as.character(sub('.*_', '', raw_data$NULL.Name))
  version <- as.character(str_sub(version1, end = -8))
  date <- as.Date(str_sub(raw_data$NULL.Last.modified, start = 1, end = 10))
  MB <- which(str_detect(raw_data$NULL.Size, "M"))
  convert <- as.numeric(str_replace(raw_data$NULL.Size, 'M|K', ''))
  convert[MB] <- convert[MB]*1000
  size <- convert
  cleaned <- data.frame(name, version, date, size)
  cleaned
}

# test function
raw_data <- read_archive('stringr') 
clean_data <- clean_archive(raw_data) 
clean_data

# Export the table as a CSV file "stringr-archive.csv" to the data/ folder
write.csv(clean_data, file = '../data/stringr-archive.csv', row.names = FALSE)

# 1.3) Timeline Plot

# Write a function plot_archive()
#' @title plot_archive()
#' @description visualize the timeline with the version sizes of a package
#' @param len clean archive table (obtained from clean_archive())
#' @return step line chart
plot_archive <- function(x) {
  ggplot(data = x)+
    labs(x = 'Date', y = 'Size (Kilobytes)', title = 'stringr: timeline of version sizes') +
    geom_step(aes(x=date, y=size),col='blue', alpha = 0.5) +
    geom_point(aes(x=date, y=size))
}
plot_archive(clean_data)






















