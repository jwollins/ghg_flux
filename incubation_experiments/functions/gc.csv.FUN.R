## HEADER ####
## who: J Collins
## what: Function to run all changes to Gas chromatograph csv files 
## when: 2023-03-19

## CONTENTS ####
## 00 PACKAGES ####
## 01 LOAD DATA ####

## EXTRACT SINGLE DIGIT DAYS ###

# make function to run the data frame changes on all csv files
datFUN <- function(dat) {
  # rename cols
  names(dat) <- c(col.nam)
  
  # add batch name to data frame
  dat$batch <- batch.name
  
  # extract batch date and day no. and add to main data frame 
  batch.date <- substring(batch.name,41,50)
  day <- substring(batch.name,39,39)
  dat$batch.date <- as.Date(batch.date)
  dat$day <- as.numeric(day)
  
  # add the treatment names to the df
  dat$wfps <- ifelse(dat$Sample == "1A" | 
                       dat$Sample == "2A"| 
                       dat$Sample == "3A"|
                       dat$Sample == "4A"| 
                       dat$Sample == "5A"| 
                       dat$Sample == "6A"| 
                       dat$Sample == "7A"|
                       dat$Sample == "8A"| 
                       dat$Sample == "9A"| 
                       dat$Sample == "10A"| 
                       dat$Sample == "11A"|
                       dat$Sample == "12A"| 
                       dat$Sample == "13A"| 
                       dat$Sample == "14A"| 
                       dat$Sample == "15A"|
                       dat$Sample == "16A", 60, 90)
  
  dat$cc <- ifelse(  dat$Sample == "2A" | 
                       dat$Sample == "4A"| 
                       dat$Sample == "6A"|
                       dat$Sample == "8A"| 
                       dat$Sample == "10A"| 
                       dat$Sample == "12A"| 
                       dat$Sample == "14A"|
                       dat$Sample == "16A"|
                       dat$Sample == "2B"| 
                       dat$Sample == "4B"| 
                       dat$Sample == "6B"| 
                       dat$Sample == "8B"|
                       dat$Sample == "10B"| 
                       dat$Sample == "12B"| 
                       dat$Sample == "14B"| 
                       dat$Sample == "16B", "legume", "brassica")
  
  dat$chop <- ifelse(  dat$Sample == "2A" | 
                         dat$Sample == "6A"|
                         dat$Sample == "10A"| 
                         dat$Sample == "14A"|
                         dat$Sample == "2B"| 
                         dat$Sample == "6B"| 
                         dat$Sample == "10B"| 
                         dat$Sample == "14B"| 
                         dat$Sample == "1A"| 
                         dat$Sample == "5A"|
                         dat$Sample == "9A"|
                         dat$Sample == "13A"| 
                         dat$Sample == "1B"| 
                         dat$Sample == "5B"|
                         dat$Sample == "9B"|
                         dat$Sample == "13B", "chop", "grind")
  
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "EMP1"|Sample == "EMP2"|Sample == "EMP3"|Sample == "EMP4")
  
  # add the mean of the co2 coloumn in ambi df to the dat df under col name bg.co2
  dat$bg.co2 <- mean(ambi$`Carbon Dioxide|Amount`)
  dat$bg.n2o <- mean(ambi$`Nitrous Oxide|Amount`)
  dat$bg.ch4 <- mean(ambi$`Methane|Amount`)
  
  # correct for background ppm 
  dat$co2.area <- dat$`Carbon Dioxide|Amount` - dat$bg.co2
  dat$n2o.area <- dat$`Nitrous Oxide|Amount` - dat$bg.n2o
  dat$ch4.area <- dat$`Methane|Amount` - dat$bg.ch4
  
  # add time in minutes
  dat$time <- 0.1
  
  # this adds the volume of the headspace of the chamber to the df. Add volume in litres
  dat$head.vol <- 1.08149
  
  # set the experimental time 
  experiment.time <- 01.00
  # calculate ppm/h and add to ppm.h in df
  dat$co2.ppm.h <- (dat$co2.area / experiment.time) * 01.00
  dat$n2o.ppm.h <- (dat$n2o.area / experiment.time) * 01.00
  dat$ch4.ppm.h <- (dat$ch4.area / experiment.time) * 01.00
  
  # area of static chamber (cm2)
  sc.area <- 0.006362
  
  
  
  return(dat)
}


