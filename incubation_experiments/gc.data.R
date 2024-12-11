## HEADER ####
## who: J Collins
## what: Gas chromatograph data read all days and combine to df
## when: 2023-03-19

## CONTENTS ####
## 00 PACKAGES ####
## 01 LOAD DATA ####

  ## PACKAGES ####

library(dplyr)
library(tidyr)
library(plotrix)

## SOURCE SCRIPTS ####

source("scripts/functions/gc.csv.FUN.R")

### DAY 0 ####

# load column names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_0/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/CO2N2OCH4/JC_DAY_0/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run function to extract data from the csv and transform
dat <- datFUN(dat)

# assign output of function to new df
gc.dat <- dat

# aggregate gc.dat to mean summary df
mean.dat <- meanFUN(dat)





### DAY 1 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_1/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_1/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# bind new df to existing df running the function
dat <- datFUN(dat)

gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 2 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_2/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_2/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)






### DAY 3 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_3/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_3/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 4 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_4/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_4/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 5 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_5/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_5/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 7 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_7/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_7/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 9 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_9/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_9/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")
# bind new df to existing df running the function
dat <- datFUN(dat)
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)

# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 12 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_12/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_12/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat <- datFUN2(dat)

# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 15 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_15/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_15/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run dat with new function
dat <- datFUN2(dat)
# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




### DAY 19 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_19/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_19/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run dat with new function
dat <- datFUN2(dat)
# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 23 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_23/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_23/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run dat with new function
dat <- datFUN2(dat)
# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 30 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_30/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_30/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run dat with new function
dat <- datFUN2(dat)
# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)





### DAY 57 ####

#load col names
col.nam <- read.csv("data/CO2N2OCH4/JC_DAY_57/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load data
dat <- read.csv("data/CO2N2OCH4/JC_DAY_57/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run dat with new function
dat <- datFUN2(dat)
# bind new df to existing df
gc.dat <- rbind(gc.dat, dat)

# run mean summary function
dat <- meanFUN(dat)
# extract the day using substring
day <- substring(batch.name,39,40)
# add day to mean df
dat$day <- day
# bind new df to total df
mean.dat <- rbind(mean.dat, dat)




## WRITE FILES ####

write.csv(mean.dat, file = "data/CO2N2OCH4/mean.flux.data")

write.csv(gc.dat, file = "data/CO2N2OCH4/gc.data.all.days")

