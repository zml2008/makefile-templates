PANDOC_PDF_OPTS += -V geometry:margin=1in -V geometry:top=0.5in


%.html: %.md
	pandoc $< -o $@ $(PANDOC_OPTS) $(PANDOC_HTML_OPTS) --standalone -t html5

%.pdf: %.md
	pandoc $< -o $@ $(PANDOC_OPTS) $(PANDOC_PDF_OPTS) --standalone

%.tex: %.md
	pandoc $< -o $@ $(PANDOC_OPTS) --no-highlight --filter $(MAKEFILE_BASE)pandocminted/minted.py

%.html: %.present.md
	pandoc -t slidy --standalone $< -o $@ $(PANDOC_OPTS) $(PANDOC_HTML_OPTS) $(PANDOC_PRESENTATION_OPTS)

%.pdf: %.present.md
	pandoc -t beamer $< -o $@ $(PANDOC_OPTS) $(PANDOC_PRESENTATION_OPTS)
