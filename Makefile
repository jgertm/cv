
all: cv.pdf

cv.pdf: cv.org tufte.tex Makefile hilbert.pdf tufte-common.def tufte-handout.cls
	pandoc \
		--katex \
		--from org \
		--to latex+smart \
		--template=tufte.tex \
		--output $@ \
		$<

clean:
	rm -f *.log *.out *.bak *.aux *.toc *.idx *.bbl *.blg *.fdb_latexmk *.fls *.dvi 

watch:
	fdfind -e org -e tex | entr make
