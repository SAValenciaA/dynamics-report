# Main file
MAIN = main

# Output directory
OUTDIR = build

# LaTeX command
LATEX = latexmk -pdf --shell-escape -outdir=$(OUTDIR)

# Find all .tex files in current directory
TEXS := $(wildcard *.tex sections/*.tex)

# Build PDF
$(OUTDIR)/$(MAIN).pdf: $(wildcard *.tex sections/*.tex *.sty)
	$(LATEX) $(MAIN).tex

# Create output directory if it doesn't exist
$(OUTDIR):
	mkdir -p $(OUTDIR)

.PHONY: all clean rebuild
