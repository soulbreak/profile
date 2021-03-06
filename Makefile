SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo 'Usage:'
	@echo '   make all'
	@echo '   make install_bash'


all: install_bash install_vim install_tmux install_xconfig install_nvim install_gitconfig install_fzf_histoy install_starship

install_starship:
	mkdir -p ~/workspace/bin
	sh -c "$$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir ~/workspace/bin
	mkdir -p ~/.config && starship print-config --default > `pwd`/starship.toml
	ln -sf `pwd`/starship.toml ~/.config/starship.toml



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
	ln -sf `pwd`/sshrc ~/.ssh/rc

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
	[ `pwd`/_gitconfig ] && ln -sf `pwd`/_gitconfig ~/.gitconfig

install_fzf_history:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
