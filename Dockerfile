FROM rocker/tidyverse:4.5.1
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project


RUN Rscript -e "install.packages(c('tidyverse', 'gtsummary', 'rmarkdown', 'here'))"


COPY data data
COPY R R
COPY reports reports
COPY figures figures
COPY tables tables
COPY README.md README.md
COPY Makefile Makefile


RUN mkdir -p data/derived
RUN mkdir -p report


CMD ["bash", "-c", "Rscript R/01_clean.R && Rscript R/02_table.R && Rscript R/03_figure.R && Rscript -e \"rmarkdown::render('reports/final_report.Rmd', output_dir='report', output_file='final_report.html')\""]
