## TITLE: meanFUN
## DESCRIPTION: Mean function for GHG field data
## WHO: J Collins 
## DATE: 2023-04-11

## GROUP MEAN FUNCTION ####

# group mean function to summarise the Treatment effects and return the sample mean
meanFUN <- function(dat) {
  
  # aggregate CO2.mg.m3.h data
  mean.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                        by = list(Block = dat$site), FUN = function(x) mean(x, na.rm=T))
  
  sd.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) sd(x, na.rm=T))
  
  se.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) std.error(x, na.rm=T))
  
  med.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                       by = list(Block = dat$site), FUN = function(x) median(x, na.rm=T))
  
  
  # aggregate CO2.g.m3.h data
  mean.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                                by = list(Block = dat$site), FUN = function(x) mean(x, na.rm=T))
  
  sd.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                              by = list(Block = dat$site), FUN = function(x) sd(x, na.rm=T))
  
  se.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                              by = list(Block = dat$site), FUN = function(x) std.error(x, na.rm=T))
  
  med.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                               by = list(Block = dat$site), FUN = function(x) median(x, na.rm=T))
  
  
  
  # aggregate N2O.mg.m3.h data
  mean.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                        by = list(Block = dat$site), FUN = function(x) mean(x, na.rm=T))
  
  sd.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) sd(x, na.rm=T))
  
  se.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) std.error(x, na.rm=T))
  
  med.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                       by = list(Block = dat$site), FUN = function(x) median(x, na.rm=T))
  
  # aggregate CH4.mg.m3.h data
  mean.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                        by = list(Block = dat$site), FUN = function(x) mean(x, na.rm=T))
  
  sd.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) sd(x, na.rm=T))
  
  se.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                      by = list(Block = dat$site), FUN = function(x) std.error(x, na.rm=T))
  
  med.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                       by = list(Block = dat$site), FUN = function(x) median(x, na.rm=T))
  
  mean.dat.mg.m3.h <- data.frame(Site = mean.co2.mg.m3.h[ ,1], #extract Treatment names from any df
                    Sample.Date = day.date, # extract batch date from current day df
                    mean.co2.mg.m3.h = mean.co2.mg.m3.h[ ,2], # extract mean values from sub df's and compile to main df
                    sd.co2.mg.m3.h = sd.co2.mg.m3.h[ , 2], # CO2 MG
                    se.co2.mg.m3.h = se.co2.mg.m3.h[ , 2],
                    med.co2.mg.m3.h = med.co2.mg.m3.h[ , 2],
                    mean.co2.g.m3.h = mean.co2.g.m3.h[ ,2], # CO2 G
                    sd.co2.g.m3.h = sd.co2.g.m3.h[ , 2],
                    se.co2.g.m3.h = se.co2.g.m3.h[ , 2],
                    med.co2.g.m3.h = med.co2.g.m3.h[ , 2],
                    mean.n2o.mg.m3.h = mean.n2o.mg.m3.h[ ,2], # N2O MG
                    sd.n2o.mg.m3.h = sd.n2o.mg.m3.h[ , 2],
                    se.n2o.mg.m3.h = se.n2o.mg.m3.h[ , 2],
                    med.n2o.mg.m3.h = med.n2o.mg.m3.h[ , 2],
                    mean.ch4.mg.m3.h = mean.ch4.mg.m3.h[ ,2], # CH4 MG
                    sd.ch4.mg.m3.h = sd.ch4.mg.m3.h[ , 2],
                    se.ch4.mg.m3.h = se.ch4.mg.m3.h[ , 2],
                    med.ch4.mg.m3.h = med.ch4.mg.m3.h[ , 2])
  
  
  return(mean.dat.mg.m3.h)
}

