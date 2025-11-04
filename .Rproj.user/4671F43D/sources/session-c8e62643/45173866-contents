library(tidyverse)
library(readr)
library(ggplot2)
library(stringr)

dir.create("figures", showWarnings = FALSE)

data_sex <- read_csv("data/derived/data_sex.csv", show_col_types = FALSE)

tab_year_sex <- data_sex %>%
	mutate(
		year_num = suppressWarnings(as.numeric(stringr::str_extract(as.character(year), "\\d{4}")))
	) %>%
	filter(!is.na(year_num), !is.na(prevalence_pct), !is.na(sex)) %>%
	group_by(year_num, sex) %>%
	summarize(mean_prevalence = mean(prevalence_pct, na.rm = TRUE), .groups = "drop")

data_sex <- read_csv("data/derived/data_sex.csv", show_col_types = FALSE)

tab_year_sex <- data_sex %>%
	mutate(
		year_num = suppressWarnings(as.numeric(stringr::str_extract(as.character(year), "\\d{4}")))
	) %>%
	filter(!is.na(year_num), !is.na(prevalence_pct), !is.na(sex)) %>%
	group_by(year_num, sex) %>%
	summarize(mean_prevalence = mean(prevalence_pct, na.rm = TRUE), .groups = "drop")
