## HEADER ####
## who: J Collins
## what: Function to run all changes to Gas chromatograph csv files 
## WHAT: PotatoLite GHG analysis function
## TEST DATE: 2023-06-21

## CONTENTS ####
## 00 PACKAGES ####
## 01 LOAD DATA ####

## EXTRACT SINGLE DIGIT DAYS ###

# make function to run the data frame changes on all csv files
bubb.postplant.FUN <- function(dat) {
  # rename cols
  names(dat) <- c(col.nam)
  
  # add batch name to data frame
  dat$batch <- batch.name
  
  # extract batch date and day no. and add to main data frame 
  # batch.date <- substring(batch.name,45,54)
  # day <- "Calibration"
  # dat$batch.date <- as.Date(batch.date)
 # dat$day <- as.numeric(day)
  
  ## block ####
  
  # add the block names to the df
  dat$block <- ifelse(dat$Sample == "1-1-14" | 
                        dat$Sample == "1-1-7" |
                          dat$Sample == "1-1-28" | 
                          dat$Sample == "1-2-14"|
                          dat$Sample == "1-2-28" | 
                          dat$Sample == "1-3-14"|
                          dat$Sample == "1-3-28" | 
                          dat$Sample == "1-4-14"|
                          dat$Sample == "1-4-28", 1, NA)
  
  dat$block <- ifelse(dat$Sample == "2-1-14" | 
                          dat$Sample == "2-1-28" | 
                          dat$Sample == "2-2-14"|
                          dat$Sample == "2-2-28" | 
                          dat$Sample == "2-3-14"|
                          dat$Sample == "2-3-28" | 
                          dat$Sample == "2-4-14"|
                          dat$Sample == "2-4-28", 2, dat$block)
  
  dat$block <- ifelse(dat$Sample == "3-1-14" | 
                        dat$Sample == "3-1-28" | 
                        dat$Sample == "3-2-14"|
                        dat$Sample == "3-2-28" | 
                        dat$Sample == "3-3-14"|
                        dat$Sample == "3-3-28" | 
                        dat$Sample == "3-4-14"|
                        dat$Sample == "3-4-28", 3, dat$block)
  
  dat$block <- ifelse(dat$Sample == "4-1-14" | 
                        dat$Sample == "4-1-28" | 
                        dat$Sample == "4-2-14"|
                        dat$Sample == "4-2-28" | 
                        dat$Sample == "4-3-14"|
                        dat$Sample == "4-3-28" | 
                        dat$Sample == "4-4-14"|
                        dat$Sample == "4-4-28", 4, dat$block)
  
  dat$block <- ifelse(dat$Sample == "5-1-14" | 
                        dat$Sample == "5-1-28" | 
                        dat$Sample == "5-2-14"|
                        dat$Sample == "5-2-28" | 
                        dat$Sample == "5-3-14"|
                        dat$Sample == "5-3-28" | 
                        dat$Sample == "5-4-14"|
                        dat$Sample == "5-4-28", 5, dat$block)
  
  dat$block <- ifelse(dat$Sample == "6-1-14" | 
                        dat$Sample == "6-1-28" | 
                        dat$Sample == "6-2-14"|
                        dat$Sample == "6-2-28" | 
                        dat$Sample == "6-3-14"|
                        dat$Sample == "6-3-28" | 
                        dat$Sample == "6-4-14"|
                        dat$Sample == "6-4-28", 6, dat$block)
  
  ## plot ####
  
  # add the plot names to the df
  dat$plot <- ifelse(dat$Sample == "1-1-14" | 
                       dat$Sample == "1-1-7" |
                        dat$Sample == "1-1-28" | 
                        dat$Sample == "2-1-14"|
                        dat$Sample == "2-1-28" | 
                        dat$Sample == "3-1-14"|
                        dat$Sample == "3-1-28" | 
                        dat$Sample == "4-1-14"|
                        dat$Sample == "4-1-28"|
                        dat$Sample == "5-1-14"|
                        dat$Sample == "5-1-28"|
                        dat$Sample == "6-1-14"|
                        dat$Sample == "6-1-28" , 1, NA)
  
  dat$plot <- ifelse(dat$Sample == "1-2-14" | 
                       dat$Sample == "1-2-28" | 
                       dat$Sample == "2-2-14"|
                       dat$Sample == "2-2-28" | 
                       dat$Sample == "3-2-14"|
                       dat$Sample == "3-2-28" | 
                       dat$Sample == "4-2-14"|
                       dat$Sample == "4-2-28"|
                       dat$Sample == "5-2-14"|
                       dat$Sample == "5-2-28"|
                       dat$Sample == "6-2-14"|
                       dat$Sample == "6-2-28", 2, dat$plot)
  
  dat$plot <- ifelse(dat$Sample == "1-3-14" | 
                       dat$Sample == "1-3-28" | 
                       dat$Sample == "2-3-14"|
                       dat$Sample == "2-3-28" | 
                       dat$Sample == "3-3-14"|
                       dat$Sample == "3-3-28" | 
                       dat$Sample == "4-3-14"|
                       dat$Sample == "4-3-28"|
                       dat$Sample == "5-3-14"|
                       dat$Sample == "5-3-28"|
                       dat$Sample == "6-3-14"|
                       dat$Sample == "6-3-28", 3, dat$plot)
  
  dat$plot <- ifelse(dat$Sample == "1-4-14" | 
                       dat$Sample == "1-4-28" | 
                       dat$Sample == "2-4-14"|
                       dat$Sample == "2-4-28" | 
                       dat$Sample == "3-4-14"|
                       dat$Sample == "3-4-28" | 
                       dat$Sample == "4-4-14"|
                       dat$Sample == "4-4-28"|
                       dat$Sample == "5-4-14"|
                       dat$Sample == "5-4-28"|
                       dat$Sample == "6-4-14"|
                       dat$Sample == "6-4-28", 4, dat$plot)

  ## sample time ####
  
  # add the sample time to the df
  dat$timing <- ifelse(dat$Sample == "1-1-14" |
                         dat$Sample == "1-1-7" |
                       dat$Sample == "2-1-14" | 
                       dat$Sample == "3-1-14"|
                       dat$Sample == "4-1-14" | 
                       dat$Sample == "5-1-14"|
                       dat$Sample == "6-1-14" | 
                       dat$Sample == "1-2-14"|
                       dat$Sample == "2-2-14"|
                       dat$Sample == "3-2-14"|
                       dat$Sample == "4-2-14"|
                       dat$Sample == "5-2-14"|
                       dat$Sample == "6-2-14" | 
                       dat$Sample == "1-3-14"|
                       dat$Sample == "2-3-14"|
                       dat$Sample == "3-3-14"|
                       dat$Sample == "4-3-14"|
                       dat$Sample == "5-3-14"|
                       dat$Sample == "6-3-14"| 
                       dat$Sample == "1-4-14"|
                       dat$Sample == "2-4-14"|
                       dat$Sample == "3-4-14"|
                       dat$Sample == "4-4-14"|
                       dat$Sample == "5-4-14"|
                       dat$Sample == "6-4-14", 14, NA)
  
  dat$timing <- ifelse(dat$Sample == "1-1-28" | 
                       dat$Sample == "2-1-28" | 
                       dat$Sample == "3-1-28"|
                       dat$Sample == "4-1-28" | 
                       dat$Sample == "5-1-28"|
                       dat$Sample == "6-1-28" | 
                       dat$Sample == "1-2-28"|
                       dat$Sample == "2-2-28"|
                       dat$Sample == "3-2-28"|
                       dat$Sample == "4-2-28"|
                       dat$Sample == "5-2-28"|
                       dat$Sample == "6-2-28" | 
                       dat$Sample == "1-3-28"|
                       dat$Sample == "2-3-28"|
                       dat$Sample == "3-3-28"|
                       dat$Sample == "4-3-28"|
                       dat$Sample == "5-3-28"|
                       dat$Sample == "6-3-28"| 
                       dat$Sample == "1-4-28"|
                       dat$Sample == "2-4-28"|
                       dat$Sample == "3-4-28"|
                       dat$Sample == "4-4-28"|
                       dat$Sample == "5-4-28"|
                       dat$Sample == "6-4-28", 28, dat$timing)
  
  ## Treatment ####
  # add treatment to the df

  dat$Treatment <- ifelse(dat$Sample == "1-2-14" | 
                            dat$Sample == "1-2-28" |
                            dat$Sample == "2-3-14" |
                            dat$Sample == "2-3-28" | 
                            dat$Sample == "3-2-14"|
                            dat$Sample == "3-2-28"|
                            dat$Sample == "4-3-14" | 
                            dat$Sample == "4-3-28" | 
                            dat$Sample == "5-3-14"|
                            dat$Sample == "5-3-28"|
                            dat$Sample == "6-1-14"|
                            dat$Sample == "6-1-28", yes = "Conventional", no = NA)
  
  dat$Treatment <- ifelse(dat$Sample == "1-1-14" | 
                            dat$Sample == "1-1-7" |
                            dat$Sample == "1-1-28" |
                            dat$Sample == "2-4-14" |
                            dat$Sample == "2-4-28" | 
                            dat$Sample == "3-3-14"|
                            dat$Sample == "3-3-28"|
                            dat$Sample == "4-2-14" | 
                            dat$Sample == "4-2-28" | 
                            dat$Sample == "5-2-14"|
                            dat$Sample == "5-2-28"|
                            dat$Sample == "6-3-14"|
                            dat$Sample == "6-3-28", yes = "Fixed Tine Cover Crop", no = dat$Treatment)
  
  dat$Treatment <- ifelse(dat$Sample == "1-3-14" | 
                            dat$Sample == "1-3-28" |
                            dat$Sample == "2-1-14" |
                            dat$Sample == "2-1-28" | 
                            dat$Sample == "3-1-14"|
                            dat$Sample == "3-1-28"|
                            dat$Sample == "4-4-14" | 
                            dat$Sample == "4-4-28" | 
                            dat$Sample == "5-4-14"|
                            dat$Sample == "5-4-28"|
                            dat$Sample == "6-2-14"|
                            dat$Sample == "6-2-28", yes = "Strip Tillage", no = dat$Treatment)
  
  dat$Treatment <- ifelse(dat$Sample == "1-4-14" | 
                            dat$Sample == "1-4-28" |
                            dat$Sample == "2-2-14" |
                            dat$Sample == "2-2-28" | 
                            dat$Sample == "3-4-14"|
                            dat$Sample == "3-4-28"|
                            dat$Sample == "4-1-14" | 
                            dat$Sample == "4-1-28" | 
                            dat$Sample == "5-1-14"|
                            dat$Sample == "5-1-28"|
                            dat$Sample == "6-4-14"|
                            dat$Sample == "6-4-28", yes = "Fixed Tine No Cover Crop", no = dat$Treatment)


  ## ambient samples ####
 
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "A1"|Sample == "A2"|Sample == "A3" |Sample == "A4"|Sample == "A5"|Sample == "A6")
  
  # add the mean of the co2 coloumn in ambi df to the dat df under col name bg.co2
  dat$bg.co2 <- mean(ambi$`Carbon Dioxide|Amount`)
  dat$bg.n2o <- mean(ambi$`Nitrous Oxide|Amount`)
  dat$bg.ch4 <- mean(ambi$`Methane|Amount`)
  
  # correct for background ppm 
  dat$co2.area <- dat$`Carbon Dioxide|Amount` - dat$bg.co2
  dat$n2o.area <- dat$`Nitrous Oxide|Amount` - dat$bg.n2o
  dat$ch4.area <- dat$`Methane|Amount` - dat$bg.ch4
  
  
  ## calculations ####
  
  # volume of headspace in cm3
  head.vol.cm3 <- 1570.80
  
  # convert head vol in cm3 to liters
  head.vol.l <- head.vol.cm3/1000
  
  # this adds the volume of the headspace of the chamber to the df
  dat$head.vol.l <- head.vol.l
  
  # set chamber area in cm2
  chamber.area.cm2 <- 78.54
  
  # set chamber area in m2
  dat$chamber.area.m2 <- chamber.area.cm2 / 10000
  
  # calculate ppm/h and add to ppm.h in df
  dat$co2.ppm.h <- (dat$co2.area / dat$timing * 60)
  dat$n2o.ppm.h <- (dat$n2o.area / dat$timing * 60)
  dat$ch4.ppm.h <- (dat$ch4.area / dat$timing * 60)
  
  # CONVERT PPM TO MG/M3
  # Formula: concentration (mg/m3) = 0.0409 x concentration (ppm) x molecular weight
  
  co2.mol.weight <- 44.01
  n2o.mol.weight <- 44.013
  ch4.mol.weight <- 16.04
  
  gas.constant <- 0.0821
  
  dat$co2.mg.m3.h <- ((dat$co2.ppm.h * head.vol.l * co2.mol.weight) / (day.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  dat$n2o.mg.m3.h <- ((dat$n2o.ppm.h * head.vol.l * n2o.mol.weight) / (day.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  dat$ch4.mg.m3.h <- ((dat$ch4.ppm.h * head.vol.l * ch4.mol.weight) / (day.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  
  dat$co2.g.m3.h <- dat$co2.mg.m3.h / 1000
  
  # add factors
  
  dat$plot <- as.factor(dat$plot)
  dat$timing <- as.factor(dat$timing)
  dat$Treatment <- as.factor(dat$Treatment)
  
  # #Remove rows with sample name not equal to the ambient samples or standards
  dat <-  filter(dat, Sample != "500ppbN2O/3ppmCH4" &
                    Sample != "250ppbN2O/2ppmCH4" &
                    Sample != "1000ppmCO2" &
                    Sample != "500ppmCO2" &
                    Sample != "A1" &
                    Sample != "A2" &
                    Sample != "A3" &
                   Sample != "A4" &
                   Sample != "A5" &
                   Sample != "A6" )
  
  return(dat)
}