## EXTRACT DOUBLE DIGITS DAYS ###

# make function for double digit days to run the data frame changes on all csv files
# the first function only extracts one digit so another is needed

datFUN2 <- function(dat) {
  # rename cols
  names(dat) <- c(col.nam)
  
  # add batch name to data frame
  dat$batch <- batch.name
  
  # extract batch date and day no. and add to main data frame 
  batch.date <- substring(batch.name,42,51)
  day <- substring(batch.name,39,40)
  dat$batch.date <- as.Date(batch.date)
  dat$day <- as.numeric(day)
  
  dat$wfps <- ifelse(dat$Sample == "1A" | 
                       dat$Sample == "2A"| 
                       dat$Sample == "3A"|
                       dat$Sample == "4A"| 
                       dat$Sample == "5A"| 
                       dat$Sample == "6A"| 
                       dat$Sample == "7A"|
                       dat$Sample == "8A"| 
                       dat$Sample == "9A"| 
                       dat$Sample == "10A"| 
                       dat$Sample == "11A"|
                       dat$Sample == "12A"| 
                       dat$Sample == "13A"| 
                       dat$Sample == "14A"| 
                       dat$Sample == "15A"|
                       dat$Sample == "16A", 60, 90)
  
  dat$cc <- ifelse(  dat$Sample == "2A" | 
                       dat$Sample == "4A"| 
                       dat$Sample == "6A"|
                       dat$Sample == "8A"| 
                       dat$Sample == "10A"| 
                       dat$Sample == "12A"| 
                       dat$Sample == "14A"|
                       dat$Sample == "16A"|
                       dat$Sample == "2B"| 
                       dat$Sample == "4B"| 
                       dat$Sample == "6B"| 
                       dat$Sample == "8B"|
                       dat$Sample == "10B"| 
                       dat$Sample == "12B"| 
                       dat$Sample == "14B"| 
                       dat$Sample == "16B", "legume", "brassica")
  
  dat$chop <- ifelse(  dat$Sample == "2A" | 
                         dat$Sample == "6A"|
                         dat$Sample == "10A"| 
                         dat$Sample == "14A"|
                         dat$Sample == "2B"| 
                         dat$Sample == "6B"| 
                         dat$Sample == "10B"| 
                         dat$Sample == "14B"| 
                         dat$Sample == "1A"| 
                         dat$Sample == "5A"|
                         dat$Sample == "9A"|
                         dat$Sample == "13A"| 
                         dat$Sample == "1B"| 
                         dat$Sample == "5B"|
                         dat$Sample == "9B"|
                         dat$Sample == "13B", "chop", "grind")
  
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "EMP1"|Sample == "EMP2"|Sample == "EMP3"|Sample == "EMP4")
  
  # add the mean of the co2 coloumn in ambi df to the dat df under col name bg.co2
  dat$bg.co2 <- mean(ambi$`Carbon Dioxide|Amount`)
  dat$bg.n2o <- mean(ambi$`Nitrous Oxide|Amount`)
  dat$bg.ch4 <- mean(ambi$`Methane|Amount`)
  
  # correct for background ppm 
  dat$co2.area <- dat$`Carbon Dioxide|Amount` - dat$bg.co2
  dat$n2o.area <- dat$`Nitrous Oxide|Amount` - dat$bg.n2o
  dat$ch4.area <- dat$`Methane|Amount` - dat$bg.ch4
  
  # add time in minutes
  dat$time <- 0.1
  
  # this adds the volume of the headspace of the chamber to the df
  dat$head.vol <- 0.7
  
  # set the experimental time 
  experiment.time <- 01.00
  # calculate ppm/h and add to ppm.h in df
  dat$co2.ppm.h <- (dat$co2.area / experiment.time) * 01.00
  dat$n2o.ppm.h <- (dat$n2o.area / experiment.time) * 01.00
  dat$ch4.ppm.h <- (dat$ch4.area / experiment.time) * 01.00
  
  return(dat)
}


