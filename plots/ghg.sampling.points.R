## GHG Field Trials read and plot shapefiles to plot samplign points ####
## Who: JW Collins 
## what:  
## Last edited: 2023-03-07


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##


## 00 Setup ####

getwd()

# Load packages
library(ggplot2)
library(dplyr)
library(ggsci)
library(sjPlot)
library(sjmisc)
library(sjlabelled)
library(viridis)
library(rgdal)
library(broom)
library(gridExtra)


## 01 Data ##

## 01 LOAD DATA ####

dat <- read.csv("experimental.design/sampling.points/ghg.sampling.points.csv")

my_spdf1 <- readOGR( 
  dsn= "Shapefiles/Field Boundaries/" , 
  layer="Both_field_boundaries",
  verbose=FALSE
)

glimpse(my_spdf1)

my_spdf2 <- readOGR( 
  dsn= "Shapefiles/Plots/Buffered plots/" , 
  layer="all.plots.buffered",
  verbose=FALSE
)

glimpse(my_spdf2)


# Read Data

shp_dat1 <- as.data.frame(my_spdf1)
shp_dat2 <- as.data.frame(my_spdf2)

con.dat <- filter(my_spdf2, treatment == "CON")

spdf_fortified1 <- tidy(my_spdf1)
spdf_fortified2 <- tidy(my_spdf2)

# Plot it

# open png for file save and define size and resolution
png(paste("plots/sampling.points/", "Static Chamber Sampling Points", ".png", sep=""), 
    width=1200, height=900, res=150)

plot1 <- ggplot() +
  geom_polygon(data = spdf_fortified1, aes( x = long, y = lat, group = group), 
               fill="white", color="black") +
  ggtitle("Static Chamber Sampling Points 2023") +
  xlab(element_blank()) + ylab("y") + xlab("x") + labs(fill = NA) + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  theme(legend.position = c(1.3, .5))  + 
  labs(subtitle = element_blank()) +
  geom_polygon(data = spdf_fortified2, aes( x = long, y = lat, group = group), 
               fill="grey", color="grey") +
  geom_point(data=dat, aes(y=y, x=x, color = Treatment)) +
  geom_text(data = dat, size = 3, check_overlap = T,
            aes(y=y, x=x, label = sample, angle = 0, hjust = 1.2)) 

plot1 

# save plot and dev off
dev.off()



plot2 <- ggplot() +
  geom_polygon(data = spdf_fortified2, aes( x = long, y = lat, group = group), 
               fill="grey", color="black")

plot2

plot2 <- plot2 + ggtitle(element_blank()) +
  xlab("x WGS84") + ylab("y WGS84") + labs(fill = "Field 2") + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  theme(legend.position = c(1.3, .5))  + labs(subtitle = "Field 2")

grid.arrange(plot1, plot2, ncol = 1, nrow = 2)



plot2

exper.tex <- readOGR( 
  dsn= "~/OneDrive - Harper Adams University/Data/Omnia /Soil Texture /" , 
  layer="experiment.soil.texture",
  verbose=FALSE
)

# Read Data

shp_dat1 <- as.data.frame(exper.tex)

spdf_fortified1 <- tidy(exper.tex)

# Plot it

plot1 <- ggplot() +
  geom_polygon(data = spdf_fortified1, aes( x = long, y = lat, group = group), 
               fill="grey", color="black")

plot1 <- plot1 + ggtitle("QBS Sampling Points 2022") +
  xlab(element_blank()) + ylab("y WGS84") + xlab("x WGS84") + labs(fill = NA) + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  theme(legend.position = c(1.3, .5))  + labs(subtitle = element_blank())

plot1

plot1 + geom_point(data=qbs.counts, aes(y=y, x=x, color = Treatment))





