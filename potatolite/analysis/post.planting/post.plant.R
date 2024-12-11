## read Gas chromatograph data analysis ####
## Who: JW Collins 
## what: PotatoLite Post planting data
## Last edited: 2023-06-21


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## 00 PACKAGES ####

source("scripts/packages/packages.R")

## SOURCE SCRIPTS ####

# analysis of raw data functions for both sites
source("scripts/functions/bubb.postplant.FUN.R")
source("scripts/functions/griffiths.postplant.FUN.R")

# load summary stats function
#source(file = "scripts/functions/meanFUN.R")
source(file = "scripts/functions/postplant.mean.FUN.R")



## LOAD BUBBS DATA - 2023-05-01 ####

# load column names
col.nam <- read.csv("data/raw.data/2023_05_01_POTATOLITE_BUBBS_1_GHG 2023-05-19 16-51-41/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/raw.data/2023_05_01_POTATOLITE_BUBBS_1_GHG 2023-05-19 16-51-41/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat2 <- read.csv("data/raw.data/2023_05_01_POTATOLITE_BUBBS_2_GHG 2023-05-22 10-07-33/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat <- rbind(dat, dat2) #This is to bind two runs together to 1 df

# Temperature on this day 
day.temp <- 11.6

# run function to extract data from the csv and transform
dat <- bubb.postplant.FUN(dat)

# input site info
site <- "Bubbs"

# add site info to df
dat$site <- site

# input the sampling date in date format
day.date <- as.Date(x = "2023-05-01")

# add sampling date
dat$date <- day.date

# create all data df
gc.dat <- dat


## LOAD GRIFFITHS DATA - 2023-05-02 ####

# load column names
col.nam <- read.csv("data/raw.data/2023_05_02_POTATOLITE_GRIFFITHS_GHG 2023-05-17 11-29-19/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/raw.data/2023_05_02_POTATOLITE_GRIFFITHS_GHG 2023-05-17 11-29-19/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat2 <- read.csv("data/raw.data/2023_05_02_POTATOLITE_GRIFFITHS_2_GHG 2023-05-18 14-09-09/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat <- rbind(dat, dat2) #This is to bind two runs together to 1 df

# Temperature on this day 
day.temp <- 11.7

# run function to extract data from the csv and transform
dat <- griffiths.postplant.FUN(dat)

# input site info
site <- "Griffiths"

# add site info to df
dat$site <- site

# input the sampling date in date format
day.date <- as.Date(x = "2023-05-02")

# add sampling date
dat$date <- day.date

# join df's
gc.dat <- rbind(gc.dat, dat)



#####################

## FILTER TO TIMING ####

last.dat <- filter(gc.dat, timing == 28)

# # run mean summary function
# mean.dat <- meanFUN(last.dat)




## BOTH SITES ####

# just treatments no site data 

treat.dat <- meanFUN(gc.dat)

treat.dat$Site <- "Both"


# both site and treatment 

mean.dat <- PPmeanFUN(gc.dat)



## WRITE FILES ####

# all data
write.csv(gc.dat, file = "data/processed.data/postplant/2023_05_02_postplant_data.csv")

# just 28 minute data 
write.csv(last.dat, file = "data/processed.data/postplant/28min_data_2023_05_02_postplant.csv")

# just treatment summary
write.csv(treat.dat, file = "data/processed.data/postplant/both.site.postplant.summary.data.csv")

# treatment and site summary
write.csv(mean.dat, file = "data/processed.data/postplant/2023_05_02_treatment_site_summary_data.csv")





