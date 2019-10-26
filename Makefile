targets = cyber.pdf accreditation.pdf

all: $(targets)

pdflatex = pdflatex -interaction=errorstopmode -halt-on-error

%.pdf:  %.tex CEP2020.bib
	$(pdflatex) $<
	bibtex $*
	$(pdflatex) $<
	$(pdflatex) $<

.PHONY: clean
clean:
	rm -f $(targets) *.aux *.log *.nav *.out *.snm *.toc *.vrb *.bbl *.blg *.synctex.gz
