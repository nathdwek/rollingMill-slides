default: pics latexmk

EPSPICS = $(wildcard pics/*.eps)
PDFPICS = $(EPSPICS:.eps=.pdf)

latexmk:
	latexmk

pics: $(PDFPICS)

./pics/%.pdf: ./pics/%.eps
	cat $< | epstopdf --filter | pdfcrop - $@;

prev:
	ds okular main.pdf
