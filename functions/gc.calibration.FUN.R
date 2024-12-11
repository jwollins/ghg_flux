## HEADER ####
## who: J Collins
## what: Function to run all changes to Gas chromatograph csv files 
## WHAT: CALIBRATION OF STATIC CHAMBERS
## TEST DATE: 2023-03-06

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
  batch.date <- substring(batch.name,62,71)
  day <- "Calibration"
  dat$batch.date <- as.Date(batch.date)
 # dat$day <- as.numeric(day)
  
  # add the chamber names to the df
  dat$chamber <- ifelse(dat$Sample == "21TB" | 
                        dat$Sample == "37TA" | 
                         dat$Sample == "16TA"| 
                         dat$Sample == "35TB", 1, NA)
  
  dat$chamber <- ifelse(dat$Sample == "24TC" | 
                          dat$Sample == "37TB" | 
                          dat$Sample == "29TA"| 
                          dat$Sample == "38TA", 2, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "26TB" | 
                          dat$Sample == "26TA" | 
                          dat$Sample == "16TC"| 
                          dat$Sample == "28TB", 3, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "38TB" | 
                          dat$Sample == "36TB" | 
                          dat$Sample == "26TC"| 
                          dat$Sample == "34TC", 4, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "29TB" | 
                          dat$Sample == "25TA" | 
                          dat$Sample == "35TA"| 
                          dat$Sample == "17TA"| 
                          dat$Sample == "35TC", 5, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "36TC" | 
                          dat$Sample == "28TC" | 
                          dat$Sample == "15TC"| 
                          dat$Sample == "34TB"| 
                          dat$Sample == "25TC", 6, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "33TA" | 
                          dat$Sample == "31TC" | 
                          dat$Sample == "37TC"| 
                          dat$Sample == "16TB"| 
                          dat$Sample == "33TB", 7, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "25TB" | 
                          dat$Sample == "24TB" | 
                          dat$Sample == "24TA"| 
                          dat$Sample == "27TC"| 
                          dat$Sample == "34TA", 8, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "33TC" | 
                          dat$Sample == "15TA" | 
                          dat$Sample == "23TB"| 
                          dat$Sample == "30TA"| 
                          dat$Sample == "27TA", 9, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "38TC" | 
                          dat$Sample == "32TA" | 
                          dat$Sample == "36TA"| 
                          dat$Sample == "17TC"| 
                          dat$Sample == "27TB", 10, dat$chamber)
  
  # add the sampling times to the df
  dat$t <- ifelse(dat$Sample == "29TB" | 
                          dat$Sample == "36TC" | 
                          dat$Sample == "33TA"| 
                          dat$Sample == "25TB"| 
                          dat$Sample == "33TC"| 
                          dat$Sample == "38TC", 0, NA)
  
  dat$t <- ifelse(dat$Sample == "21TB" | 
                    dat$Sample == "24TC" | 
                    dat$Sample == "26TB"| 
                    dat$Sample == "38TB"| 
                    dat$Sample == "25TA"| 
                    dat$Sample == "28TC"| 
                    dat$Sample == "31TC"| 
                    dat$Sample == "24TB"| 
                    dat$Sample == "15TA"| 
                    dat$Sample == "32TA", 1, dat$t)
  
  dat$t <- ifelse(dat$Sample == "37TA" | 
                    dat$Sample == "37TB" | 
                    dat$Sample == "26TA"| 
                    dat$Sample == "36TB"| 
                    dat$Sample == "35TA"| 
                    dat$Sample == "15TC"| 
                    dat$Sample == "37TC"| 
                    dat$Sample == "24TA"| 
                    dat$Sample == "23TB"| 
                    dat$Sample == "36TA", 2, dat$t)
  
  dat$t <- ifelse(dat$Sample == "16TA" | 
                    dat$Sample == "29TA" | 
                    dat$Sample == "16TC"| 
                    dat$Sample == "26TC"| 
                    dat$Sample == "17TA"| 
                    dat$Sample == "34TB"| 
                    dat$Sample == "16TB"| 
                    dat$Sample == "27TC"| 
                    dat$Sample == "30TA"| 
                    dat$Sample == "17TC", 3, dat$t)
  
  dat$t <- ifelse(dat$Sample == "35TB" | 
                    dat$Sample == "38TA" | 
                    dat$Sample == "28TB"| 
                    dat$Sample == "34TC"| 
                    dat$Sample == "35TC"| 
                    dat$Sample == "25TC"| 
                    dat$Sample == "33TB"| 
                    dat$Sample == "34TA"| 
                    dat$Sample == "27TA"| 
                    dat$Sample == "27TB", 4, dat$t)
  
 
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "29TB"|Sample == "36TC"|Sample == "33TA"|Sample == "25TB"|Sample == "33TC"|Sample == "38TC")
  
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
  
  # volume of headspace in cm3
  head.vol <- 6283.19
  # convert to liters
  head.vol <- head.vol/1000
  
  # this adds the volume of the headspace of the chamber to the df
  dat$head.vol <- head.vol
  
  # set the experimental time 
  experiment.time <- 01.00
  # calculate ppm/h and add to ppm.h in df
  dat$co2.ppm.h <- (dat$co2.area / experiment.time) * 01.00
  dat$n2o.ppm.h <- (dat$n2o.area / experiment.time) * 01.00
  dat$ch4.ppm.h <- (dat$ch4.area / experiment.time) * 01.00
  
  # add factors
  
  dat$chamber <- as.factor(dat$chamber)
  
  return(dat)
}




