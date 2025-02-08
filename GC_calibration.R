## J Collins 
## GC Calibration 

## Przemek and Max GC calibration - 23/08/24


## PACKAGES ####

# Load necessary libraries
library(readxl)
library(dplyr)



## DATA ####


# Define the path to the Excel file
file_path <- "data/raw_data/2024_08_23/REPORT01.xls"

# Read the labels sheet to get the column names
labels <- read_excel(file_path, sheet = "Labels", skip = 1)[, -1:-2] #delete columns 1:2

colnames(labels) <- c("col", "name", "Title")

# Extract the column names from the "title" column in the labels sheet
column_names <- labels$Title

# Read the data from the "Data" sheet
data <- read_excel(file_path, sheet = "Data", col_names = FALSE, skip = 1)[, -1:-2] #delete columns 1:2


# Assign the extracted column names to the data
colnames(data) <- column_names

# Assign the extracted column names to the data
colnames(data) <- make.names(column_names, unique = TRUE)



## SUMMARISE THE DATA ####

# Summarize the data by grouping by the "sample" column
summary_data <- data %>%
  group_by(Sample) %>%
  summarise(across(everything(), ~ if(is.numeric(.)) mean(. , na.rm = TRUE) else first(.), .names = "mean_{col}"))



write.csv(x = summary_data, file = "data/processed_data/2024_08_23_calibration_data.csv")
