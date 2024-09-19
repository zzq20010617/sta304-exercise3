#### Preamble ####
# Purpose: Simulates number of marriage for each month in a period of time
# Author: Ziqi Zhu
# Date: 19 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(tibble)  

#### Simulate data ####
# [...ADD CODE HERE...]

start_date <- as.Date("2020-01-01")
end_date <- as.Date("2021-12-31")

# Generate a sequence of months between the start and end dates
months_seq <- seq(from = floor_date(start_date, "month"), 
                  to = ceiling_date(end_date, "month") - days(1), 
                  by = "month")

# Set simulation parameters
average_marriages <- 50    # average number of marriages per month
std_dev_marriages <- 10    # standard deviation for random fluctuation

# Simulate marriage numbers for each month
set.seed(123)  # to make the simulation reproducible
marriage_numbers <- rnorm(length(months_seq), mean = average_marriages, sd = std_dev_marriages)
marriage_numbers <- round(pmax(marriage_numbers, 0))  # round and ensure no negative values

# Create a tibble to store results
simulate_data <- tibble(
  Month = months_seq,
  Marriages = marriage_numbers
)


#write csv
write.csv(simulate_data, "data/raw_data/simulate.csv", row.names = FALSE)

