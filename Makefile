install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

reports/final_report.html: reports/final_report.Rmd R/01_clean.R data/raw/Data550Finalproject.csv
	Rscript R/01_clean.R
	Rscript -e "rmarkdown::render('reports/final_report.Rmd', output_dir='reports', output_file='final_report.html')"


derived_data:
	Rscript R/01_clean.R


.PHONY: clean
clean:
	rm -f reports/final_report.html

# Docker image on Docker Hub
DOCKER_IMAGE = chishan0629/data550finalproject:latest

.PHONY: docker_report
docker_report:
	docker run --rm -v "$$(pwd)/report":/home/rstudio/project/report $(DOCKER_IMAGE)

