# Main file
MAIN = main

# Output directory
OUTDIR = build

# LaTeX command (pdflatex + biber fallback)
LATEX = pdflatex -interaction=nonstopmode -halt-on-error

# Find all .tex files in current directory
TEXS := $(wildcard *.tex sections/*.tex)

# Build PDF
$(OUTDIR)/$(MAIN).pdf: $(wildcard *.tex sections/*.tex *.sty)
	mkdir -p $(OUTDIR)
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	biber --input-directory=$(OUTDIR) --output-directory=$(OUTDIR) $(MAIN)
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex

# Create output directory if it doesn't exist
$(OUTDIR):
	mkdir -p $(OUTDIR)

.PHONY: all clean rebuild
