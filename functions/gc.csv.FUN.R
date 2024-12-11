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
  # batch.date <- substring(batch.name,45,54)
  # day <- "Calibration"
  # dat$batch.date <- as.Date(batch.date)
 # dat$day <- as.numeric(day)
  
  # add the chamber names to the df
  dat$chamber <- ifelse(dat$Sample == "1T0" | 
                        dat$Sample == "1T1" | 
                         dat$Sample == "1T2"| 
                         dat$Sample == "1T3", 1, NA)
  
  dat$chamber <- ifelse(dat$Sample == "2T0" | 
                          dat$Sample == "2T1" | 
                          dat$Sample == "2T2"| 
                          dat$Sample == "2T3", 2, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "3T0" | 
                          dat$Sample == "3T1" | 
                          dat$Sample == "3T2"| 
                          dat$Sample == "3T3", 3, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "4T0" | 
                          dat$Sample == "4T1" | 
                          dat$Sample == "4T2"| 
                          dat$Sample == "4T3", 4, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "5T0" | 
                          dat$Sample == "5T1" | 
                          dat$Sample == "5T2"| 
                          dat$Sample == "5T3", 5, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "6T0" | 
                          dat$Sample == "6T1" | 
                          dat$Sample == "6T2"| 
                          dat$Sample == "6T3", 6, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "7T0" | 
                          dat$Sample == "7T1" | 
                          dat$Sample == "7T2"| 
                          dat$Sample == "7T3", 7, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "8T0" | 
                          dat$Sample == "8T1" | 
                          dat$Sample == "8T2"| 
                          dat$Sample == "8T3", 8, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "9T0" | 
                          dat$Sample == "9T1" | 
                          dat$Sample == "9T2"| 
                          dat$Sample == "9T3", 9, dat$chamber)
  
  dat$chamber <- ifelse(dat$Sample == "10T0" | 
                          dat$Sample == "10T1" | 
                          dat$Sample == "10T2"| 
                          dat$Sample == "10T3", 10, dat$chamber)
  
  
  # add the block names to the df
  dat$block <- ifelse(dat$chamber == "1" |
                        dat$chamber == "2",yes =  1, no =  NA)
  
  dat$block <- ifelse(dat$chamber == "3" |
                        dat$chamber == "4",yes =  2, no =  dat$block)
  
  dat$block <- ifelse(dat$chamber == "5" |
                        dat$chamber == "6",yes =  3, no =  dat$block)
  
  dat$block <- ifelse(dat$chamber == "7" |
                        dat$chamber == "8",yes =  4, no =  dat$block)
  
  dat$block <- ifelse(dat$chamber == "9" |
                        dat$chamber == "10",yes =  5, no =  dat$block)
  
  
  # add treatment to the df
  
  dat$Treatment <- ifelse(dat$chamber == "1" | 
                          dat$chamber == "3" | 
                          dat$chamber == "5"| 
                          dat$chamber == "8"| 
                          dat$chamber == "10", "Conventional", "Conservation")
  
  # add the sampling times to the df
  dat$t <- 0
  
          dat$t <- ifelse(dat$Sample == "1T0" | 
                          dat$Sample == "2T0" | 
                          dat$Sample == "3T0"| 
                          dat$Sample == "4T0"| 
                          dat$Sample == "5T0"| 
                          dat$Sample == "6T0"| 
                          dat$Sample == "7T0"| 
                          dat$Sample == "8T0"| 
                          dat$Sample == "9T0"| 
                          dat$Sample == "10T0", 0, NA)
  
  dat$t <- ifelse(dat$Sample == "1T1" | 
                    dat$Sample == "2T1" | 
                    dat$Sample == "3T1"| 
                    dat$Sample == "4T1"| 
                    dat$Sample == "5T1"| 
                    dat$Sample == "6T1"| 
                    dat$Sample == "7T1"| 
                    dat$Sample == "8T1"|
                    dat$Sample == "9T1"| 
                    dat$Sample == "10T1", 1, dat$t)
  
  dat$t <- ifelse(dat$Sample == "1T2" | 
                    dat$Sample == "2T2" | 
                    dat$Sample == "3T2"| 
                    dat$Sample == "4T2"| 
                    dat$Sample == "5T2"| 
                    dat$Sample == "6T2"| 
                    dat$Sample == "7T2"| 
                    dat$Sample == "8T2"|
                    dat$Sample == "9T2"| 
                    dat$Sample == "10T2", 2, dat$t)
  
  dat$t <- ifelse(dat$Sample == "1T3" | 
                    dat$Sample == "2T3" | 
                    dat$Sample == "3T3"| 
                    dat$Sample == "4T3"| 
                    dat$Sample == "5T3"| 
                    dat$Sample == "6T3"| 
                    dat$Sample == "7T3"| 
                    dat$Sample == "8T3"| 
                    dat$Sample == "9T3"| 
                    dat$Sample == "10T3",yes =  3,no =  dat$t)
  
  
  
  ### filter ambient samples ####
  
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "A1"| Sample == "A2"| Sample == "A3")
  
  
  ### fertiliser ####
  
  # add N kg ha-1
  dat$N.kg.ha <- 0
  dat$N.kg.ha <- ifelse(dat$Treatment == "Conservation", 
                        yes = ca.N.now, 
                        no = con.N.now)
  
  
  
