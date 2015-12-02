PANDOC_PDF_OPTS += -V geometry:margin=1in -V geometry:top=0.5in


%.html: %.md
	pandoc $< -o $@ $(PANDOC_OPTS) $(PANDOC_HTML_OPTS) --standalone -t html5

%.pdf: %.md
	pandoc $< -o $@ $(PANDOC_OPTS) $(PANDOC_PDF_OPTS) --standalone
