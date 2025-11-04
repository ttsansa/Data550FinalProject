library(tidyverse)
library(readr)
library(gtsummary)

dir.create("tables", showWarnings = FALSE)

data_sex <- read_csv("data/derived/data_sex.csv", show_col_types = FALSE)

tbl_sex <- data_sex %>%
	select(sex, prevalence_pct) %>%
	tbl_summary(
		by = sex,
		label = list(prevalence_pct ~ "Hypertension prevalence (%)"),
		type  = list(prevalence_pct ~ "continuous"),
		statistic = list(prevalence_pct ~ "{mean} ({sd})"),
		missing = "no"
	) %>%
	add_overall(last = TRUE) %>%
	add_p(test = all_continuous() ~ "t.test") %>%
	modify_header(label ~ "**Measure**") %>%
	modify_caption("**Table 1. Hypertension prevalence (mean ± SD) by sex**")
print(tbl_sex)
