##Code to read in data from NOAA national buoy database

##Load packages 
library(tidyverse)
library(lubridate)
library(heatwaveR)
library(Rcpp)

#This code relies on each buoy being in a folder labeled with the bouy number in the main WD
#AThis code relies on each bouy having its own folder each file should have the naming format "Buoynumber_year.txt"
# Read in the buoy data ---------------------------------------------------

#REad in the files from th
setwd("C:/Users/fooli/OneDrive - UW/Oceanographic data/NOAA national buoy data historical archives/46121")
files46121 <- list.files("C:/Users/fooli/OneDrive - UW/Oceanographic data/NOAA national buoy data historical archives/46121", 
           all.files = FALSE) #Creates a vector with all the filenames in each directory. Need to find a way to automatically give it a filename
b46121dat <- data.frame()#creates an empty data frame to store data from textfiles
test <- read.table(file = "46121_2011.txt",header = FALSE, skip=2)

for(i in 1:length(files46121)){ #Need to change this code so that it auctomatically changes for each buoy. Want to put in buoy number only once
  dat <- read.table(file = files46121[i], fill = TRUE, header = FALSE, skip=2)
  dat <- sapply(dat,as.numeric)
  b46121dat <-  bind_rows(b46121dat, dat)
  rm(dat)
}


