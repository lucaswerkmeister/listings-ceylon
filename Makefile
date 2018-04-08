.PHONY: all install uninstall clean

install-dir := $(shell kpsewhich -var-value=TEXMFHOME)/tex/latex/listings-ceylon

all: listings-ceylon.sty listings-ceylon.pdf

listings-ceylon.sty: listings-ceylon.ins listings-ceylon.dtx
	$(RM) listings-ceylon.log
	$(RM) $@ # otherwise, docstrip asks before overwriting the target file
	latex $<

listings-ceylon.pdf: listings-ceylon.dtx
	$(RM) listings-ceylon.log
	latexmk -pdf $<

install: listings-ceylon.sty
	mkdir -p $(install-dir)
	cp $< $(install-dir)

uninstall:
	$(RM) $(install-dir)/listings-ceylon.sty

clean:
	latexmk -C listings-ceylon.ins listings-ceylon.dtx
