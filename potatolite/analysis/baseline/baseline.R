## read Gas chromatograph data analysis ####
## Who: JW Collins 
## what: PotatoLite baseline data
## Last edited: 2023-06-21


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## PACKAGES ####

source("scripts/packages/packages.R")

## SOURCE SCRIPTS ####

source("scripts/functions/bubb.baseline.FUN.R")
source("scripts/functions/griffiths.baseline.FUN.R")
source("scripts/functions/baseline.mean.FUN.R")

### READ BASELINE DATA ####

### Griffiths baseline ####

# load column names
col.nam <- read.csv("data/raw.data/2023_03_24_POTATOLITE_BASELINE_GRIFFITHS 2023-04-20 15-43-04/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/raw.data/2023_03_24_POTATOLITE_BASELINE_GRIFFITHS 2023-04-20 15-43-04/REPORT01.CSV", 
                header = TRUE, sep = ",", 
                fileEncoding="UTF-16LE")

# Temperature on this day 
day.temp <- 11.6

# run function to extract data from the csv and transform
dat <- griffFUN(dat)

# input site info
site <- "Griffiths"

# add site info to df
dat$site <- site

# input the sampling date in date format
day.date <- as.Date(x = "2023-03-24")

# add sampling date
dat$date <- day.date

# create all data df
gc.dat <- dat


### Bubbs baseline ####

# load column names
col.nam <- read.csv("data/raw.data/2023_03_22_POTATOLITE_BASELINE_BUBBS 2023-04-19 09-49-41/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/raw.data/2023_03_22_POTATOLITE_BASELINE_BUBBS 2023-04-19 09-49-41/REPORT02.CSV", header = TRUE)

#dat2 <- read.csv("data/", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

#dat <- rbind(dat, dat2) #This is to bind two runs together to 1 df

# run function to extract data from the csv and transform
dat <- bubbFUN(dat)

# input site info
site <- "Bubbs"

# add site info to df
dat$site <- site

# input the sampling date in date format
day.date <- as.Date(x = "2023-03-22")

# add sampling date
dat$date <- day.date

# join df's
gc.dat <- rbind(gc.dat, dat)



#############

## FILTER TO TIMING ####

hour.dat <- filter(gc.dat, timing == 60)

# run mean summary function
mean.dat <- meanFUN(hour.dat)


## WRITE FILES ####


write.csv(gc.dat, file = "data/processed.data/baseline/2023_03_22_baseline_data.csv")

write.csv(mean.dat, file = "data/processed.data/baseline/2023_03_22_summary_baseline.data.csv")







