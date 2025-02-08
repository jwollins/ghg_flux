## HEADER ####
## who: J Collins
## what: Gas chromatograph data conversions
## when: 2023-03-19

## 00 packages ####

library(ggplot2)
library(ggpubr)
library(dplyr)        # for data filter function
library(plotrix)     # for std.error function



setwd(dir = "~/OneDrive - Harper Adams University/Data/GHG field experiment/")


## 01 LOAD DATA ####
dat <- read.csv(file = "data/processed.data/gc.data.all.days.csv")

mean.dat <- read.csv(file = "data/processed.data/mean.flux.data.csv")

fert.dat <- read.csv("data/fertiliser.data/fert.applications.csv")

fert.dat2 <- read.csv("data/fertiliser.data/fert.applications2.csv")

soil.dat <- read.csv("data/sampling.point.data/ghg.sampling.points.wgs84.csv") # source data load

cosmos.dat <- read.csv(file = "data/COSMOS/cosmos.dat.csv")

temp.dat <- read.csv("data/temp.rh.data/Sensor 1_log_from_20230201_to_20230614_head_removed.csv")

weather.dat <- read.csv("data/temp.rh.data/weather.data.market.drayton.csv")


## Add date classes ####

mean.dat$batch.date <- as.Date(mean.dat$batch.date)
class(mean.dat$batch.date)

fert.dat2$Date <- as.Date(fert.dat2$Date)

cosmos.dat$Date <- as.Date(cosmos.dat$Date)
temp.dat$Time <- as.POSIXct(temp.dat$Time, format = "%d/%m/%Y %H:%M")

weather.dat$datetime <- as.Date(weather.dat$datetime)

## add levels ###

dat$Treatment <- factor(dat$Treatment, levels = c("Conventional", "Conservation"))
mean.dat$Treatment <- factor(mean.dat$Treatment, levels = c("Conventional", "Conservation"))

fert.dat2$Treatment <- factor(fert.dat2$Treatment, levels = c("Conventional", "Conservation"))

soil.dat$Treatment <- factor(soil.dat$Treatment, levels = c("Conventional", "Conservation"))

##. ####

## PLOTS ####

### CO2 ####

# this is the legend title with correct notation
title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

c <- ggplot(data = mean.dat, aes(batch.date, mean.co2.g.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, 
            show.legend = TRUE) +
#  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Carbon Dioxide emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = mean.co2.g.m3.h - se.co2.g.m3.h, 
                    ymax = mean.co2.g.m3.h + se.co2.g.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "none") + 
  theme_linedraw()


### N2O####

title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

