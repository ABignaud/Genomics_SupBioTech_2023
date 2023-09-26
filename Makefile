build: $(HTML_NB)
	Rscript -e "blogdown::build_dir('static/')"
