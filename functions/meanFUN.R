## TITLE: meanFUN
## DESCRIPTION: Mean function for GHG field data
## WHO: J Collins 
## DATE: 2023-04-11

## GROUP MEAN FUNCTION ####

# group mean function to summarise the Treatment effects and return the sample mean
meanFUN <- function(dat) {
  
  ### fertilizer ####
  
  # aggregate fert data
  mean.N.kg.ha <- aggregate(x = dat$N.kg.ha,
                        by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  ### CO2 MG ####
  
  # aggregate CO2.mg.m3.h data
  mean.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                        by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  sd.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  se.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  med.co2.mg.m3.h <- aggregate(x = dat$co2.mg.m3.h, 
                       by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  
  ### CO2 GRAMS ####
  
  # aggregate CO2.g.m3.h data
  mean.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                                by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  sd.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                              by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  se.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                              by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  med.co2.g.m3.h <- aggregate(x = dat$co2.g.m3.h, 
                               by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  
  ### N2O ####
  
  # aggregate N2O.mg.m3.h data
  mean.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                        by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  sd.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  se.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  med.n2o.mg.m3.h <- aggregate(x = dat$n2o.mg.m3.h, 
                       by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  
  ### CH4 ####
  
  # aggregate CH4.mg.m3.h data
  mean.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                        by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  sd.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  se.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                      by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  med.ch4.mg.m3.h <- aggregate(x = dat$ch4.mg.m3.h, 
                       by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  
  ### GWP ###
  
  # aggregate total GWP data
  gwp.mean.mg.m3.h <- aggregate(x = dat$gwp.total, 
                                    by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  gwp.sd.mg.m3.h <- aggregate(x = dat$gwp.total, 
                                  by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  gwp.se.mg.m3.h <- aggregate(x = dat$gwp.total, 
                                  by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  gwp.med.mg.m3.h <- aggregate(x = dat$gwp.total, 
                                   by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  # aggregate CH4 GWP data
  gwp.mean.ch4.mg.m3.h <- aggregate(x = dat$gwp.ch4,
                                by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))

  gwp.sd.ch4.mg.m3.h <- aggregate(x = dat$gwp.ch4,
                              by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))

  gwp.se.ch4.mg.m3.h <- aggregate(x = dat$gwp.ch4,
                              by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))

  gwp.med.ch4.mg.m3.h <- aggregate(x = dat$gwp.ch4,
                               by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))


  # aggregate N2O GWP data
  gwp.mean.n2o.mg.m3.h <- aggregate(x = dat$gwp.n2o,
                                    by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))

  gwp.sd.n2o.mg.m3.h <- aggregate(x = dat$gwp.n2o,
                                  by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))

  gwp.se.n2o.mg.m3.h <- aggregate(x = dat$gwp.n2o,
                                  by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))

  gwp.med.n2o.mg.m3.h <- aggregate(x = dat$gwp.n2o,
                                   by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))
  
  
  ### YS GWP ####
  
  # aggregate total GWP data
  ys.gwp.mean.mg.m3.h <- aggregate(x = dat$ys.gwp.total, 
                                by = list(Treatment = dat$Treatment), FUN = function(x) mean(x, na.rm=T))
  
  ys.gwp.sd.mg.m3.h <- aggregate(x = dat$ys.gwp.total, 
                              by = list(Treatment = dat$Treatment), FUN = function(x) sd(x, na.rm=T))
  
  ys.gwp.se.mg.m3.h <- aggregate(x = dat$ys.gwp.total, 
                              by = list(Treatment = dat$Treatment), FUN = function(x) std.error(x, na.rm=T))
  
  ys.gwp.med.mg.m3.h <- aggregate(x = dat$ys.gwp.total, 
                               by = list(Treatment = dat$Treatment), FUN = function(x) median(x, na.rm=T))

  
  ### ADD TO DF ####
  
  mean.dat.mg.m3.h <- data.frame(Treatment = mean.co2.mg.m3.h[ ,1], #extract Treatment names from any df
                    batch.date = dat$batch.date[1], # extract batch date from current day df
                    N.kg.ha = mean.N.kg.ha[,2],
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
                    med.ch4.mg.m3.h = med.ch4.mg.m3.h[ , 2],
                    gwp.mean.mg.m3.h = gwp.mean.mg.m3.h[ ,2], # GWP TOTAL
                    gwp.sd.mg.m3.h = gwp.sd.mg.m3.h[ , 2],
                    gwp.se.mg.m3.h = gwp.se.mg.m3.h[ , 2],
                    gwp.med.mg.m3.h = gwp.med.mg.m3.h[ , 2],
                    gwp.mean.ch4.mg.m3.h = gwp.mean.ch4.mg.m3.h[ ,2], # CH4 GWP
                    gwp.sd.ch4.mg.m3.h = gwp.sd.ch4.mg.m3.h[ , 2],
                    gwp.se.ch4.mg.m3.h = gwp.se.ch4.mg.m3.h[ , 2],
                    gwp.med.ch4.mg.m3.h = gwp.med.ch4.mg.m3.h[ , 2],
                    gwp.mean.n2o.mg.m3.h = gwp.mean.n2o.mg.m3.h[ ,2], # N2O GWP
                    gwp.sd.n2o.mg.m3.h = gwp.sd.n2o.mg.m3.h[ , 2],
                    gwp.se.n2o.mg.m3.h = gwp.se.n2o.mg.m3.h[ , 2],
                    gwp.med.n2o.mg.m3.h = gwp.med.n2o.mg.m3.h[ , 2],
                    ys.gwp.mean.mg.m3.h = ys.gwp.mean.mg.m3.h[ ,2], # YS GWP TOTAL
                    ys.gwp.sd.mg.m3.h = ys.gwp.sd.mg.m3.h[ , 2],
                    ys.gwp.se.mg.m3.h = ys.gwp.se.mg.m3.h[ , 2],
                    ys.gwp.med.mg.m3.h = ys.gwp.med.mg.m3.h[ , 2]
                    )
  
  
  
  return(mean.dat.mg.m3.h)
}











