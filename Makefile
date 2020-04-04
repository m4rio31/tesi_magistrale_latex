NAME = principale
MAIN_SOURCE = $(NAME).tex
OUTDVI = $(NAME).dvi
OUTPDF = $(NAME).pdf
BBL = bibliografia.bib
TEXS = $(wildcard TeX/*.tex)
FILE_CLEAN = $(NAME).aux $(NAME).blg $(NAME).log $(NAME).dvi \
		$(NAME).toc $(NAME).bbl $(NAME).out $(NAME).synctex.gz \
		*.tex~ TeX/*.tex~ TeX/*.aux TeX/*.backup TeX/*.bak

LATEX	= latex
LUALATEX = lualatex
PDFLATEX = pdflatex
BIBTEX	= bibtex

compile_and_clean: $(OUTPDF) clean

.PHONY: clean $(OUTPDF)

clean:
	rm -f $(FILE_CLEAN)

$(OUTPDF):	$(MAIN_SOURCE) $(BBL)
	$(LUALATEX) $(NAME)
	$(BIBTEX) $(NAME)
	$(LUALATEX) $(NAME)
	$(LUALATEX) $(NAME)

