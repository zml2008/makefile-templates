
MAKEFILE_BASE :=$(dir $(lastword $(MAKEFILE_LIST)))

include $(foreach lib, $(LIBRARIES), $(MAKEFILE_BASE)/$(lib).mk)

.DEFAULT_GOAL=all
.PHONY: clean


all: $(foreach proj, $(PROJECTS), $(proj).pdf)
print: $(foreach proj, $(PROJECTS), print-$(proj))

print-%: %.pdf
	lpr -l $<
