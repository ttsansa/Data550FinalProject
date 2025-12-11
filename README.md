# Data 550 Final Project

This repository contains the data, code, and report for the Data 550 Final Project.  
The goal of the project is to analyze hypertension prevalence using the provided class dataset and produce a cleaned dataset, one required summary table, one required figure, and a final HTML report.

---
# Code Description

`R/01_clean.R`
- read raw data from `data/raw/` folder  
- clean variable names and convert needed columns  
- create sex-specific subset  
- save derived datasets in `data/derived/` folder  

`R/02_table.R`
- read `data_sex.csv` from `data/derived/` folder  
- create required summary table using `gtsummary`  
- summarize hypertension prevalence (%) by sex  
- print table output  

`R/03_figure.R`
- read `data_sex.csv` from `data/derived/` folder  
- calculate mean hypertension prevalence by year and sex  
- generate required figure using `ggplot2`  
- save plot in `figures/` folder  

`reports/final_report.Rmd`
- read cleaned data, summary table, and figure  
- display results and narrative for final report  

`Makefile`
- run cleaning script and render final report  
- save compiled HTML report in `reports/` folder  

`Docker`
- docker build -t data550_final .
- docker run -v "$(pwd)/report":/home/rstudio/project/report data550_final

- save compiled HTML report in `reports/` folder  