## GROUP MEAN FUNCTION ####

# group mean function to summarise the treatment effects and return the sample mean
meanFUN <- function(dat) {
  
  # aggregate CO2 data
  mean.co2 <- aggregate(x = dat$co2.ppm.h, 
                    by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) mean(x, na.rm=T))
  
  sd.co2 <- aggregate(x = dat$co2.ppm.h, 
                  by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) sd(x, na.rm=T))
  
  se.co2 <- aggregate(x = dat$co2.ppm.h, 
                  by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) std.error(x, na.rm=T))
  
  med.co2 <- aggregate(x = dat$co2.ppm.h, 
                   by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) median(x, na.rm=T))
  
  # aggregate N2O data
  mean.n2o <- aggregate(x = dat$n2o.ppm.h, 
                        by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) mean(x, na.rm=T))
  
  sd.n2o <- aggregate(x = dat$n2o.ppm.h, 
                      by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) sd(x, na.rm=T))
  
  se.n2o <- aggregate(x = dat$n2o.ppm.h, 
                      by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) std.error(x, na.rm=T))
  
  med.n2o <- aggregate(x = dat$n2o.ppm.h, 
                       by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) median(x, na.rm=T))
  
  # aggregate CH4 data
  mean.ch4 <- aggregate(x = dat$ch4.ppm.h, 
                        by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) mean(x, na.rm=T))
  
  sd.ch4 <- aggregate(x = dat$ch4.ppm.h, 
                      by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) sd(x, na.rm=T))
  
  se.ch4 <- aggregate(x = dat$ch4.ppm.h, 
                      by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) std.error(x, na.rm=T))
  
  med.ch4 <- aggregate(x = dat$ch4.ppm.h, 
                       by = list(dat$wfps, dat$cc, dat$chop), FUN = function(x) median(x, na.rm=T))
  
  dat <- data.frame(wfps = factor(mean.co2[ ,1]),
                    crop = factor(mean.co2[ ,2]),
                    chop = factor(mean.co2[ ,3]),
                    mean.co2 = mean.co2[ ,4],
                    sd.co2 = sd.co2[ , 4],
                    se.co2 = se.co2[ , 4],
                    med.co2 = med.co2[ , 4],
                    mean.n2o = mean.n2o[ ,4],
                    sd.n2o = sd.n2o[ , 4],
                    se.n2o = se.n2o[ , 4],
                    med.n2o = med.n2o[ , 4],
                    mean.ch4 = mean.ch4[ ,4],
                    sd.ch4 = sd.ch4[ , 4],
                    se.ch4 = se.ch4[ , 4],
                    med.ch4 = med.ch4[ , 4])
  
  ## ADD TREATMENTS ####
  
  # extract batch date and day no. and add to main data frame 
  day <- substring(batch.name,39,40)
  dat$day <- as.numeric(day)
  
  # change column names of all the columns in the mean dataframe 
#  colnames(dat) <- c("wfps","crop", "chop" , "co2.mean.ppm.h", "day") 
  
  dat$treatment <- ifelse(dat$wfps == 60 & dat$crop == "legume" & dat$chop == "chop", "LC60", 0)
  dat$treatment <- ifelse(dat$wfps == 90 & dat$crop == "legume" & dat$chop == "chop", "LC90", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 60 & dat$crop == "brassica" &dat$chop == "chop", "BC60", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 90 & dat$crop == "brassica" &dat$chop == "chop", "BC90", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 60 & dat$crop == "legume" & dat$chop == "grind", "LG60", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 90 & dat$crop == "legume" & dat$chop == "grind", "LG90", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 60 & dat$crop == "brassica" & dat$chop == "grind", "BG60", dat$treatment)
  dat$treatment <- ifelse(dat$wfps == 90 & dat$crop == "brassica" & dat$chop == "grind", "BG90", dat$treatment)
  
  return(dat)
}

