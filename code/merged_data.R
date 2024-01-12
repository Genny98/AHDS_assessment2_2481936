# data_merge.R
library(dplyr)
library(readr)

# Load datasets
demo_data <- read_csv("/Users/geneviveagyapong/Documents/AHDS_assessment2_2481936/raw_data/DEMO_D.csv" ,show_col_types = FALSE)
bmi_data <- read_csv("/Users/geneviveagyapong/Documents/AHDS_assessment2_2481936/raw_data/BMI.csv" ,show_col_types = FALSE)

# Merge datasets
merged_data <- inner_join(demo_data, bmi_data, by = "SEQN")

# Selecting only necessary columns
merged_data <- merged_data %>% select(SEQN, RIAGENDR, BMXBMI)

# Data Cleaning
# Handling missing values
merged_data <- merged_data %>% filter(!is.na(BMXBMI), !is.na(RIAGENDR))

# Correcting data types
# RIAGENDR as a factor
merged_data <- merged_data %>% mutate(RIAGENDR = as.factor(RIAGENDR))

# Save merged data
write_csv(merged_data, "/Users/geneviveagyapong/Documents/AHDS_assessment2_2481936/clean_data/merged_clean_data.csv")






