This is a collection of makefile components that may be useful.

# pdfbase
*File:* pdfbase.mk

The base file. Will automatically include other modules, provides goals to generate and print pdf files

## Variables
- PROJECTS: The projects to build to PDFs (without file extensions)
- LIBRARIES: Other files in this makefile component bundle to include

## Goals
- all: Build all in `PROJECTS`
- print: Print all in `PROJECTS`
- `print-$(PROJECT)`: Print a single file

# R (knitr)
*File:* R.mk

## Goals
- %.Rmd -> %.md: Knit a Rmarkdown file into plain markdown
- %.Rnw -> %.tex: Knit a Rnoweb file into latex with additions


# Markdown
*File:* markdown.mk

Using `pandoc`, convert markdown files to various other formats

## Goals
- %.md -> %.html
- %.md -> %.pdf

## Variables
- PANDOC_OPTS: Options to pass to pandoc
- PANDOC_HTML_OPTS: Options to pass to pandoc for the HTML output format
- PANDOC_PDF_OPTS: Options to pass to pandoc for the PDF output format

# LaTeX
*File:* latex.mk

Using `latexmk`, builds latex documents with proper dependency tracking

## Goals
- %.tex -> %.pdf: Build a pdf from any same-named tex file
- clean-% (requires %.tex): Remove temporary build files for a given tex file

## Variables
- LATEXMKOPTS: Options to pass to `latexmk`
