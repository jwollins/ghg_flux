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
col.nam <- read.csv("data/JC_St_Ch_calibration/data/REPORT00.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

# extract batch name
batch.name <- col.nam$V3[1]
# extract colnames
col.nam <- as.list(col.nam$V3[2:15])

# load csv data from gc output
dat <- read.csv("data/JC_St_Ch_calibration/data/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat2 <- read.csv("data/JC_St_Ch_calibration/data/RUN2/REPORT01.CSV", header = FALSE, sep = ",", fileEncoding="UTF-16LE")

dat <- rbind(dat, dat2)

# run function to extract data from the csv and transform
dat <- datFUN(dat)


## WRITE FILES ####


# write.csv(gc.dat, file = "data/CO2N2OCH4/gc.data.all.days")


## PLOT CALIBRATION ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/", "CO2 calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Carbon Dioxide|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber)) + 
  ylim(575,675)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Carbon Dioxide", subtitle = "No rubber seals")

# turn save off 
dev.off()


# open png for file save and define size and resolution
png(paste("plots/calibration.test/", "N2O calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Nitrous Oxide|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber))+ 
  ylim(0.285,0.33)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Nitrous Oxide", subtitle = "No rubber seals")

# turn save off 
dev.off()

# open png for file save and define size and resolution
png(paste("plots/calibration.test/", "CH4 calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(dat, aes(x = t, y = `Methane|Amount`, group = chamber)) +
  geom_line(aes(color = chamber)) +
  geom_point(aes(color = chamber)) + 
  ylim(1.9,2.15) + 
  ggtitle(label = "Calibration test 06/03/2023 - Methane", subtitle = "No rubber seals")

# turn save off 
dev.off()
