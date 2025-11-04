library(tidyverse)
library(readr)
library(ggplot2)
library(gtsummary)
library(stringr)

raw <- read_csv("data/raw/Data550Finalproject.csv", show_col_types = FALSE)
raw_data <- raw
names(raw_data)

clean_data <- raw_data %>%
	rename(
		year           = TIME_PERIOD,
		dimension      = GROUP,
		category       = SUBGROUP,
		prevalence_pct = ESTIMATE
	) %>%
	mutate(prevalence_pct = suppressWarnings(as.numeric(prevalence_pct))) %>%
	filter(!is.na(prevalence_pct))

data_sex <- clean_data %>%
	filter(dimension == "Sex") %>%
	mutate(
		sex = case_when(
			str_to_lower(category) %in% c("male","m")   ~ "Male",
			str_to_lower(category) %in% c("female","f") ~ "Female",
			TRUE ~ as.character(category)
		)
	) %>%
	select(year, sex, prevalence_pct)

write_csv(clean_data, "data/derived/clean_data.csv")
write_csv(data_sex,   "data/derived/data_sex.csv")
