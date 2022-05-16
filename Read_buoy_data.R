##Code to read in data from NOAA national buoy database

##Load packages 
library(tidyverse)
#Save the project folder so that you can return her after importing buoy data
proj_folder <- getwd()
#This code relies on each buoy being in a folder labeled with the bouy number in the main WD
#AThis code relies on each buoy having its own folder each file should have the naming format "Buoynumber_year.txt"
# Read in the buoy data ---------------------------------------------------

#Read in the files from th
setwd("C:/Users/fooli/OneDrive - UW/Oceanographic data/NOAA national buoy data historical archives/46121")
files46121 <- list.files("C:/Users/fooli/OneDrive - UW/Oceanographic data/NOAA national buoy data historical archives/46121", 
           all.files = FALSE) #Creates a vector with all the filenames in each directory. Need to find a way to automatically give it a filename
b46121dat <- data.frame()#creates an empty data frame to store data from textfiles


for(i in 1:length(files46121)){ #Need to change this code so that it auctomatically changes for each buoy. Want to put in buoy number only once
  dat <- read.table(file = files46121[i], fill = TRUE, header = TRUE, comment.char = "")#Comment.char is because there are # in the first two lines so they would be skipped if default # was used for a comment
  dat <- dat[-c(1),]#Remove the second row because this has the units
  #dat <- sapply(dat,as.numeric)#Makes all data numeric
  b46121dat <-  bind_rows(b46121dat, dat)
  rm(dat)
}
b46121dat[] <- sapply(b46121dat, as.numeric)
setwd(proj_folder)#Returns wd back to project folder
