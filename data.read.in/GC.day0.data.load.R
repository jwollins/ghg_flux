## read Gas chromatograph data ####
## Who: JW Collins 
## what:  
## Last edited: 2023-03-08


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## PACKAGES ####

library(dplyr)
library(tidyr)
library(plotrix)
library(ggplot2)

## SOURCE SCRIPTS ####

source("scripts/functions/gc.csv.FUN.R")

### CALIBRATION OF STATIC CHAMBERS ####

# load column names
col.nam <- read.csv("data/JC_GHG_DAY_0/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/JC_GHG_DAY_0/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# run function to extract data from the csv and transform
dat <- datFUN(dat)



## WRITE FILES ####


# write.csv(gc.dat, file = "data/CO2N2OCH4/gc.data.all.days")


## PLOT CALIBRATION ####

# open png for file save and define size and resolution
  png(paste("plots/2023_03_10/", "CO2 2023_03_10", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Carbon Dioxide|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber)) + 
#  ylim(min(dat$`Carbon Dioxide|Amount`), max(dat$`Carbon Dioxide|Amount`))+ 
  ggtitle(label = "Calibration test 06/03/2023 - Carbon Dioxide", subtitle = "2023_03_10")+ 
  xlab(label = "Sampling time point") +
  ylab(label = "CO2 (ppm)")

# turn save off 
dev.off()


# open png for file save and define size and resolution
png(paste("plots/2023_03_10/", "N2O 2023_03_10", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Nitrous Oxide|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber))+ 
  ggtitle(label = "Calibration test 06/03/2023 - Nitrous Oxide", subtitle = "2023_03_10") + 
  xlab(label = "Sampling time point") +
  ylab(label = "Nitrous Oxide (ppm)")
# turn save off 
dev.off()

# open png for file save and define size and resolution
png(paste("plots/2023_03_10/", "CH4 2023_03_10", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Methane|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber)) + 
  ggtitle(label = "Calibration test 06/03/2023 - Methane", subtitle = "2023_03_10")+ 
  xlab(label = "Sampling time point") +
  ylab(label = "CH4 (ppm)")

# turn save off 
dev.off()
