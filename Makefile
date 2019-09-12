mazesrc = $(wildcard mazes/*.dot)
mazeobj = $(mazesrc:.dot=.png)

makosrc = $(wildcard *.mako.html)
makoobj = $(makosrc:.mako.html=.html)

.DEFAULT_GOAL := all

mazes/%.png: mazes/%.dot Makefile
	 dot -Tpng  -Gsize=4,5\! -Gdpi=100  $< -o $@

%.html: %.mako.html Makefile
	venv/bin/python build_slides.py $< $@

.PHONY: allmazes
allmazes: $(mazeobj)

.PHONY: allmako
allmako: $(makoobj)

.PHONY: clean
clean:
	rm -f $(mazeobj)

all: allmazes allmako
