
# Set the main document name (without extension)
MAIN = Ausarbeitung

# Define the build directory
BUILD_DIR = tmp

# Tools
LATEX = xelatex
BIBER = biber
MAKEINDEX = makeindex

# Flags
# -output-directory=$(BUILD_DIR) sorgt dafür, dass alle Hilfsdateien im BUILD_DIR landen.
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR)

# Default target
all: $(MAIN).pdf

# Erzeuge das build-Verzeichnis, falls nicht vorhanden
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Hauptziel: PDF erstellen
$(MAIN).pdf: *.tex literature.bib images/* ausarbeitung.cls | $(BUILD_DIR)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(BIBER) $(BUILD_DIR)/$(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	mv $(BUILD_DIR)/$(MAIN).pdf .


# Erzeuge Index-Datei
# Achtung: Hier muss ebenfalls -output-directory verwendet werden
$(BUILD_DIR)/$(MAIN).idx: $(MAIN).tex | $(BUILD_DIR)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Index erstellen
$(BUILD_DIR)/$(MAIN).ind: $(BUILD_DIR)/$(MAIN).idx
	$(MAKEINDEX) $(BUILD_DIR)/$(MAIN).idx

# Aufräumen: Löschen aller generierten Hilfsdateien
clean:
	rm -rf $(BUILD_DIR)

# Komplette Säuberung: PDF und build-Ordner entfernen
distclean: clean
	rm -f $(MAIN).pdf

.PHONY: all clean distclean
