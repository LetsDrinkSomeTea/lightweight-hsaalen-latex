# Set the main document name (without extension)
MAIN = Ausarbeitung

# Tools
LATEX = xelatex
BIBER = biber
MAKEINDEX = makeindex

# Flags
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Default target
all: $(MAIN).pdf

# Generate the PDF
$(MAIN).pdf: $(MAIN).tex *.tex literature.bib images/* ausarbeitung.cls
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Run makeindex for the index
$(MAIN).ind: $(MAIN).idx
	$(MAKEINDEX) $(MAIN).idx

# Generate the index file
$(MAIN).idx: $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Clean up auxiliary files
clean:
	rm -f *.aux *.log *.toc *.bbl *.bcf *.blg *.run.xml *.idx *.ind *.ilg *.out

# Clean up all generated files
distclean: clean
	rm -f $(MAIN).pdf

.PHONY: all clean distclean

