SOURCE=skripta

all:
	pdflatex $(SOURCE).tex
	makeindex $(SOURCE)
	pdflatex $(SOURCE).tex
	pdflatex $(SOURCE).tex

clean:
	-rm $(SOURCE).aux
	-rm $(SOURCE).cdx
	-rm $(SOURCE).idx
	-rm $(SOURCE).ilg
	-rm $(SOURCE).ind
	-rm $(SOURCE).log
	-rm $(SOURCE).pdf
	-rm $(SOURCE).toc
