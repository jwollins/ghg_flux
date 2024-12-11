## HEADER ####
## who: J Collins
## what: Gas chromatograph data conversions
## when: 2023-03-19

## CONTENTS ####
## 00 PACKAGES ####
## 01 LOAD DATA ####

## 00 packages ####

library(ggplot2)

## 01 LOAD DATA ####
dat <- read.csv(file = "data/CO2N2OCH4/gc.data.all.days")
mean.dat <- read.csv(file = "data/CO2N2OCH4/mean.flux.data")

## EDIT DATA ####

#remove data points below 0
mean.dat$mean.ch4 <- ifelse(mean.dat$mean.ch4 < 0 , 0, mean.dat$mean.ch4)
mean.dat$mean.co2 <- ifelse(mean.dat$mean.co2 < 0 , 0, mean.dat$mean.co2)
mean.dat$mean.n2o <- ifelse(mean.dat$mean.n2o < 0 , 0, mean.dat$mean.n2o)

# change wfps to character
mean.dat$wfps <- as.character(mean.dat$wfps)

# filter days out with poor data

filt.dat <- filter(mean.dat, day == 0 |day == 1 |day == 2 |day == 3 |day == 4 |day == 5 |
                     day == 15 |day == 19 |day == 23 |day == 30 |day == 57)

## PLOTS ####

### CO2 ALL DAYS PLOT ####

#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/", "co2.all.days.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = mean.dat, aes(day, mean.co2, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Carbon dioxide emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") + 
  xlim(0,60) 
#  geom_errorbar(aes(ymin=mean.co2 - sd.co2, ymax = mean.co2 + sd.co2), width=.2,
#                position=position_dodge(0.05))

dev.off() # turn dev off


### N2O ALL DAYS PLOT ####

#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/", "n2o.all.days.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = mean.dat, aes(day, mean.n2o, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Nitrous Oxide emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") 

dev.off() # turn dev off


### CH4 ALL DAYS PLOT ####

#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/", "ch4.all.days.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = mean.dat, aes(day, mean.ch4, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Methane emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") 

dev.off() # turn dev off



## Filtered Days Plots ####

### CO2 ####
#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/filtered.days/", "co2.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = filt.dat, aes(day, mean.co2, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Carbon dioxide emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") + 
  xlim(0,60)

dev.off() # turn dev off

### N2O ####
#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/filtered.days/", "n2o.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = filt.dat, aes(day, mean.n2o, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Nitrous Oxide emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") + 
  xlim(0,60)

dev.off() # turn dev off

### CH4 ####
#open png for file save and define size and resolution
png(paste("plots/ppm.h.plots/filtered.days/", "ch4.plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = filt.dat, aes(day, mean.ch4, color = treatment, group = treatment)) +
  geom_line(size = 1, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Nitrous Oxide emissions from cover crops experiment", subtitle = "11/05/2022 - 07/07/2022") + 
  ylab(label = "Mean flux (ppm/hr)") +
  xlab(label = "Day") + 
  xlim(0,60)

dev.off() # turn dev off


#open png for file save and define size and resolution
png(paste("plots/boxplots/", "co2.boxplot", ".png", sep=""),
    width=1200, height=900, res=150)

p <- ggplot(mean.dat, aes(x = treatment, y = mean.co2)) + 
  geom_dotplot(binaxis='y', stackdir='center')
p

dev.off() # turn dev off


