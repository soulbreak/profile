SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo 'Usage:'
	@echo '   make all'
	@echo '   make install_bash'


all: install_bash install_vim install_tmux install_xconfig install_nvim install_gitconfig


install_bash: 
	ln -sf `pwd`/bashrc ~/.bashrc
	ln -sf `pwd`/bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash_functions ~/.bash_functions
	ln -sf `pwd`/bash_profile ~/.bash_profile
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/minttyrc ~/.minttyrc

install_vim:
	ln -sf `pwd`/vimrc ~/.vimrc


install_tmux:
	ln -sf `pwd`/tmux-powerline/tmux-powerlinerc ~/.tmux-powerlinerc

install_xconfig:
	ln -sf `pwd`/X-config/Xresources ~/.Xresources
	ln -sf `pwd`/X-config/xinitrc ~/.xinitrc
	ln -sf `pwd`/X-config/Xdefaults ~/.Xdefaults

install_nvim: clean_nvim
	@echo Installing vundle for neovim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
	ln -sf `pwd`/nvimrc ~/.nvimrc
	ln -sf `pwd`/nvim   ~/.nvim

clean_nvim:
	rm -Rf ~/.nvimrc
	rm -Rf ~/.nvim

install_gitconfig:
	ln -sf `pwd`/gitconfig   ~/.gitconfig
