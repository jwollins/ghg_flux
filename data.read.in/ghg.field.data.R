## HEADER ####
## who: J Collins
## what: Gas chromatograph data read all days and combine to df
## when: 2023-03-19

## CONTENTS ####
## 00 PACKAGES ###
## 01 LOAD DATA ###

## 01 PACKAGES ####

library(dplyr)
library(tidyr)
library(plotrix)

## 02 SOURCE SCRIPTS ####

source("scripts/functions/gc.csv.FUN.R")
source("scripts/functions/meanFUN.R")

## 03 LOAD GC DATA ####

### 2023-03-10 ####

# load column names
col.nam <- read.csv("data/2023_03_10_JC_GHG_DAY_0/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load csv data from gc output
dat <- read.csv("data/2023_03_10_JC_GHG_DAY_0/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-03-10"

#amount of N fertilsier applied at this moment
con.N.now <- 0
ca.N.now <- 0

# Temperature on this day 
day.temp <- 3.9

# Rain this week
precip <- 27.923

# Soil Temperature
soil.temp <- 3.9

# Soil Moisture
soil.moist <- 29.9

# filter to just ambient samples and create a df called ambi
ambi <- filter(dat, V1 == "A1"| V1 == "A2"| V1 == "A3")

# run function to extract data from the csv and transform
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# assign output of function to new df
gc.dat <- dat

# aggregate gc.dat to mean summary df
mean.dat <- meanFUN(dat)




### 2023-03-16 ####

#load col names from the report CSV
col.nam <- read.csv("data/2023_03_16_JC_GHG/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_03_16_JC_GHG/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-03-16"

#amount of N fertilsier applied at this moment
con.N.now <- 57.5
ca.N.now <- 57.5

# Temperature on this day 
day.temp <- 11.8

# Rain this week
precip <- 36.385

# Soil Temperature
soil.temp <- 6.4

# Soil Moisture
soil.moist <- 31

# add ambient samples to df
dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# bind the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### 2023-03-17 ####

#load col names
col.nam <- read.csv("data/2023_03_17_JC_GHG/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_03_17_JC_GHG/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-03-17"

#amount of N fertilsier applied at this moment
con.N.now <- 57.5
ca.N.now <- 57.5

# Temperature on this day 
day.temp <- 13.8

# Rain this week
precip <- 30.668

# Soil Temperature
soil.temp <- 7.5

# Soil Moisture
soil.moist <- 31

# add ambient samples to df
dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### 2023-03-22 ####

#load col names
col.nam <- read.csv("data/2023_03_22_JC_GHG/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_03_22_JC_GHG/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-03-22"

#amount of N fertilsier applied at this moment
con.N.now <- 57.5
ca.N.now <- 57.5

# Temperature on this day 
day.temp <- 13.7

# Rain this week
precip <- 13.382

# Soil Temperature
soil.temp <- 9.2

# Soil Moisture
soil.moist <- 30.7

# add ambient samples to df
dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### 2023-04-03 ####

#load col names
col.nam <- read.csv("data/2023_04_03_JC_GHG 2023-04-24 15-05-06/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_04_03_JC_GHG 2023-04-24 15-05-06/REPORT01.CSV", 
                header = FALSE, sep = ",",
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-04-03"

#amount of N fertilsier applied at this moment
con.N.now <- 57.5
ca.N.now <- 57.5

# Temperature on this day 
day.temp <- 10.9

# Rain this week
precip <- 16.06

# Soil Temperature
soil.temp <- 8.7
  
# Soil Moisture
soil.moist <- 30.5

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-04-07 ####

#load col names
col.nam <- read.csv("data/UNAMED_RUN/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/UNAMED_RUN/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-04-07"

#amount of N fertilsier applied at this moment
con.N.now <- 57.5
ca.N.now <- 127.50

# Temperature on this day 
day.temp <- 13

# Rain this week
precip <- 3.722

# Soil Temperature
soil.temp <- 8.7
  
# Soil Moisture
soil.moist <- 29.4

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)



### 2023-04-16 ####

#load col names
col.nam <- read.csv("data/2023_04_16_JC_GHG/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_04_16_JC_GHG/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-04-16"

#amount of N fertilsier applied at this moment
con.N.now <- 137.5
ca.N.now <- 127.5

# Temperature on this day 
day.temp <- 11.8

# Rain this week
precip <- 23.967

# Soil Temperature
soil.temp <- 8.8
  
  # Soil Moisture
  soil.moist <- 31.6

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-04-28 ####

#load col names
col.nam <- read.csv("data/2023_04_28_JC_GHG 2023-05-15 10-08-35/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_04_28_JC_GHG 2023-05-15 10-08-35/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-04-28"

#amount of N fertilsier applied at this moment
con.N.now <- 137.5
ca.N.now <- 132.75

# Temperature on this day 
day.temp <- 14.6

# Rain this week
precip <- 6.694

# Soil Temperature
soil.temp <- 9.1
  
  # Soil Moisture
  soil.moist <- 25.5

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-09 ####

#load col names
col.nam <- read.csv("data/2023_05_09_JC_GHG 2023-05-15 16-29-25/REPORT00.CSV",
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_09_JC_GHG 2023-05-15 16-29-25/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-05-09"

#amount of N fertilsier applied at this moment
con.N.now <- 137.5
ca.N.now <- 132.75

# Temperature on this day 
day.temp <- 15.7

# Rain this week
precip <- 14.6

# Soil Temperature
soil.temp <- 12.4
  
  # Soil Moisture
  soil.moist <- 25.4

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-12 ####

#load col names
col.nam <- read.csv("data/2023_05_12_JC_GHG 2023-05-16 15-17-03/REPORT00.CSV", 
                    header = FALSE, sep = ",", 
                    fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_12_JC_GHG 2023-05-16 15-17-03/REPORT01.CSV", 
                header = FALSE, sep = ",", 
                fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-05-12"

#amount of N fertilsier applied at this moment
con.N.now <- 137.5
ca.N.now <- 132.75

# Temperature on this day 
day.temp <- 16.6

# Rain this week
precip <- 15.029

# Soil Temperature
soil.temp <- 12.1
  
  # Soil Moisture
  soil.moist <- 25.3

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-17 ####

#load col names
col.nam <- read.csv("data/2023_05_17_JC_GHG 2023-05-18 09-19-27/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_17_JC_GHG 2023-05-18 09-19-27/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-05-17"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 132.75

# Temperature on this day 
day.temp <- 17

# Rain this week
precip <- 3.646

# Soil Temperature
soil.temp <- 11.9
  
  # Soil Moisture
  soil.moist <- 21.4

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-19 ####

#load col names
col.nam <- read.csv("data/2023_05_19_JC_GHG 2023-05-22 15-29-31/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_19_JC_GHG 2023-05-22 15-29-31/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-05-19"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 132.75

# Temperature on this day 
day.temp <- 16.4

# Rain this week
precip <- 3.376

# Soil Temperature
soil.temp <- 12
  
  # Soil Moisture
  soil.moist <- 16.8 

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-23 ####

#load col names
col.nam <- read.csv("data/2023_05_23_JC_GHG 2023-05-24 16-21-55/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_23_JC_GHG 2023-05-24 16-21-55/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-05-23"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 16.9

# Rain this week
precip <- 1.911

# Soil Temperature
soil.temp <- 12.3
  
  # Soil Moisture
  soil.moist <- 16.3

# add ambient samples to df
#dat <- rbind(dat, ambi)

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-26 ####

#load col names
col.nam <- read.csv("data/2023_05_26_JC_GHG 2023-05-30 11-18-55/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_26_JC_GHG 2023-05-30 11-18-55/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-05-26"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.7

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 13.4
  
  # Soil Moisture
  soil.moist <- 7.3

# add ambient samples to df
#dat <- rbind(dat, ambi)

# Remove A1 as it is an outlier for N2O in this dataset
dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-05-30 ####

#load col names
col.nam <- read.csv("data/2023_05_30_JC_GHG 2023-05-31 13-57-43/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_05_30_JC_GHG 2023-05-31 13-57-43/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-05-30"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 17.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 13.9
  
  # Soil Moisture
  soil.moist <- 7.7

# add ambient samples to df
#dat <- rbind(dat, ambi)

# Remove A1 as it is an outlier for N2O in this dataset
dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)



### 2023-06-02 ####

#load col names
col.nam <- read.csv("data/2023_06_02_JC_GHG 2023-06-02 17-07-59/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_02_JC_GHG 2023-06-02 17-07-59/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-02"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.1

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.8
  
  # Soil Moisture
  soil.moist <- 7.6

# add ambient samples to df
#dat <- rbind(dat, ambi)

# Remove A1 as it is an outlier for N2O in this dataset
dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-06-06 ####

#load col names
col.nam <- read.csv("data/2023_06_06_JC_GHG 2023-06-06 15-03-49/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_06_JC_GHG 2023-06-06 15-03-49/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-06"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 14

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.6
  
  # Soil Moisture
  soil.moist <- 7.2

# add ambient samples to df
#dat <- rbind(dat, ambi)

# Remove A1 as it is an outlier for N2O in this dataset
dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)


### 2023-06-08 ####

#load col names
col.nam <- read.csv("data/2023_06_08_JC_GHG 2023-06-08 16-42-37/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_08_JC_GHG 2023-06-08 16-42-37/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-08"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1
  
  # Soil Moisture
  soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# Remove A1 as it is an outlier for N2O in this dataset
dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-06-14 ####

#load col names
col.nam <- read.csv("data/2023_06_14_JC_GHG 2023-10-27 11-47-07/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_14_JC_GHG 2023-10-27 11-47-07/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-14"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-06-16 ####

#load col names
col.nam <- read.csv("data/2023_06_16_JC_GHG 2023-10-30 13-45-27/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_16_JC_GHG 2023-10-30 13-45-27/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-16"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-06-19 ####

#load col names
col.nam <- read.csv("data/2023_06_19_JC_GHG 2023-10-31 10-54-26/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_19_JC_GHG 2023-10-31 10-54-26/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# add sampling date to df
dat$batch.date <- "2023-06-19"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-06-22 ####

#load col names
col.nam <- read.csv("data/2023_06_22_JC_GHG 2023-10-31 16-44-27/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_22_JC_GHG 2023-10-31 16-44-27/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-06-22"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)



### 2023-06-26 ####

#load col names
col.nam <- read.csv("data/2023_06_26_JC_GHG 2023-11-01 09-38-52/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_26_JC_GHG 2023-11-01 09-38-52/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-06-26"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)



### 2023-06-30 ####

#load col names
col.nam <- read.csv("data/2023_06_30_JC_GHG 2023-11-01 16-32-50/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_06_30_JC_GHG 2023-11-01 16-32-50/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-06-30"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-07-04 ####

#load col names
col.nam <- read.csv("data/2023_07_04_JC_GHG 2023-11-02 10-21-46/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_07_04_JC_GHG 2023-11-02 10-21-46/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-04"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### 2023-07-07 ####

#load col names
col.nam <- read.csv("data/2023_07_07_JC_GHG 2023-11-02 15-26-00/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_07_07_JC_GHG 2023-11-02 15-26-00/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-07"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-07-10 ####

#load col names
col.nam <- read.csv("data/2023_07_10_JC_GHG 2023-11-03 16-38-02/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data
dat <- read.csv("data/2023_07_10_JC_GHG 2023-11-03 16-38-02/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-10"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### 2023-07-18 ####

#load col names
col.nam <- read.csv("data/2023_07_18_JC_GHG 2023-11-06 10-20-52/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data 
dat <- read.csv("data/2023_07_18_JC_GHG 2023-11-06 10-20-52/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-18"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-07-21 ####

#load col names
col.nam <- read.csv("data/2023_07_21_JC_GHG 2023-11-07 09-52-19/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data 
dat <- read.csv("data/2023_07_21_JC_GHG 2023-11-07 09-52-19/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-21"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### 2023-07-28 ####

#load col names
col.nam <- read.csv("data/2023_07_28_JC_GHG 2023-11-08 11-15-49/REPORT00.CSV", 
                    header = FALSE, sep = ",", fileEncoding="UTF-16LE")

col.nam$V3[10] <- "Carbon Dioxide|RT"
col.nam$V3[11] <- "Carbon Dioxide|Area"
col.nam$V3[12] <- "Carbon Dioxide|Amount"

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames and add another col named batch date
col.nam <- as.list(c(col.nam$V3[2:15], "batch.date"))

# load data 
dat <- read.csv("data/2023_07_28_JC_GHG 2023-11-08 11-15-49/REPORT01.CSV", 
                header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# add sampling date to df
dat$batch.date <- "2023-07-28"

#amount of N fertilsier applied at this moment
con.N.now <- 185.5
ca.N.now <- 138.00

# Temperature on this day 
day.temp <- 19.8

# Rain this week
precip <- 0

# Soil Temperature
soil.temp <- 14.1

# Soil Moisture
soil.moist <- 6.9

# add ambient samples to df
#dat <- rbind(dat, ambi)

# # Remove A1 as it is an outlier for N2O in this dataset
# dat <-  filter(dat, V1 != "A1")

# bind new df to existing df running the function
dat <- datFUN(dat)

# filter to just T3 samples for comparison with other days
dat <- filter(dat, t == 3)

# join the 2 df's
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)






## 04 CUMLATIVE SUM ####

# filter to Treatment 
ca.dat <-  filter(mean.dat, Treatment == "Conservation")
con.dat <- filter(mean.dat, Treatment == "Conventional")

# add cumsum to treatment df for all 3 GHG's
ca.dat$cumsum.co2.mg.m3.h <- cumsum(ca.dat$mean.co2.mg.m3.h) # co2 mg
con.dat$cumsum.co2.mg.m3.h <- cumsum(con.dat$mean.co2.mg.m3.h)

ca.dat$cumsum.co2.g.m3.h <- cumsum(ca.dat$mean.co2.g.m3.h) # co2 g
con.dat$cumsum.co2.g.m3.h <- cumsum(con.dat$mean.co2.g.m3.h)

ca.dat$cumsum.n2o.mg.m3.h <- cumsum(ca.dat$mean.n2o.mg.m3.h)
con.dat$cumsum.n2o.mg.m3.h <- cumsum(con.dat$mean.n2o.mg.m3.h)

ca.dat$cumsum.ch4.mg.m3.h <- cumsum(ca.dat$mean.ch4.mg.m3.h)
con.dat$cumsum.ch4.mg.m3.h <- cumsum(con.dat$mean.ch4.mg.m3.h)

# join the 2 df's
mean.dat <- rbind(ca.dat, con.dat)



## 05 WRITE FILES ####

write.csv(mean.dat, file = "data/processed.data/mean.flux.data.csv")

write.csv(gc.dat, file = "data/processed.data/gc.data.all.days.csv")

