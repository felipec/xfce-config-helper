prefix := $(HOME)/.local
bindir := $(prefix)/bin
sharedir := $(prefix)/share/xfconf-helper

all:

D = $(DESTDIR)

install:
	install -d -m 755 $(D)$(bindir)/
	install -m 755 load $(D)$(bindir)/xfconf-load
	install -m 755 dump $(D)$(bindir)/xfconf-dump
	install -d -m 755 $(D)$(sharedir)/
	install -m 644 defaults.yml $(D)$(sharedir)/defaults.yml

.PHONY: all install
