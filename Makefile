SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo 'Usage:'
	@echo '   make all'
	@echo '   make install_bash'


all: install_bash install_vim


install_bash: install_bash
	ln -sf `pwd`/bashrc ~/.bashrc
	ln -sf `pwd`/bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash_functions ~/.bash_functions
	ln -sf `pwd`/bash_profile ~/.bash_profile
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/minttyrc.conf ~/.minttyrc.conf

install_vim:
	ln -sf `pwd`/vimrc ~/.vimrc

