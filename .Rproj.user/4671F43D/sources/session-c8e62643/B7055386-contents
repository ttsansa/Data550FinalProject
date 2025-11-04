
reports/final_report.html: reports/final_report.Rmd R/01_clean.R data/raw/Data550Finalproject.csv
	Rscript R/01_clean.R
	Rscript -e "rmarkdown::render('reports/final_report.Rmd', output_dir='reports', output_file='final_report.html')"


derived_data:
	Rscript R/01_clean.R


.PHONY: clean
clean:
	rm -f reports/final_report.html

