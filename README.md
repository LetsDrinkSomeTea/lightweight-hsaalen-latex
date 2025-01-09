# Einfache Latex Vorlage im HS-Aalen Design.

Zur Verwendung die Attribute in der `Ausarbeitung.tex`-Datei anpassen.
Anschließlich in `content.tex` den Inhalt der Arbeit schreiben.

Es wird xelatex und biber verwendet, es kann also mit `\cite{QUELLE}` zitiert werden.
Alle Dokumente sind UTF-8 kodiert.

Das Erstellen einer PDF kann mittels der `Makefile` passieren.

- make: Erstellt die PDF
- clean: Löscht alle temporären Dateien außer der PDF
- distclean: Löscht alle temporären Dateien inklusive der PDF
