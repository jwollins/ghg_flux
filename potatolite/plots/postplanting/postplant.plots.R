## plots - Post planting ####
## Who: JW Collins 
## what: PotatoLite Post planting data plots
## Last edited: 2023-07-10


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## PACKAGES ####

source("scripts/packages/packages.R")

## SOURCE DATA ####

gc.dat <- read.csv(file = "data/processed.data/postplant/2023_05_02_postplant_data.csv")

treat.dat <- read.csv(file = "data/processed.data/postplant/both.site.postplant.summary.data.csv")

last.time.dat <- read.csv(file = "data/processed.data/postplant/28min_data_2023_05_02_postplant.csv")

site.dat <- read.csv(file = "data/processed.data/postplant/2023_05_02_treatment_site_summary_data.csv")


# add factors

gc.dat$plot <- as.factor(gc.dat$plot)
gc.dat$timing <- as.factor(gc.dat$timing)
gc.dat$Treatment <- as.factor(gc.dat$Treatment)

treat.dat$Treatment <- as.factor(treat.dat$Treatment)

site.dat$Site <- as.factor(site.dat$Site)
site.dat$Treatment <- as.factor(site.dat$Treatment)

last.time.dat$Treatment <- as.factor(last.time.dat$Treatment)
last.time.dat$site <- as.factor(last.time.dat$site)


## PLOT CALIBRATION ####

### carbon dioxide ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/cranfield.chambers/", "CO2.cal.by.plot", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, 
                   y = Carbon.Dioxide.Amount)) +
  geom_line(aes(color = plot, 
                group = interaction(plot, block, site))) +
  geom_point(aes(color = plot, 
                 group = interaction(plot,  block, site))) + 
  ylab(label = "CO2 (ppm)") +
  xlab(label = "Time (Minutes)") +
  #  ylim(575,675)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Carbon Dioxide", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()

### nitrous oxide ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/cranfield.chambers/", "N2O.cal.by.plot", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, 
                   y = Nitrous.Oxide.Amount)) +
  geom_line(aes(color = plot, 
                group = interaction(plot, block, site))) +
  geom_point(aes(color = plot, 
                 group = interaction(plot,  block, site))) + 
  ylab(label = "N2O (ppb)") +
  xlab(label = "Time (Minutes)") +
  #  ylim(0.285,0.33)+ 
  ggtitle(label = "Calibration test 06/03/2023 - Nitrous Oxide", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()

### methane ####

# open png for file save and define size and resolution
png(paste("plots/calibration.test/cranfield.chambers/", "CH4.cal.by.plot", ".png", sep=""), 
    width=1200, height=900, res=150)

ggplot(gc.dat, aes(x = timing, 
                   y = Methane.Amount,
                   group = plot)) +
  geom_line(aes(color = plot, 
                group = interaction(plot, block, site))) +
  geom_point(aes(color = plot, 
                 group = interaction(plot,  block, site))) + 
  ylab(label = "CH4 ppb") +
  xlab(label = "Time (Minutes)") +
  #  ylim(1.9,2.15) + 
  ggtitle(label = "Calibration test 06/03/2023 - Methane", 
          subtitle = "PotatoLite Project Bubbs and Griffiths")

# turn save off 
dev.off()



# ## BY TREATMENT CALIBRATION ####
# 
# ### carbon dioxide ####
# 
# # open png for file save and define size and resolution
# png(paste("plots/calibration.test/cranfield.chambers/", "CO2.cal.by.treatment", ".png", sep=""), 
#     width=1200, height=900, res=150)
# 
# title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation
# 
# ggplot(gc.dat, aes(x = timing, 
#                    y = co2.g.m3.h)) +
#   geom_line(aes(color = Treatment, 
#                 group = Treatment)) +
#   geom_point(aes(color = Treatment, 
#                  group = Treatment)) + 
#   ylab(label = title_exp_long) +
#   xlab(label = "Time (Minutes)") +
#   #  ylim(575,675)+ 
#   ggtitle(label = "Calibration test 06/03/2023 - Carbon Dioxide", 
#           subtitle = "PotatoLite Project Bubbs and Griffiths")
# 
# # turn save off 
# dev.off()
# 
# ### nitrous oxide ####
# 
# title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation
# 
# # open png for file save and define size and resolution
# png(paste("plots/calibration.test/cranfield.chambers/", "N2O.cal.by.treatment", ".png", sep=""), 
#     width=1200, height=900, res=150)
# 
# ggplot(gc.dat, aes(x = timing, 
#                    y = n2o.mg.m3.h)) +
#   geom_line(aes(color = Treatment, 
#                 group = interaction(Treatment, site))) +
#   geom_point(aes(color = Treatment, 
#                  group = interaction(Treatment,  site))) + 
#   ylab(label = title_exp_long) +
#   xlab(label = "Time (Minutes)") +
#   #  ylim(0.285,0.33)+ 
#   ggtitle(label = "Calibration test 06/03/2023 - Nitrous Oxide", 
#           subtitle = "PotatoLite Project Bubbs and Griffiths")
# 
# # turn save off 
# dev.off()
# 
# ### methane ####
# 
# title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation
# 
# # open png for file save and define size and resolution
# png(paste("plots/calibration.test/cranfield.chambers/", "CH4.cal.by.treatment", ".png", sep=""), 
#     width=1200, height=900, res=150)
# 
# ggplot(gc.dat, aes(x = timing, 
#                    y = ch4.mg.m3.h,
#                    group = plot)) +
#   geom_line(aes(color = plot, 
#                 group = interaction(plot, block, site))) +
#   geom_point(aes(color = plot, 
#                  group = interaction(plot,  block, site))) + 
#   ylab(label = title_exp_long) +
#   xlab(label = "Time (Minutes)") +
#   #  ylim(1.9,2.15) + 
#   ggtitle(label = "Calibration test 06/03/2023 - Methane", 
#           subtitle = "PotatoLite Project Bubbs and Griffiths")
# 
# # turn save off 
# dev.off()




## BARPLOTS + SITE ####

### CO2 ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "CO2.barplot.by.site", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = site.dat, 
          aes(x = Treatment,
              y = mean.co2.g.m3.h,
              fill = Site)) +
  geom_bar(stat="identity", 
           position=position_dodge()) + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Carbon Dioxide", 
          subtitle = "PotatoLite Project - Harper Adams University") + 
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


