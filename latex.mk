# Vars to set:
# - PROJECTS: Projects to build by default

DEPDIR := .d
$(shell mkdir -p $(DEPDIR) >/dev/null)

# Options to pass to latexmk. These are generally good defaults (-shell-escape should only be present if a package needing it exists)
LATEXMKOPTS+=-lualatex -shell-escape -use-make
POSTCOMPILE = mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d

# The LaTeX files (without extension) that will be built

# Don't edit anything below here -- these define all the tasks for the files in $(PROJECTS)

.PHONY: clean

%.pdf: %.tex $(DEPDIR)/%.d
	latexmk -pdf -interaction=nonstopmode $(LATEXMKOPTS) -deps-out=$(DEPDIR)/$*.Td $<
	$(POSTCOMPILE)

clean: $(foreach proj, $(PROJECTS), clean-$(proj))

clean-%: %.tex
	latexmk -c $<


$(DEPDIR)/%.d: ;

include $(patsubst %,$(DEPDIR)/%.d,$(basename $(PROJECTS)))
