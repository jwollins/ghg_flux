# Title: point locations map
# Author: J Collins
# Date: 2023-06-28

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

library(sf)
library(raster)
library(rasterVis)

## 01 LOAD DATA ####

### GHG sampling points ####

ghg.dat <- st_read("Shapefiles/GHG.sampling.points/ghg.sampling.points.shp")

plot(ghg.dat, max.plot = 15)

### boundary and plot ####
bound.plots <- st_read("Shapefiles/Bound.and.plots/bound.and.full.plots.shp")

# add field boundary to treatments
bound.plots$Treatment[is.na(bound.plots$Treatment)] <- "Field"

# check spdf layers
plot(bound.plots, max.plot = 15)

### points ####

rp <- st_read("Shapefiles/RP/250rp.wgs84.shp")

plot(rp, max.plot = 15)


### EC ####

ec.shallow.0333 <- st_read("Shapefiles/EC/Shallow EC/HARPAD08_0333_shallow.shp")

plot(ec.shallow.0333, max.plot = 15)

ec.shallow.3051 <- st_read("Shapefiles/EC/Shallow EC/HARPAD08_3051_shallow.shp")

plot(ec.shallow.3051, max.plot = 15)

ec.deep.0333 <- st_read("Shapefiles/EC/Deep EC/HARPAD08_0333_deep.shp")

plot(ec.deep.0333, max.plot = 15)

ec.deep.3051 <- st_read("Shapefiles/EC/Deep EC/HARPAD08_3051_deep.shp")

plot(ec.deep.3051, max.plot = 15)


### Soil Texture - gamma-ray spectrometer ####

tm.0333 <- st_read("Shapefiles/omnia.map.layers/New field 1 - Soil texture.shp")

plot(tm.0333, max.plot = 15)

tm.3051 <- st_read("Shapefiles/omnia.map.layers/New field 2 - Soil texture.shp")

plot(tm.3051, max.plot = 15)


### Image ####

# read photo in as a raster
image <- raster("Shapefiles/Images/WGS84_High_res_field_image.tif")

# check resoloution
res(image)
#aggregate to reduce raster file resoloution
image <- aggregate(image, fact = 20)
# check reduced res
res(image)

#convert the raster to points for plotting
image <- rasterToPoints(image)

#Make the points a dataframe for ggplot
df.image <- data.frame(image)

#Make appropriate column headings
colnames(df.image) <- c("Longitude", "Latitude", 'Values')


### SOC Soil Organic Carbon - gamma-ray spectrometer ####

soc.0333 <- st_read("Shapefiles/omnia.map.layers/New field 1 - Organic Carbon %.shp")

plot(soc.0333, max.plot = 15)

soc.3051 <- st_read("Shapefiles/omnia.map.layers/New field 2 - Organic Carbon %.shp")

plot(soc.3051, max.plot = 15)


### SOM Soil organic matter - gamma-ray spectrometer ####

som.0333 <- st_read("Shapefiles/omnia.map.layers/New field 1 - Organic Matter %.shp")

plot(som.0333, max.plot = 15)

som.3051 <- st_read("Shapefiles/omnia.map.layers/New field 2 - Organic Matter %.shp")

plot(som.3051, max.plot = 15)

### Soil Texture - gamma-ray spectrometer ####

water.0333 <- st_read("Shapefiles/omnia.map.layers/New field 1 - Plant Available Water Index.shp")

plot(water.0333, max.plot = 15)

water.3051 <- st_read("Shapefiles/omnia.map.layers/New field 2 - Plant Available Water Index.shp")

plot(water.3051, max.plot = 15)


### buffered plots ####

buff.plot <- st_read("Shapefiles/CRS84/Treatments/all.plots.buffered.shp")

plot(buff.plot, max.plot = 15)


### sample zone ####

samp.zone <- st_read("Shapefiles/sample.zones/sample.zone.buffered.shp")

plot(samp.zone, max.plot = 16)