### N2O ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "N2O.barplot.by.site", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = site.dat, 
       aes(x = Treatment,
           y = mean.n2o.mg.m3.h,
           fill = Site)) +
  geom_bar(stat="identity", 
           position=position_dodge()) + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Nitrous Oxide", 
          subtitle = "PotatoLite Project - Harper Adams University") + 
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


### CH4 ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "CH4.barplot.by.site", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = site.dat, 
       aes(x = Treatment,
           y = mean.ch4.mg.m3.h,
           fill = Site)) +
  geom_bar(stat="identity", 
           position=position_dodge()) + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Methane", 
          subtitle = "PotatoLite Project - Harper Adams University") + 
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



## BARPLOTS ####

### CO2 ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "CO2.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = treat.dat, 
       aes(x = Treatment,
           y = mean.co2.g.m3.h, 
           fill = Treatment)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Carbon Dioxide", 
          subtitle = "PotatoLite Project - Both Sites Combined") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 12, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.co2.g.m3.h - se.co2.g.m3.h, 
                    ymax = mean.co2.g.m3.h + se.co2.g.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()


### N2O ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "N2O.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = treat.dat, 
       aes(x = Treatment,
           y = mean.n2o.mg.m3.h,
           fill = Treatment)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Nitrous Oxide", 
          subtitle = "PotatoLite Project - Both Sites") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 12, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.n2o.mg.m3.h - se.n2o.mg.m3.h, 
                    ymax = mean.n2o.mg.m3.h + se.n2o.mg.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()


### CH4 ####

# open png for file save and define size and resolution
png(paste("plots/postplanting/barplots/", "CH4.barplot", ".png", sep=""), 
    width=1200, height=900, res=150)

title_exp_long <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation

# Basic barplot
ggplot(data = treat.dat, 
       aes(x = Treatment,
           y = mean.ch4.mg.m3.h,
           fill = Treatment)) +
  geom_bar(stat="identity") + 
  ylab(label = title_exp_long) +
  ggtitle(label = "Post Planting 01/05/2023 - Methane", 
          subtitle = "PotatoLite Project - Both Sites") + 
  theme(legend.position="bottom", 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), #change legend key width
        legend.title = element_text(size = 10), #change legend title font size
        legend.text = element_text(size = 10)) +
  labs(caption = "n = 12, Error bars = SE") +
  geom_errorbar(aes(ymin = mean.ch4.mg.m3.h - se.ch4.mg.m3.h, 
                    ymax = mean.ch4.mg.m3.h + se.ch4.mg.m3.h),
                linetype = "solid",
                width = 0.25,
                stat="identity", 
                position=position_dodge(width=0.9))

# turn save off 
dev.off()















