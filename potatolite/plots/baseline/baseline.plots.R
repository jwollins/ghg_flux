## read Gas chromatograph data analysis ####
## Who: JW Collins 
## what: PotatoLite baseline data
## Last edited: 2023-06-21


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## PACKAGES ####

source("scripts/packages/packages.R")

## SOURCE BASELINE DATA  ####

gc.dat <- read.csv(file = "data/processed.data/2023_03_22_baseline_data.csv")

mean.dat <- read.csv(file = "data/processed.data/2023_03_22_summary_baseline.data.csv")

# add factors 

gc.dat$timing <- as.factor(gc.dat$timing, levels = c("20", "40", "60"))
gc.dat$block <- as.factor(gc.dat$block)

mean.dat$Site <- as.factor(mean.dat$Site)


## PLOT CALIBRATION ####

### carbon dioxide ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/baseline/", "CO2 calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, y = Carbon.Dioxide.Amount)) +
  geom_line(aes(color = block, group = interaction(block, site))) +
  geom_point(aes(color = block, group = interaction(block, site))) + 
  ylab(label = "CO2 ppm") +
  xlab(label = "Time (Minutes)") +
  #  ylim(575,675)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Carbon Dioxide", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()

### nitrous oxide ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/baseline/", "N2O calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, y = Nitrous.Oxide.Amount)) +
  geom_line(aes(color = block, group = interaction(block, site))) +
  geom_point(aes(color = block, group = interaction(block, site))) + 
  ylab(label = "N2O ppb") +
  xlab(label = "Time (Minutes)") +
  #  ylim(575,675)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Nitrous Oxide", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()

### methane ####


# open png for file save and define size and resolution
png(paste("plots/calibration.test/baseline/", "CH4 calibration", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, 
                   y = Methane.Amount,
                   group = block)) +
  geom_line(aes(color = block, group = interaction(block, site))) +
  geom_point(aes(color = block, group = interaction(block, site))) + 
  ylab(label = "CH4 (ppb)") +
  xlab(label = "Time (Minutes)") +
  #  ylim(575,675)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Methane", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()


## BARPLOTS ####

### co2 ####

# open png for file save and define size and resolution
png(paste("plots/baseline/", "CO2.baseline.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = mean.dat, 
       aes(x = Site, 
           y = mean.co2.g.m3.h,
           fill = Site)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Baseline 06/03/2023 - Carbon Dioxide", 
          subtitle = "PotatoLite Project") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 6, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.co2.g.m3.h - se.co2.g.m3.h, 
                    ymax = mean.co2.g.m3.h + se.co2.g.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()


### n2o ####

# open png for file save and define size and resolution
png(paste("plots/baseline/", "N2O.baseline.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = mean.dat, 
       aes(x = Site, 
           y = mean.n2o.mg.m3.h,
           fill = Site)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Baseline 06/03/2023 - Nitrous Oxide", 
          subtitle = "PotatoLite Project") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 6, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.n2o.mg.m3.h - se.n2o.mg.m3.h, 
                    ymax = mean.n2o.mg.m3.h + se.n2o.mg.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()



### ch4 ####

# open png for file save and define size and resolution
png(paste("plots/baseline/", "CH4.baseline.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = mean.dat, 
       aes(x = Site, 
           y = mean.ch4.mg.m3.h,
           fill = Site)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Baseline 06/03/2023 - Methane", 
          subtitle = "PotatoLite Project") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 6, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.ch4.mg.m3.h - se.ch4.mg.m3.h, 
                    ymax = mean.ch4.mg.m3.h + se.ch4.mg.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()


