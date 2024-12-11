## HEADER ####
## who: J Collins
## what: GLM Practice
## when: 

## CONTENTS ####
## 00 Setup
## 01 <replace with brief decription of 1st section>
## 02 <replace with brief decription of 2nd section>
## 03 <etc>

## 00 Setup ####
# libraries

setwd("/Users/u1764794/OneDrive - Harper Adams University/N2O cover crop experiment/analysis/")

# read data

## 01 <replace with brief decription of 1st section> ####

suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(visreg))
suppressPackageStartupMessages(library(MASS))

library(lmerTest)

# 1.Read the data
data <- read.csv("n2o_flux_data.csv", 
              stringsAsFactors = FALSE)
head(data)

# Add Factors for the raw data
data$Crop <- factor(data$Crop)
data$Cut <- factor(data$Cut)
data$WFPS <- factor(data$WFPS)



# Some stats calculations
min(data$BD) # min
max(data$BD) # max
mean(data$BD)
mean(data$BD, na.rm = TRUE) #if there is at least one missing value in your dataset, use mean(combine_data$Yield, na.rm = TRUE) to compute the mean with the NA excluded. This argument can be used for most functions, not only the mean
median(data$BD) # median
sd(data$BD) # standard deviation
var(data$BD) # variance
summary(data) # You can compute the minimum,first quartile, median, mean, third
# quartile and the maximum for all numeric variables of a dataset at once using summary()

# Calculates mean, sd, se and IC
my_sum <- data %>%
  group_by(Crop, Cut, WFPS) %>%
  summarise( 
    n=n(),
    mean=mean(Flux),
    sd=sd(Flux)
  ) %>%
  mutate( se=sd/sqrt(n))  %>%
  mutate( ic=se * qt((1-0.05)/2 + .5, n-1))

# Organise factors
my_sum$Crop <- as.factor(my_sum$Crop)
my_sum$Cut <- as.factor(my_sum$Cut)
my_sum$WFPS <- as.factor(my_sum$WFPS)


## 02 Graph ####

# Error bars represent standard error of the mean/ this graph includes all depths together.
f <- ggplot(my_sum, aes(x=Crop, y=mean, fill=WFPS)) + 
  geom_bar(position=position_dodge(), stat="Identity") + labs(title="Average Dry Bulk Density per tillage treatment (10-20 cm)",x="Tillage", y = "Density (g cm-3)") +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                width=.2,         # Width of the error bars
                position=position_dodge(.9))
f

# per traffic treatment
f <- ggplot(my_sum, aes(x=Traffic, y=mean, fill=Tillage)) + 
  geom_bar(position=position_dodge(), stat="Identity") + labs(title="Average Dry Bulk Density per traffic treatment (10-20 cm)",x="Traffic", y = "Density (g cm-3)") +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                width=.2,         # Width of the error bars
                position=position_dodge(.9))
f

##Ana new script to see interaction between blocks visually##
data$Block <- factor(data$Block)
data$Traffic <- factor(data$Traffic)

tillage_levels <- c("Zero","Shallow","Deep")

data$Tillage <- factor(data$Tillage, ordered = T, levels = tillage_levels)
table(data$Plot); length(table(data$Plot))

summary(data$BD)

interaction.plot(x.factor = data$Traffic,  #Block 4 looks quite different
                 trace.factor = data$Block, #If blocks don't matter they will be all the lines on top of one another
                 response = data$BD)  

interaction.plot(x.factor = data$Tillage,
                 trace.factor = data$Block,  #All Blocks looks very different
                 response = data$BD) 

interaction.plot(x.factor = data$Tillage,
                 trace.factor = data$Traffic, #similar trend
                 response = data$BD)  

#diagnose block
boxplot(BD ~ Block, data = data)
etaSquared(aov(BD ~ Block, data = data))
etaSquared(aov(BD ~ Traffic, data = data))
etaSquared(aov(BD ~ Tillage, data = data))
#the proportion of total variance explanined by block is 11%, 26% Traffic and Tillage is 0.055%.

boxplot(BD ~ Traffic + Tillage, data = data,
        ylim = c(1.2,2), xaxt='n', xlab='',
        col = c('gray20', 'gray70', 'white'),
        at = c(1,2,3,5,6,7,9,10,11))
stripchart(BD ~ Traffic + Tillage, data = data,
           ylim = c(4,6), add = T, vertical = T,
           method = 'jitter', pch = 16, cex = .5,
           at = c(1,2,3,5,6,7,9,10,11), col = 'red')
axis(side = 1, at = c(2,6,10), tick = F, line = -0.5,
     labels = c('Deep', 'Shallow', 'Zero'))
axis(side = 1, at = c(6), tick = F, line = 1,
     labels = c('Tillage'))
legend(x = 10, y = 1.5, 
       legend = c('CTF', 'LTF', 'STP'),
       pch = 22, pt.bg = c('gray20', 'gray70', 'white'),
       title = 'Traffic', bty='n')




## 03 Stats ####

#Mixed effect model with random effect blcok and interaction effect. If you are interested
#in interaction only consider this one
lme1 <- lmer(BD ~ Tillage * Traffic + (1|Block), data = data)
summary(lme1)
plot(lme1)
anova(lme1)
r.squaredGLMM(lme1)
plot_model(lme1, show.values = TRUE, show.p = TRUE)


#post hoc test tukey mixed effects with interaction 
lsmeans(lme1, pairwise~Tillage*Traffic, adjust="tukey")

## 04 JOE EDITS ####

# P Values for just Traffic 

lsmeans(lme1, pairwise~Traffic, adjust="tukey") #Maybe run this without the interaction as the ANOVA shows that Tillage has no sig difference? 

# For all

library(lmerTest)
difflsmeans(lme1, test.effs = "Group", adjust = "tukey")
# OR USE: ??????????
difflsmeans(lme1, test.effs = "Group", ddf="Kenward-Roger")


#################################################################################

# 3. Grouped strip chart
# First, reorder treatment categories
x$treatment <- factor(x$treatment,levels=c("Crop","Cut","WFPS"))

ggplot(data = x, 
       aes(y = log(Flux), 
           x = Treatment, 
           fill = Day, 
           color = Day)) + 
  geom_point(size = 3, position = position_dodge(width = 0.7)) +
  labs(x = "Treatment", y = "log phenolics concentration") +
  theme_classic()

# These commands produce a type of "dot plot"
# This is useful to compare variation AMONGST individuals
# and WITHIN individuals for Patch length

stripchart(Flux ~ Day, data = x, vertical = TRUE, pch = 16, 
           cex = 1.5, las = 2, col = "blue",
           xlab = "Day", ylab = "Cumlative Flux")

stripchart(Flux ~ WFPS, data = x, vertical = TRUE, pch = 16, 
           cex = 1.5, las = 2, col = "blue",
           xlab = "WFPS", ylab = "Cumlative Flux")

stripchart(Flux ~ Crop, data = x, vertical = TRUE, pch = 16, 
           cex = 1.5, las = 2, col = "blue",
           xlab = "Day", ylab = "Cumlative Flux")


# 1. Mixed effects model
# (1|bird) identifies bird as the random effects variable
z <- lmer(Flux ~ Treatment + (1|Day), data = x)

# 2. Parameter estimates
summary(z)

# 7. ANOVA
anova(z)

visreg(z, xvar = "Flux", by = "Cut",
       scales = list(rot = 90))

