## HEADER ####
## who: J Collins
## what: Function to run all changes to Gas chromatograph csv files 
## WHAT: POTATOLITE BASELINE SAMPLES
## TEST DATE: 2023-05-25


# make function to run the data frame changes on all csv files
griffFUN <- function(dat) {
  # rename cols
  names(dat) <- c(col.nam)
  
  # add batch name to data frame
  dat$batch <- batch.name
  
### block ####
  
  # add the block names to the df
  dat$block <- ifelse(dat$Sample == "7B" | 
                        dat$Sample == "29CC" | 
                        dat$Sample == "31TA", 1, NA)
  
  dat$block <- ifelse(dat$Sample == "23CC" | 
                        dat$Sample == "20TA" | 
                        dat$Sample == "33TB", 2, dat$block)
  
  dat$block <- ifelse(dat$Sample == "1A" | 
                        dat$Sample == "19TC" | 
                        dat$Sample == "2A", 3, dat$block)
  
  dat$block <- ifelse(dat$Sample == "4B" | 
                        dat$Sample == "13A" | 
                        dat$Sample == "20TC", 4, dat$block)
  
  dat$block <- ifelse(dat$Sample == "21TA" | 
                        dat$Sample == "24TB" | 
                        dat$Sample == "21CA", 5, dat$block)

  
  ### sample time ####
  
  # add the sample time to the df
  # add the block names to the df
  dat$timing <- ifelse(dat$Sample == "7B" | 
                         dat$Sample == "23CC" | 
                         dat$Sample == "1A"| 
                         dat$Sample == "4B"| 
                        dat$Sample == "21TA", 20, NA)
  
  dat$timing <- ifelse(dat$Sample == "31TA" | 
                         dat$Sample == "20TA" | 
                         dat$Sample == "19TC"| 
                         dat$Sample == "13A"| 
                         dat$Sample == "24TB", 40, dat$timing)
  
  dat$timing <- ifelse(dat$Sample == "29CC" | 
                         dat$Sample == "33TB" | 
                         dat$Sample == "2A"| 
                         dat$Sample == "20TC"| 
                         dat$Sample == "21CA", 60, dat$timing)
  
  
  
  
  ### ambient samples ####
  
  
  # filter to just ambient samples and create a df called ambi
  ambi <- filter(dat, Sample == "EMP1"|Sample == "EMP2"|Sample == "EMP3")
  
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
  
  # add factors
  
  dat$block <- as.factor(dat$block)
  dat$timing <- as.factor(dat$timing)

  # #Remove rows with sample name not equal to the ambient samples or standards
  dat <-  filter(dat, Sample != "500ppbN2O/3ppmCH4" &
                   Sample != "250ppbN2O/2ppmCH4" &
                   Sample != "1000ppmCO2" &
                   Sample != "500ppmCO2" &
                   Sample != "EMP1" &
                   Sample != "EMP2" &
                   Sample != "EMP3" &
                   Sample != "A1" &
                   Sample != "A2" &
                   Sample != "A3" &
                   Sample != "A4" &
                   Sample != "A5" &
                   Sample != "A6" )
  
  return(dat)
}