n <- ggplot(data = mean.dat, aes(batch.date, mean.n2o.mg.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, show.legend = TRUE) +
  ggtitle(label = "Nitrous Oxide emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = mean.n2o.mg.m3.h - se.n2o.mg.m3.h, 
                    ymax = mean.n2o.mg.m3.h + se.n2o.mg.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "none") + 
  theme_linedraw()



### CH4 ####

title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

ch <- ggplot(data = mean.dat, aes(batch.date, mean.ch4.mg.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, 
            show.legend = TRUE) +
  geom_point(color = "black",
             size = 0.1) +
  ggtitle(label = "Methane emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = mean.ch4.mg.m3.h - se.ch4.mg.m3.h, 
                    ymax = mean.ch4.mg.m3.h + se.ch4.mg.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "none") + 
  theme_linedraw()



### combined plot ####


#open png for file save and define size and resolution
png(paste("plots/flux.plots/", "flux.plot", ".png", sep=""),
    width=1500, height=1500, res=150)

ggarrange(c, n, ch,
          labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          common.legend = TRUE,
          legend = "bottom") 

dev.off()


##. ####

## CUMLATIVE PLOTS ####

### CO2 ####

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(g~CO[2]-C~m^{-2})  # this is the axis title with correct notation

c <- ggplot(data = mean.dat, aes(batch.date, cumsum.co2.g.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, 
            show.legend = TRUE) +
  #  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Cumulative Carbon Dioxide emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = cumsum.co2.g.m3.h - se.co2.g.m3.h, 
                    ymax = cumsum.co2.g.m3.h + se.co2.g.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "none") + 
  theme_linedraw()


### N2O ####

title_exp_long <- expression(mg~N[2]*O-N~m^{-2})  # this is the axis title with correct notation

n <- ggplot(data = mean.dat, aes(batch.date, cumsum.n2o.mg.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, 
            show.legend = TRUE) +
  ggtitle(label = "Cumulative Nitrous Oxide emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = cumsum.n2o.mg.m3.h - se.n2o.mg.m3.h,
                    ymax = cumsum.n2o.mg.m3.h + se.n2o.mg.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "none") + 
  theme_linedraw()



### CH4 ####

title_exp_long <- expression(mg~CH[4]-C~m^{-2})  # this is the axis title with correct notation

ch <- ggplot(data = mean.dat, aes(batch.date, cumsum.ch4.mg.m3.h, 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, show.legend = TRUE) +
  geom_point(color = "black", size = 0.1) +
  ggtitle(label = "Cumulative Methane emissions") + 
  ylab(label = title_exp_long) +
  xlab(label = "Date" ) +
  geom_errorbar(aes(ymin = cumsum.ch4.mg.m3.h - se.ch4.mg.m3.h, 
                    ymax = cumsum.ch4.mg.m3.h + se.ch4.mg.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme(legend.position = "bottom") + 
  theme_linedraw() +
  theme(legend.text = element_text(size=15))

ch

### combined plot ####


#open png for file save and define size and resolution
png(paste("plots/cumlative.plots/", "cumlative.flux.plot", ".png", sep=""),
    width=1500, height=1500, res=150)

ggarrange(c, n, ch,
                 labels = c("A", "B", "C"),
                 ncol = 1, nrow = 3,
          common.legend = TRUE,
          legend = "bottom")

dev.off()



#open png for file save and define size and resolution
png(paste("plots/cumlative.plots/", "small.cumlative.flux.plot", ".png", sep=""),
    width=1300, height=900, res=150)

ggarrange(c, n, ch,
          labels = c("A", "B", "C"),
          ncol = 1, nrow = 3,
          common.legend = TRUE,
          legend = "bottom")

dev.off()

##. ####

## Fertilsier plots ####

## combined fert plot ####

# Set the following two values to values close to the limits of the data 
# (you can play around with these to adjust the positions of the graphs; 
# the axes will still be correct):
  
ylim.prim <- c(0, 10)   # in this example, precipitation
ylim.sec <- c(0, 250)    # in this example, temperature


# The following makes the necessary calculations based on these limits,
# and makes the plot itself:
  
b <- diff(ylim.prim)/diff(ylim.sec)
a <- ylim.prim[1] - b*ylim.sec[1] # there was a bug here

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(mg~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

ggplot(mean.dat, aes(batch.date, 
                     cumsum.n2o.mg.m3.h, 
                     color = Treatment, 
                     group = Treatment)) +
  geom_line(size = 0.5) +
  geom_line(data = mean.dat, aes(y = a + N.kg.ha*b), 
            linetype = "dotted") +
  scale_y_continuous(title_exp_long, 
                     sec.axis = sec_axis(~ (. - a)/b, 
                                         name = "N Kg ha-1")) +
  ggtitle("Cumlative Carbon Dioxide emissions")  +
  geom_errorbar(aes(ymin = cumsum.n2o.mg.m3.h - se.n2o.mg.m3.h, 
                    ymax = cumsum.n2o.mg.m3.h + se.n2o.mg.m3.h),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  labs(caption = "n = 5, Error bars = SE") +
  theme(plot.caption = element_text(hjust=0, size = 10)) +
  scale_size_continuous(name="Legend 3") +
  theme(legend.direction = "vertical", legend.box = "horizontal")



## fert plot 2 ####

#open png for file save and define size and resolution
png(paste("plots/nitrogen/", "n.plot", ".png", sep=""),
    width=1200, height=900, res=150)

title_exp_long <- expression(Nitrogen~N~kg~ha^{-1})  # this is the axis title with correct notation

n <- ggplot(data = fert.dat2, 
            mapping = aes(x = Date,
                          y = cumlative.N.kg.ha,
                          color = Treatment, 
                          group = Treatment, 
                          name = "Treatment")) +
  geom_line(size = 0.5) +
  ylim(0,200) +
  ggtitle(label = "Nitrogen Application - Winter Wheat") + 
  ylab(label = title_exp_long) +
  xlab(label = "Date") +
  labs(caption = "") +
  theme(plot.caption = element_text(hjust=0, size = 10)) + 
  theme_linedraw() +
  theme(legend.position = "bottom") 

n

dev.off()

##. ####





## Temperature plots ####


### headspace temp ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "HS.temp.plot", ".png", sep=""),
    width=1200, height=900, res=150)

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(Temperature~C^{o})  # this is the axis title with correct notation

t <- ggplot(data = temp.dat, 
       mapping = aes(x = Time,
                     y = Temperature.C.)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Headspace Temperature", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = "Date") +
  labs(caption = "") +
  theme(plot.caption = element_text(hjust=0, size = 10)) + 
  theme_linedraw()

t

dev.off()




#### average outdise temperature ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "mean.temp.plot", ".png", sep=""),
    width=1200, height=900, res=150)

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(Temperature~C^{o})  # this is the axis title with correct notation

ot <- ggplot(data = weather.dat, 
             mapping = aes(x = datetime,
                           y = temp)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Average Daily Temperature", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  theme(plot.caption = element_text(hjust=0, size = 7.5)) + 
  theme_linedraw()
ot

dev.off()

##. ####


## RH plots ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "hs.rh.plot", ".png", sep=""),
    width=1200, height=900, res=150)

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(Relative~Humidity~"%")  # this is the axis title with correct notation

ggplot(data = temp.dat, 
       mapping = aes(x = Time,
                     y = Humidity..RH.)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Headspace RH", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = "Date") +
  labs(caption = "") +
  theme(plot.caption = element_text(hjust=0, size = 10)) + 
  theme_linedraw()

dev.off()


#open png for file save and define size and resolution
png(paste("plots/temperature/", "rh.plot", ".png", sep=""),
    width=1200, height=900, res=150)

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(Relative~Humidity~"%")  # this is the axis title with correct notation

rh <- ggplot(data = weather.dat, 
            mapping = aes(x = datetime,
                          y = humidity)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Relative Humidity", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  theme(plot.caption = element_text(hjust=0, size = 7.5)) + 
  theme_linedraw()

rh

dev.off()


##.  ####


## Precipitation ####


#open png for file save and define size and resolution
png(paste("plots/temperature/", "rain.plot", ".png", sep=""),
    width=1200, height=900, res=150)

#title_exp <- expression(Plant~Organic~Matter~"%")  # this is the legend title with correct notation
title_exp_long <- expression(Precipitation~(mm))  # this is the axis title with correct notation

p <- ggplot(data = weather.dat, 
             mapping = aes(x = datetime,
                           y = precip)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Precipitation", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  theme(plot.caption = element_text(hjust=0, size = 7.5)) + 
  theme_linedraw()

p

dev.off()




### Combined temp/rain/RH plot ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "weather.plot", ".png", sep=""),
    width=1200, height=1000, res=150)

fig <- ggarrange(ot, p, rh,
          labels = c("A", "B", "C"),
          ncol = 1, nrow = 3)

# Annotate the figure by adding a common labels
annotate_figure(fig,
                top = text_grob("Meterological data", 
                                color = "black", 
                                face = "bold", size = 14),
                bottom = text_grob("Date",
                                   color = "black",
                                   face = "bold", size = 14))

dev.off()


##. ####

# SOIL TEMP ####
title_exp_long <- expression(Temperature~C^{o})  # this is the axis title with correct notation

st <- ggplot(data = cosmos.dat, 
            mapping = aes(x = Date,
                          y = STP.03.Soil.Temperature.at.10cm)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Soil Temperature at 10cm", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  theme(plot.caption = element_text(hjust=0, size = 7.5)) + 
  theme_linedraw()

st

##. ####

# SOIL MOISTURE ####

title_exp_long <- "Volumetric Water Content (%)"  # this is the axis title with correct notation

sm <- ggplot(data = cosmos.dat, 
             mapping = aes(x = Date,
                           y = TDT.01...Volumetric.Water.Content.at.10cm)) +
  geom_line(size = 0.5) +
  ggtitle(label = "Volumetric Soil Water Content at 10cm", 
          subtitle = "") + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  theme(plot.caption = element_text(hjust=0, size = 7.5)) + 
  theme_linedraw()

sm

### Combined ST & SM plot ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "soil.temp.moisture.plot", ".png", sep=""),
    width=1200, height=1000, res=150)

fig <- ggarrange(st, sm,
                 labels = c("A", "B"),
                 ncol = 1, nrow = 2)

# Annotate the figure by adding a common labels
annotate_figure(fig,
                top = text_grob("Soil Temperature and Volumetric Moisture", 
                                color = "black", 
                                face = "bold", size = 14),
                bottom = text_grob("Date",
                                   color = "black",
                                   face = "bold", size = 14))

dev.off()

##. ####

# CORRELATIONS ####

## temperature ####

### CO2 ####

# this is the legend title with correct notation
title_temp <- expression(Temperature~C^{o})  # this is the axis title with correct notation
title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

c <- ggscatter(dat, y = "day.temp", x = "co2.g.m3.h", 
          color = "Treatment",
          #shape = "Treatment",
          add = "reg.line", 
          conf.int = TRUE, 
          cor.coef = FALSE, 
          cor.method = "pearson",
          # ylab = paste(ResVarName, "counts"), 
          # xlab = paste(VarName, plot.units),
          # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
          # ylim = c(0,650),
          # xlim = c(8,25),
          fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = 1) + 
  theme(legend.position = "none") +
  ggtitle(label = "Carbon Dioxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### N2O ####
title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

n <- ggscatter(dat, y = "day.temp", x = "n2o.mg.m3.h", 
          color = "Treatment",
          #shape = "Treatment",
          add = "reg.line", 
          conf.int = TRUE, 
          cor.coef = FALSE, 
          cor.method = "pearson",
          # ylab = paste(ResVarName, "counts"), 
          # xlab = paste(VarName, plot.units),
          # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
          # ylim = c(0,650),
          # xlim = c(8,25),
          fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = 2) + 
  theme(legend.position = "none") + 
  ggtitle(label = "Nitrous Oxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### CH4 ####
title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

ch <- ggscatter(dat, y = "day.temp", x = "ch4.mg.m3.h", 
          color = "Treatment",
          #shape = "Treatment",
          add = "reg.line", 
          conf.int = TRUE, 
          cor.coef = FALSE, 
          cor.method = "pearson",
          # ylab = paste(ResVarName, "counts"), 
          # xlab = paste(VarName, plot.units),
          # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
          # ylim = c(0,650),
          # xlim = c(8,25),
          fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = -1.5) + 
  theme(legend.position = "bottom") +
  ggtitle(label = "Methane emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### combined plot ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "temp.corr.plot", ".png", sep=""),
    width=1800, height=1800, res=150)

fig <- ggarrange(c, n, ch,
          labels = c("A", "B", "C"),
          ncol = 1, nrow = 3)

# Annotate the figure by adding a common labels
annotate_figure(fig,
                top = text_grob("Daily temperature and GHG flux correlation", 
                                color = "black", 
                                face = "bold", size = 14),
                bottom = text_grob("Shaded area indicates 95% confidence interval",
                                   color = "black",
                                   hjust = 1, x = 1,
                                   face = "italic", size = 10),
                left = text_grob(title_temp, 
                                 color = "black",
                                 rot = 90),
                # right = "I'm done, thanks :-)!",
                # fig.lab = "Figure 1", 
                # fig.lab.face = "bold"
)

dev.off()


## RAIN ####

### CO2 ####

# this is the legend title with correct notation
title_temp <- "Precipitation (mm)"  # this is the axis title with correct notation
title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

c <- ggscatter(dat, y = "precip", x = "co2.g.m3.h", 
               color = "Treatment",
               #shape = "Treatment",
               add = "reg.line", 
               conf.int = TRUE, 
               cor.coef = FALSE, 
               cor.method = "pearson",
               # ylab = paste(ResVarName, "counts"), 
               # xlab = paste(VarName, plot.units),
               # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
               # ylim = c(0,650),
               # xlim = c(8,25),
               fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = 30) + 
  theme(legend.position = "none") +
  ggtitle(label = "Carbon Dioxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### N2O ####
title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

n <- ggscatter(dat, y = "precip", x = "n2o.mg.m3.h", 
               color = "Treatment",
               #shape = "Treatment",
               add = "reg.line", 
               conf.int = TRUE, 
               cor.coef = FALSE, 
               cor.method = "pearson",
               # ylab = paste(ResVarName, "counts"), 
               # xlab = paste(VarName, plot.units),
               # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
               # ylim = c(0,650),
               # xlim = c(8,25),
               fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = 4) + 
  theme(legend.position = "none") + 
  ggtitle(label = "Nitrous Oxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### CH4 ####
title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

ch <- ggscatter(dat, y = "precip", x = "ch4.mg.m3.h", 
                color = "Treatment",
                #shape = "Treatment",
                add = "reg.line", 
                conf.int = TRUE, 
                cor.coef = FALSE, 
                cor.method = "pearson",
                # ylab = paste(ResVarName, "counts"), 
                # xlab = paste(VarName, plot.units),
                # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
                # ylim = c(0,650),
                # xlim = c(8,25),
                fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = -1.5) + 
  theme(legend.position = "bottom") +
  ggtitle(label = "Methane emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### combined plot ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "precip.corr.plot", ".png", sep=""),
    width=1800, height=1800, res=150)

fig <- ggarrange(c, n, ch,
                 labels = c("A", "B", "C"),
                 ncol = 1, nrow = 3)

# Annotate the figure by adding a common labels
annotate_figure(fig,
                top = text_grob("Weekly Precipitation and GHG flux correlation", 
                                color = "black", 
                                face = "bold", size = 14),
                bottom = text_grob("Shaded area indicates 95% confidence interval",
                                   color = "black",
                                   hjust = 1, x = 1,
                                   face = "italic", size = 10),
                left = text_grob(title_temp, 
                                 color = "black",
                                 rot = 90),
                # right = "I'm done, thanks :-)!",
                # fig.lab = "Figure 1", 
                # fig.lab.face = "bold"
)

dev.off()


## FERTILISER ####

### CO2 ####

# this is the legend title with correct notation
title_temp <- "N kg ha-1"  # this is the axis title with correct notation
title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

c <- ggscatter(dat, y = "N.kg.ha", x = "co2.g.m3.h", 
               color = "Treatment",
               #shape = "Treatment",
               add = "reg.line", 
               conf.int = TRUE, 
               cor.coef = FALSE, 
               cor.method = "pearson",
               # ylab = paste(ResVarName, "counts"), 
               # xlab = paste(VarName, plot.units),
               # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
               # ylim = c(0,650),
               # xlim = c(8,25),
               fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = 0) + 
  theme(legend.position = "none") +
  ggtitle(label = "Carbon Dioxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

### N2O ####
title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

n <- ggscatter(dat, y = "N.kg.ha", x = "n2o.mg.m3.h", 
               color = "Treatment",
               #shape = "Treatment",
               add = "reg.line", 
               conf.int = TRUE, 
               cor.coef = FALSE, 
               cor.method = "pearson",
               # ylab = paste(ResVarName, "counts"), 
               # xlab = paste(VarName, plot.units),
               # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
               # ylim = c(0,650),
               # xlim = c(8,25),
               fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           #label.x = 3,
           label.x = 0,
           label.y.npc = 0.2) + 
  theme(legend.position = "none") + 
  ggtitle(label = "Nitrous Oxide Emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)


### CH4 ####
title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

ch <- ggscatter(dat, y = "N.kg.ha", x = "ch4.mg.m3.h", 
                color = "Treatment",
                #shape = "Treatment",
                add = "reg.line", 
                conf.int = TRUE, 
                cor.coef = FALSE, 
                cor.method = "pearson",
                # ylab = paste(ResVarName, "counts"), 
                # xlab = paste(VarName, plot.units),
                # title = paste(ResVarName, "Counts v's", VarName, "Concentration"),
                # ylim = c(0,650),
                # xlim = c(8,25),
                fullrange = F) +
  stat_cor(aes(color = Treatment),
           method = "pearson", 
           label.x = -1.5,
           label.y.npc = 0.2) + 
  theme(legend.position = "bottom") +
  ggtitle(label = "Methane emissions", 
          subtitle = element_blank()) + 
  ylab(label = element_blank()) +
  xlab(label = title_exp_long)

ch
### combined plot ####

#open png for file save and define size and resolution
png(paste("plots/temperature/", "N.corr.plot", ".png", sep=""),
    width=1800, height=1800, res=150)

fig <- ggarrange(c, n, ch,
                 labels = c("A", "B", "C"),
                 ncol = 1, nrow = 3)

# Annotate the figure by adding a common labels
annotate_figure(fig,
                top = text_grob("Nitrogen fertiliser application and GHG flux correlation", 
                                color = "black", 
                                face = "bold", size = 14),
                bottom = text_grob("Shaded area indicates 95% confidence interval",
                                   color = "black",
                                   hjust = 1, x = 1,
                                   face = "italic", size = 10),
                left = text_grob(title_temp, 
                                 color = "black",
                                 rot = 90),
                # right = "I'm done, thanks :-)!",
                # fig.lab = "Figure 1", 
                # fig.lab.face = "bold"
)

dev.off()


##. ####

## GWP ####


### TOTAL GWP FLUX PLOT ####

#open png for file save and define size and resolution
png(paste("plots/gwp/", "gwp.flux.plot", ".png", sep=""),
    width=1500, height=1500, res=150)

title_exp_long <- expression(Total~GHG~g~CO[2]~eq~m^{-2}~day^{-1})  # this is the axis title with correct notation
title <- expression(Total~GHG~CO[2]-eq~Flux)

ggplot(data = mean.dat, aes(batch.date, (gwp.mean.mg.m3.h /1000), 
                                 color = Treatment, 
                                 group = Treatment)) +
  geom_line(size = 0.5, show.legend = TRUE) +
  ggtitle(label = title) + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = (gwp.mean.mg.m3.h /1000) - (gwp.se.mg.m3.h / 1000), 
                    ymax = (gwp.mean.mg.m3.h /1000) + (gwp.se.mg.m3.h / 1000)),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme_linedraw() +
  theme(legend.position = "bottom") 

dev.off()


### TOTAL YS-GWP FLUX PLOT ####

#open png for file save and define size and resolution
png(paste("plots/gwp/", "ys.gwp.flux.plot", ".png", sep=""),
    width=1500, height=700, res=150)

title_exp_long <- expression(Yield-Scaled~kg~CO[2]~eq~ha^{-1}~day^{-1})  # this is the axis title with correct notation
title <- expression(Total~GHG~Yield-Scaled~CO[2]-eq~Flux)

ggplot(data = mean.dat, aes(batch.date, (ys.gwp.mean.mg.m3.h /1000000), 
                            color = Treatment, 
                            group = Treatment)) +
  geom_line(size = 0.5, show.legend = TRUE) +
  ggtitle(label = title) + 
  ylab(label = title_exp_long) +
  xlab(label = element_blank()) +
  geom_errorbar(aes(ymin = (ys.gwp.mean.mg.m3.h /1000000) - (ys.gwp.se.mg.m3.h / 1000000), 
                    ymax = (ys.gwp.mean.mg.m3.h /1000000) + (ys.gwp.se.mg.m3.h / 1000000)),
                linetype = "solid",
                position=position_jitter(width = 0), 
                size = 0.2, 
                width = 2,
                alpha = 1) +
  geom_point(size = 1, 
             color = "black", 
             position = position_jitter(width = 0)) +
  theme_linedraw() +
  theme(legend.position = "bottom") 

dev.off()





###########. ######




# filter to Treatment 
ca.dat <-  filter(mean.dat, Treatment == "Conservation")
con.dat <- filter(mean.dat, Treatment == "Conventional")

# CA max
ca.max.co2 <- max(ca.dat$cumsum.co2.mg.m3.h)
ca.max.n2o <- max(ca.dat$cumsum.n2o.mg.m3.h)
ca.min.ch4 <- min(ca.dat$cumsum.ch4.mg.m3.h)


# CON max
con.max.co2 <- max(con.dat$cumsum.co2.mg.m3.h)
con.max.n2o <- max(con.dat$cumsum.n2o.mg.m3.h)
con.min.ch4 <- min(con.dat$cumsum.ch4.mg.m3.h)

### GWP calculation ####
con.gwp.n2o <- con.max.n2o * 273
ca.gwp.n2o <- ca.max.n2o * 273

con.gwp.ch4 <- con.min.ch4 * 27.2
ca.gwp.ch4 <- ca.min.ch4 * 27.2

### CON ####

#### CO2 ####
con.co2.df <- as.data.frame(con.max.co2)
con.co2.df$Treatment <- "Conventional" 
con.co2.df$ghg <- c("co2")
con.co2.df$se <- std.error(con.dat$mean.co2.mg.m3.h, na.rm=T)
con.co2.df$YS.GWP <- (con.co2.df$con.max.co2 * 10000) / 10.96
con.co2.df$SE.YS.GWP <- (con.co2.df$se * 10000) / 10.96
names(con.co2.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")

#### N2O ####
con.n2o.df <- as.data.frame(con.gwp.n2o)
con.n2o.df$Treatment <- "Conventional" 
con.n2o.df$ghg <- c("n2o")
con.n2o.df$se <- std.error(con.dat$mean.n2o.mg.m3.h, na.rm=T)
con.n2o.df$YS.GWP <- (con.n2o.df$con.gwp.n2o * 10000) / 10.96
con.n2o.df$SE.YS.GWP <- (con.n2o.df$se * 10000) / 10.96
names(con.n2o.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")

#### CH4 ####
con.ch4.df <- as.data.frame(con.gwp.ch4)
con.ch4.df$Treatment <- "Conventional" 
con.ch4.df$ghg <- c("ch4")
con.ch4.df$se <- std.error(con.dat$mean.ch4.mg.m3.h, na.rm=T)
con.ch4.df$YS.GWP <- (con.ch4.df$con.gwp.ch4 * 10000) * 10.96
con.ch4.df$SE.YS.GWP <- (con.ch4.df$se * 10000) * 10.96
names(con.ch4.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")


### CA ####

#### CO2 ####
ca.co2.df <- as.data.frame(ca.max.co2)
ca.co2.df$Treatment <- "Conservation" 
ca.co2.df$ghg <- c("co2")
ca.co2.df$se <- std.error(ca.dat$mean.co2.mg.m3.h, na.rm=T)
ca.co2.df$YS.GWP <- (ca.co2.df$ca.max.co2 * 10000) / 9.4
ca.co2.df$SE.YS.GWP <- (ca.co2.df$se * 10000) / 9.4
names(ca.co2.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")

#### N2O ####
ca.n2o.df <- as.data.frame(ca.gwp.n2o)
ca.n2o.df$Treatment <- "Conservation" 
ca.n2o.df$ghg <- c("n2o")
ca.n2o.df$se <- std.error(ca.dat$mean.n2o.mg.m3.h, na.rm=T)
ca.n2o.df$YS.GWP <- (ca.n2o.df$ca.gwp.n2o  * 10000) / 9.4
ca.n2o.df$SE.YS.GWP <- (ca.n2o.df$se * 10000) / 9.4
names(ca.n2o.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")

#### CH4 ####
ca.ch4.df <- as.data.frame(ca.gwp.ch4)
ca.ch4.df$Treatment <- "Conservation" 
ca.ch4.df$ghg <- c("ch4")
ca.ch4.df$se <- std.error(ca.dat$mean.ch4.mg.m3.h, na.rm=T)
ca.ch4.df$YS.GWP <- (ca.ch4.df$ca.gwp.ch4 * 10000) * 9.4
ca.ch4.df$SE.YS.GWP <- (ca.ch4.df$se * 10000) * 9.4
names(ca.ch4.df) <- c("co2.equiv", "Treatment", "GHG", "SE", "YS.GWP", "SE.YS.GWP")


### join dfs ####

ghg.df <- rbind(con.co2.df, con.n2o.df, con.ch4.df, ca.co2.df, ca.n2o.df, ca.ch4.df)

# convert mg/ha to g/ha
ghg.df$co2.equiv <- ghg.df$co2.equiv / 1000
ghg.df$SE <- ghg.df$SE / 1000

# convert mg/ha to kg/ha
ghg.df$YS.GWP <- ghg.df$YS.GWP / 1000000
ghg.df$SE.YS.GWP <- ghg.df$SE.YS.GWP / 1000000





## add levels ###
ghg.df$Treatment <- factor(ghg.df$Treatment, levels = c("Conventional", "Conservation"))
ghg.df$GHG <- factor(ghg.df$GHG, levels = c("co2", "n2o", "ch4"))

# this is the legend title with correct notation
title_exp_long <- expression(CO[2]~eq~(g~m^{-2}~day^{-1}))  # this is the axis title with correct notation

# add correct expressions
co2 <- expression(CO[2])
ch4 <- expression(CH[4]-CO[2]~equiv)
n2o <- expression(N[2]*O-CO[2]~equiv)

### GWP bar plot ####

#open png for file save and define size and resolution
png(paste("plots/gwp/", "gwp.barplot", ".png", sep=""),
    width=1000, height=800, res=150)

a <-
ggplot(data = ghg.df,
       aes(x = Treatment, 
           y = co2.equiv,
           fill = GHG)) +
  geom_bar(stat="identity", 
           position=position_dodge()) + 
  ggtitle(label = "Global warming potential") +
  ylab(label = title_exp_long) + 
  # scale_y_continuous(limits = c(-25, 300), 
  #                    breaks = c(-25, 0, 50, 100, 150, 200, 250, 300)) +
  scale_fill_discrete(name = "Treatment", 
                      labels = c(co2, n2o, ch4)) +
  geom_errorbar(aes(ymin = co2.equiv - SE, 
                    ymax = co2.equiv + SE),
                linetype = "solid",
                position=position_dodge(width=0.9), 
                size = 0.5, 
                width = 0.5,
                alpha = 1) + 
  theme_linedraw() +
  theme(legend.position = "bottom") 

dev.off()


### Y-S GWP Plot ####

# this is the legend title with correct notation
title_exp_long <- expression(Yield~Scaled~GWP~(kg~CO[2]-eq~ha^{-1}~t^{-1}~yield))  # this is the axis title with correct notation

#open png for file save and define size and resolution
png(paste("plots/gwp/", "ys.gwp.barplot", ".png", sep=""),
    width=1000, height=800, res=150)


b <-
 ggplot(data = ghg.df,
       aes(x = Treatment, 
           y = YS.GWP,
           fill = GHG)) +
  geom_bar(stat="identity", 
           position=position_dodge()) + 
  ggtitle(label = "Yield Scaled Global Warming Potential") +
  ylab(label = title_exp_long) + 
  # scale_y_continuous(limits = c(-50, 300), 
  #                   breaks = c(-50, 0, 50, 100, 150, 200, 250, 300)) +
  scale_fill_discrete(name = "Treatment", 
                      labels = c(co2, n2o, ch4)) +
  geom_errorbar(aes(ymin = YS.GWP - SE.YS.GWP, 
                    ymax = YS.GWP + SE.YS.GWP),
                linetype = "solid",
                position=position_dodge(width=0.9), 
                size = 0.5, 
                width = 0.5,
                alpha = 1) + 
  theme_linedraw() +
  theme(legend.position = "bottom") 

dev.off()




ggarrange(a,b, 
          ncol = 2, 
          common.legend = TRUE, 
          legend = "bottom", labels = c("A","B"))


ggsave(filename = "plots/gwp/gwp_joint_plot.png", width = 11, height = 4.5)









##. ####

## SOIL TEXTURE ####

library(ggtern) # messes code up for preceding plots

textures <- ggtern(
  data= soil.dat, aes(
    x = Sand,
    y = Clay,
    z = Silt
  )) +
  geom_point(
    aes(color=Treatment),
    size=5,alpha=0.7
  )+
  labs(
    title="Harper Adams Conservation Agriculture Experiment",
    subtitle="Treatment soil textures",
    color="Treatment"
  )+
  theme_bw() +
  theme(legend.position = "bottom")                  

textures



textures_cust<-textures+
  labs(
    yarrow = "Clay (%)",
    zarrow = "Silt (%)",
    xarrow = "Sand (%)"
  )+
  theme_showarrows()+        # Add arrows to axis titles
  theme_hidetitles()+
  theme_clockwise()          # Direction of ternary rotation

textures_cust


data(USDA) # Load USDA
head(USDA)

textures_classes<-textures_cust+
  geom_polygon(
    data=USDA,aes(x=Sand,y=Clay,z=Silt,group=Label),
    fill=NA,size = 0.3,alpha=0.5,
    color = "grey30"
  )

textures_classes


USDA_text <- USDA  %>% 
  group_by(Label) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

head(USDA_text)


#open png for file save and define size and resolution
png(paste("plots/soil.texture/", "soil.tex.plot.treatment", ".png", sep=""),
    width=1200, height=900, res=150)

textures_names<-textures_classes+
  geom_text(
    data=USDA_text,
    aes(x=Sand,y=Clay,z=Silt,label=Label),
    size = 2,
    color = "grey30"
  ) + 
  theme(legend.position = c(0.8, 0.8), legend.title = element_text(colour="black", size=10, face="bold"),
        legend.text = element_text(colour="black", size=10,face="bold"), 
        legend.background = element_rect(size=0.5, linetype="solid", colour ="darkblue"))

textures_names

dev.off() # turn dev off


























