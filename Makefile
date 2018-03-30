ROOT        := .

SHELL       := /bin/bash

SCRIPTS     := isomount isoumount sqmount squmount clean-isomount show-isomount
# SCRIPTS     := $(addsuffix -gui, $(SCRIPTS))
SCRIPTS     := $(SCRIPTS) dfh
BIN_DIR     := $(ROOT)/usr/local/bin
MAN_DIR     := $(ROOT)/usr/share/man/man1
DESKTOP_DIR := $(ROOT)/usr/share/applications/antix
ALL_DIRS    := $(BIN_DIR) $(MAN_DIR) $(DESKTOP_DIR)
CP_OPTS     := --no-dereference --preserve=mode,links

.PHONY: 	help all scripts man-pags

help:
	@echo "make help                 show this help"
	@echo "make install              install to current directory"
	@echo "sudo make install ROOT=   install to /"
	@echo
	@echo "If the ROOT directory does not exist then we won't install"

install: scripts man-pages desktop_files
scripts: | $(BIN_DIR)
	cp $(CP_OPTS) $(SCRIPTS) $(BIN_DIR)

man-pages: | $(MAN_DIR)
	cp $(CP_OPTS) man/* $(MAN_DIR)

desktop_files: | $(DESKTOP_DIR)
	cp $(CP_OPTS) desktop/*.desktop $(DESKTOP_DIR)

$(ALL_DIRS):
	test -d $(ROOT)/
	mkdir -p $@
