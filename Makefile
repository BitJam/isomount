ROOT        := .

SHELL       := /bin/bash

SCRIPTS     := isomount isoumount sqmount squmount clean-isomount show-isomount
SCRIPTS     := $(SCRIPTS) dfh
BIN_DIR     := $(ROOT)/usr/local/bin
MAN_DIR     := $(ROOT)/usr/share/man/man1
ALL_DIRS    := $(BIN_DIR) $(MAN_DIR)
CP_OPTS     := --no-dereference --preserve=mode,links

.PHONY: 	help all scripts man-pags

help:
	@echo "make help                 show this help"
	@echo "make install              install to current directory"
	@echo "sudo make install ROOT=   install to /"
	@echo
	@echo "If the ROOT directory does not exist then we won't install"

install: scripts man-pages
scripts: | $(BIN_DIR)
	cp $(SCRIPTS) $(BIN_DIR)

man-pages: | $(MAN_DIR)
	cp $(CP_OPTS) man/* $(MAN_DIR)

$(ALL_DIRS):
	test -d $(ROOT)/
	mkdir -p $@
