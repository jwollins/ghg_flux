## HEADER ####
## who: J Collins
## what: Gas chromatograph data conversions
## when: 2023-03-19

## CONTENTS ####
## 00 PACKAGES ####
## 01 LOAD DATA ####

## 00 packages ####
library(dplyr)
library(lmerTest)
library(emmeans)

## 01 LOAD DATA ####
dat <- read.csv(file = "data/processed.data/gc.data.all.days.csv")
mean.dat <- read.csv(file = "data/processed.data/mean.flux.data.csv")
soil.dat <- read.csv("data/sampling.point.data/ghg.sampling.points.wgs84.csv") # source data load
cosmos.dat <- read.csv(file = "data/COSMOS/cosmos.dat.csv")

##. ####
## Intro stats ####

# filter to Treatment 
ca.dat <-  filter(mean.dat, Treatment == "Conservation")
con.dat <- filter(mean.dat, Treatment == "Conventional")

### CO2 ####
# max fluxes
max(con.dat$mean.co2.g.m3.h)
max(ca.dat$mean.co2.g.m3.h)
# min fluxes
min(con.dat$mean.co2.g.m3.h)
min(ca.dat$mean.co2.g.m3.h)
# mean fluxes
mean(con.dat$mean.co2.g.m3.h)
mean(ca.dat$mean.co2.g.m3.h)

# max cumulative
max(con.dat$cumsum.co2.g.m3.h)
max(ca.dat$cumsum.co2.g.m3.h)


### N2O ####
# max fluxes
max(con.dat$mean.n2o.mg.m3.h)
max(ca.dat$mean.n2o.mg.m3.h)
# min fluxes
min(con.dat$mean.n2o.mg.m3.h)
min(ca.dat$mean.n2o.mg.m3.h)
# mean fluxes
mean(con.dat$mean.n2o.mg.m3.h)
mean(ca.dat$mean.n2o.mg.m3.h)

# max cumulative
max(con.dat$cumsum.n2o.mg.m3.h)
max(ca.dat$cumsum.n2o.mg.m3.h)


### CH4 ####
# max fluxes
max(con.dat$mean.ch4.mg.m3.h)
max(ca.dat$mean.ch4.mg.m3.h)
# min fluxes
min(con.dat$mean.ch4.mg.m3.h)
min(ca.dat$mean.ch4.mg.m3.h)
# mean fluxes
mean(con.dat$mean.ch4.mg.m3.h)
mean(ca.dat$mean.ch4.mg.m3.h)

# max cumulative
min(con.dat$cumsum.ch4.mg.m3.h)
min(ca.dat$cumsum.ch4.mg.m3.h)


### GWP ####
# max flux
max(con.dat$gwp.mean.mg.m3.h / 1000)
min(con.dat$gwp.mean.mg.m3.h /1000)





## Soil Data ####

### sand ####
max(soil.dat$Sand)
min(soil.dat$Sand)

### clay ####
max(soil.dat$Clay)
min(soil.dat$Clay)

### silt ####
max(soil.dat$Silt)
min(soil.dat$Silt)

### SOC ####
min(soil.dat$som)
max(soil.dat$som)

### BD ####
min(soil.dat$bulk.densi)
max(soil.dat$bulk.densi)


### pH ####
min(soil.dat$pH)
max(soil.dat$pH)

### P ####
min(soil.dat$P)
max(soil.dat$P)

### K ####
min(soil.dat$K)
max(soil.dat$K)

### temperature ####
min(cosmos.dat$STP.03.Soil.Temperature.at.10cm)
max(cosmos.dat$STP.03.Soil.Temperature.at.10cm)

### moisture ####
min(cosmos.dat$TDT.01...Volumetric.Water.Content.at.10cm)
max(cosmos.dat$TDT.01...Volumetric.Water.Content.at.10cm)

## mixed models ####

# 1. Mixed effects model
# (1|block) identifies bird as the random effects variable
c <- lmer(co2.g.m3.h ~ factor(Treatment) + 
            N.kg.ha + soil.temp + soil.moist + 
            (1 | batch.date) + (1 | block), data = dat)
summary(c)
anova(c)


n <- lmer(n2o.mg.m3.h ~ factor(Treatment) * 
            N.kg.ha + soil.temp + soil.moist + 
            (1 | batch.date) + (1 | block), data = dat)
summary(n)
anova(n)


ch <- lmer(ch4.mg.m3.h ~ factor(Treatment) + N.kg.ha + soil.temp + soil.moist + (1 | batch.date) + (1 | block), data = dat)
summary(ch)


### GWP ####

gwp <- lmer(dat$gwp.total ~ factor(Treatment) + 
              N.kg.ha + soil.temp + soil.moist + 
              (1 | batch.date) + (1 | block), data = dat)
summary(gwp)


### yield scaled GWP ####


ys <- lmer(dat$ys.gwp.total ~ factor(Treatment) + 
            N.kg.ha + soil.temp + soil.moist + 
            (1 | batch.date) + (1 | block), data = dat)
summary(ys)

ca.gwp.sum <- sum(ca.dat$ys.gwp.total /1000000)
con.dat.sum <- sum(con.dat$ys.gwp.total /1000000)

#### GLM ####

# run glm with 
glm <- glm(ys.gwp.total ~ factor(Treatment),
           data = dat)

summary(glm) 
anova(glm) 


glm <- glm(ys.gwp.n2o ~ factor(Treatment),
           data = dat)

summary(glm)

mean.filt <- filter(mean.dat, batch.date == "2023-07-28")

glm <- glm(n2o.mg.m3.h ~ factor(Treatment),
           data = mean.filt)

summary(glm)