### correct for ambient background ####
  
  # add the mean of the co2 coloumn in ambi df to the dat df under col name bg.co2
  dat$bg.co2 <- mean(ambi$`Carbon Dioxide|Amount`)
  dat$bg.n2o <- mean(ambi$`Nitrous Oxide|Amount`)
  dat$bg.ch4 <- mean(ambi$`Methane|Amount`)
  
  # correct for background ppm 
  dat$co2.area <- dat$`Carbon Dioxide|Amount` - dat$bg.co2
  dat$n2o.area <- dat$`Nitrous Oxide|Amount` - dat$bg.n2o
  dat$ch4.area <- dat$`Methane|Amount` - dat$bg.ch4
  
  
  ### calculations ####
  
  # add time in hours
  dat$time.hr <- 01
  
  # volume of headspace in cm3
  head.vol.cm3 <- 37699.11
  
  # convert head vol in cm3 to liters
  head.vol.l <- head.vol.cm3/1000
  
  # this adds the volume of the headspace of the chamber to the df
  dat$head.vol.l <- head.vol.l
  
  # set the experimental time 
  experiment.time.hr <- 01.00
  
  # set chamber area in cm2
  chamber.area.cm2 <- 1256.64
  
  # set multiplication factor to convert to m2
  area.factor <- 10000 / chamber.area.cm2
  
  # set chamber area in m2
  dat$chamber.area.m2 <- chamber.area.cm2 / 10000
  
  # calculate ppm/h and add to ppm.h in df
  dat$co2.ppm.h <- (dat$co2.area / experiment.time.hr * 01.00)
  dat$n2o.ppm.h <- (dat$n2o.area / experiment.time.hr * 01.00)
  dat$ch4.ppm.h <- (dat$ch4.area / experiment.time.hr * 01.00)
  
  ### CONVERT PPM TO MG/M3 ####
  # Formula: concentration (mg/m3) = 0.0409 x concentration (ppm) x molecular weight
  co2.mol.weight <- 44.01
  n2o.mol.weight <- 44.013
  ch4.mol.weight <- 16.04
  
  # the gas constant is always this 
  gas.constant <- 0.0821
  
  # temperature in Kelvin
  K.temp <- day.temp + 273.15
  
  # calculate the mg of GHG per hour 
  dat$co2.mg.m3.h <- ((dat$co2.area * head.vol.l * co2.mol.weight) / (K.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  dat$n2o.mg.m3.h <- ((dat$n2o.area * head.vol.l * n2o.mol.weight) / (K.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  dat$ch4.mg.m3.h <- ((dat$ch4.area * head.vol.l * ch4.mol.weight) / (K.temp * gas.constant)) / dat$chamber.area.m2 / 1000
  
  # calculate one colomn for CO2 in g
  dat$co2.g.m3.h <- dat$co2.mg.m3.h / 1000
  
  ### Global warming potential ####
  # GWP values = 
  # N2O = 273
  # CH4 = 27.2
  
  dat$gwp.n2o <- if_else(condition = dat$n2o.mg.m3.h > 0, 
                         true = dat$n2o.mg.m3.h * 273, 
                         false = dat$n2o.mg.m3.h * 273)
  
  dat$gwp.ch4 <- if_else(condition = dat$ch4.mg.m3.h > 0, 
                         true = dat$ch4.mg.m3.h * 27.2,
                         false = dat$ch4.mg.m3.h * 27.2)
  
  dat$gwp.total <- dat$co2.mg.m3.h + dat$gwp.n2o + dat$gwp.ch4
  
  
  ### Yield scaled GWP ####
  
  # n2o
  
  dat$ys.gwp.n2o <- if_else(condition = dat$Treatment == "Conventional" & dat$gwp.n2o >= 0, 
                         true = (dat$gwp.n2o * 10000) / 10.96, 
                         false = NA)
  
  dat$ys.gwp.n2o <- if_else(condition = dat$Treatment == "Conventional" & dat$gwp.n2o <= 0, 
                            true = (dat$gwp.n2o * 10000) * 10.96, 
                            false = dat$ys.gwp.n2o)
  
  dat$ys.gwp.n2o <- if_else(condition = dat$Treatment == "Conservation" & dat$gwp.n2o >= 0, 
                            true = (dat$gwp.n2o * 10000) / 9.4, 
                            false = dat$ys.gwp.n2o)
  
  dat$ys.gwp.n2o <- if_else(condition = dat$Treatment == "Conservation" & dat$gwp.n2o <= 0, 
                            true = (dat$gwp.n2o * 10000) * 9.4, 
                            false = dat$ys.gwp.n2o)
  
  
  # ch4
  
  dat$ys.gwp.ch4 <- if_else(condition = dat$Treatment == "Conventional" & dat$gwp.ch4 >= 0, 
                            true = (dat$gwp.ch4 * 10000) / 10.96, 
                            false = NA)
  
  dat$ys.gwp.ch4 <- if_else(condition = dat$Treatment == "Conventional" & dat$gwp.ch4 <= 0, 
                            true = (dat$gwp.ch4 * 10000) * 10.96, 
                            false = dat$ys.gwp.ch4)
  
  dat$ys.gwp.ch4 <- if_else(condition = dat$Treatment == "Conservation" & dat$gwp.ch4 >= 0, 
                            true = (dat$gwp.ch4 * 10000) / 9.4, 
                            false = dat$ys.gwp.ch4)
  
  dat$ys.gwp.ch4 <- if_else(condition = dat$Treatment == "Conservation" & dat$gwp.ch4 <= 0, 
                            true = (dat$gwp.ch4 * 10000) * 9.4, 
                            false = dat$ys.gwp.ch4)
  
  # co2
  
  dat$ys.gwp.co2 <- if_else(condition = dat$Treatment == "Conventional", 
                            true = (dat$co2.mg.m3.h * 10000) / 10.96, 
                            false = NA)
  
  dat$ys.gwp.co2 <- if_else(condition = dat$Treatment == "Conservation", 
                            true = (dat$co2.mg.m3.h * 10000) / 9.4, 
                            false = dat$ys.gwp.co2)
  
  
  
  dat$ys.gwp.total <- dat$ys.gwp.co2 + dat$ys.gwp.n2o + dat$ys.gwp.ch4

  
  ### temp and precip ####
  
  dat$day.temp <- day.temp
  dat$precip <- precip
  dat$soil.temp <- soil.temp
  dat$soil.moist <- soil.moist
  
  ### add factors ####
  
  dat$chamber <- as.factor(dat$chamber)
  dat$t <- as.factor(dat$t)
  
  # # #Remove rows with sample name not equal to the ambient samples or standards
  # dat <-  filter(dat, Sample != "500ppbN2O/3ppmCH4" &
  #                   Sample != "250ppbN2O/2ppmCH4" &
  #                   Sample != "1000ppmCO2" &
  #                   Sample != "A1" &
  #                   Sample != "A2" &
  #                   Sample != "A3")
  
  return(dat)
}




