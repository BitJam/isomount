ROOT        := .

SHELL       := /bin/bash

SCRIPTS     := isomount isoumount sqmount squmount clean-isomount show-isomount
BIN_DIR     := $(ROOT)/usr/local/bin
MAN_DIR     := $(ROOT)/usr/share/man/man1
ALL_DIRS    := $(BIN_DIR)
CP_OPTS     := --no-dereference --preserve=mode,links
.PHONY: 
help:
	@echo "make help                 show this help"
	@echo "make install              install to current directory"
	@echo "sudo make install ROOT=   install to /"
	@echo
	@echo "If the ROOT directory does not exist then we won't install"

install: | $(BIN_DIR)
	cp $(CP_OPTS) $(SCRIPTS) $(BIN_DIR)

$(ALL_DIRS):
	test -d $(ROOT)/
	mkdir -p $@
