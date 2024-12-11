## Stats - Post planting ####
## Who: JW Collins 
## what: PotatoLite Post planting stats
## Last edited: 2023-07-10


## CONTENTS ####
## 00 PACKAGES ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##

## 00 PACKAGES ####

source("scripts/packages/packages.R")


## 01 LOAD DATA ####

dat <- read.csv(file = "data/processed.data/postplant/28min_data_2023_05_02_postplant.csv")

### set titles ####

title_co2 <- expression(g~CO[2]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation
title_n2o <- expression(mg~N[2]*O-N~m^{-2}~day^{-1})  # this is the axis title with correct notation
title_ch4 <- expression(mg~CH[4]-C~m^{-2}~day^{-1})  # this is the axis title with correct notation



## CO2 visualisation ####

myVarName <- "CO2.28min.both.sites"

### boxplot ####

png(paste("plots/postplanting/boxplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(data = dat,
       aes(x= Treatment,
           y = co2.g.m3.h,
           col = site))+ 
  geom_jitter(width = 0.15) + 
  geom_boxplot(alpha=0.25)+ 
  facet_wrap(~site) + theme(axis.text = element_text(size = 6))               # Axis text size
# save plot and dev off
dev.off()

### histograms ####

png(paste("plots/postplanting/histograms/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)

hist(dat$co2.g.m3.h, main = title_co2) 

# save plot and dev off
dev.off()

png(paste("plots/postplanting/histograms/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)

hist(log(dat$co2.g.m3.h +1), main = title_co2) 

# save plot and dev off
dev.off()


### qqplots ####

png(paste("plots/postplanting/qqplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(dat$co2.g.m3.h, main = title_co2)
# save plot and dev off
dev.off()

png(paste("plots/postplanting/qqplots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(log(dat$co2.g.m3.h + 1), main = title_co2)
# save plot and dev off
dev.off()


### density plots ####

png(paste("plots/postplanting/density.plots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = co2.g.m3.h, 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_co2, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()

png(paste("plots/postplanting/density.plots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = log(co2.g.m3.h + 1), 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_co2, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()


### model ####

# 1. Mixed effects model
# (1|block) identifies bird as the random effects variable
z <- lmer(co2.g.m3.h ~ Treatment + (1 + block | site), data = dat)

# 2. Parameter estimates
summary(z)
anova(z)


## N2O visualisation ####

myVarName <- "N2O.28min.both.sites"

### boxplot ####

png(paste("plots/postplanting/boxplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(data = dat,
       aes(x= Treatment,
           y = n2o.mg.m3.h,
           col = site))+ 
  geom_jitter(width = 0.15) + 
  geom_boxplot(alpha=0.25)+ 
  facet_wrap(~site) + theme(axis.text = element_text(size = 6))               # Axis text size
# save plot and dev off
dev.off()

### histograms ####

png(paste("plots/postplanting/histograms/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
hist(dat$n2o.mg.m3.h, main = title_n2o) 
# save plot and dev off
dev.off()

png(paste("plots/postplanting/histograms/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
hist(log(dat$n2o.mg.m3.h + 1), main = title_n2o) 
# save plot and dev off
dev.off()


### qqplots ####

png(paste("plots/postplanting/qqplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(dat$n2o.mg.m3.h, main = title_n2o)
# save plot and dev off
dev.off()

png(paste("plots/postplanting/qqplots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(log(dat$n2o.mg.m3.h + 1), main = title_n2o)
# save plot and dev off
dev.off()


### density plots ####

png(paste("plots/postplanting/density.plots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = n2o.mg.m3.h, 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_n2o, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()


png(paste("plots/postplanting/density.plots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = log(n2o.mg.m3.h + 1), 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_n2o, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()


### model ####

# 1. Mixed effects model
# (1|block) identifies bird as the random effects variable
z <- lmer(n2o.mg.m3.h ~ Treatment + (1 + block | site), data = dat)

# 2. Parameter estimates
summary(z)
anova(z)


## CH4 visualisation ####

myVarName <- "CH4.28min.both.sites"

### boxplot ####

png(paste("plots/postplanting/boxplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(data = dat,
       aes(x= Treatment,
           y = ch4.mg.m3.h,
           col = site))+ 
  geom_jitter(width = 0.15) + 
  geom_boxplot(alpha=0.25)+ 
  facet_wrap(~site) + theme(axis.text = element_text(size = 6))               # Axis text size
# save plot and dev off
dev.off()

### histograms ####

png(paste("plots/postplanting/histograms/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
hist(dat$ch4.mg.m3.h, main = title_ch4) 
# save plot and dev off
dev.off()

png(paste("plots/postplanting/histograms/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
hist(log(dat$ch4.mg.m3.h + 1), main = title_ch4) 
# save plot and dev off
dev.off()


### qqplots ####

png(paste("plots/postplanting/qqplots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(dat$ch4.mg.m3.h, main = title_ch4)
# save plot and dev off
dev.off()

png(paste("plots/postplanting/qqplots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
qqPlot(log(dat$ch4.mg.m3.h +1), main = title_ch4)
# save plot and dev off
dev.off()


### density plots ####

png(paste("plots/postplanting/density.plots/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = ch4.mg.m3.h, 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_ch4, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()


png(paste("plots/postplanting/density.plots/log(x+1)/", myVarName, ".png", sep=""),
    width=1200, height=900, res=150)
ggplot(dat, aes(x = log(ch4.mg.m3.h + 1), 
                fill = site)) +
  geom_density(alpha=0.4) +
  labs(title = title_ch4, 
       y = "Density") +
  theme_classic()
# save plot and dev off
dev.off()



### model ####

# 1. Mixed effects model
# (1|block) identifies bird as the random effects variable
z <- lmer(ch4.mg.m3.h ~ Treatment + (1 + block | site), data = dat)

# 2. Parameter estimates
summary(z)
anova(z)


















