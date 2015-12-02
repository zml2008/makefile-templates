# R-related tasks


%.tex: %.Rnw
	R -e "if (!require('knitr')) install.packages('knitr', dependencies = TRUE); knit('$<')"

%.md: %.Rmd
	R -e "if (!require('knitr')) install.packages('knitr', dependencies = TRUE); knit('$<')"
