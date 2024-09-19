#### Preamble ####
# Purpose: Cleans the raw plane data recorded
# Author: Ziqi Zhu
# Date: 19 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |> 
  janitor::clean_names() |>
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
         ) |> select(date, civic_centre, marriage_licenses)

  

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
