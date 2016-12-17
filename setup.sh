#!/bin/zsh


run() {

    # auto setup prezto
    if [[ ! -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"



        setopt EXTENDED_GLOB
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
            ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done
    fi

    # setup zsh
    for file in ./zsh/*
    do
        ln -sf $(pwd)/${file} ~/.zprezto/runcoms/
    done

    # setup tmux
    if [ ! -e ~/.tmux/ ]; then
        mkdir -p ~/.tmux
    fi
    case ${OSTYPE} in
        darwin*)
            ln -sf ~/dotfiles/tmux/.tmux.conf.macos ~/.tmux.conf
            ;;
        linux*)
            ln -sf ~/dotfiles/tmux/.tmux.conf.linux ~/.tmux.conf
            ;;
    esac
    ln -sfn ~/dotfiles/tmux/plugins ~/.tmux/plugins

    # setup neovim
    if [ ! -e ~/.config/nvim/ ]; then
        mkdir -p ~/.config/nvim/
    fi
    if [ ! -e ~/.cache/ ]; then
        mkdir -p ~/.cache
    fi
    for file in ./nvim/*.toml
    do
        ln -sf $(pwd)/${file} ~/.config/nvim/
    done
    case ${OSTYPE} in
        darwin*)
            ln -sf ~/dotfiles/nvim/init.vim.macos ~/.config/nvim/init.vim
            ;;
        linux*)
            ln -sf ~/dotfiles/nvim/init.vim.linux ~/.config/nvim/init.vim
            ;;
    esac

}

# output onfirmation message
echo "I will overwrite the existing dotfiles, but is it okay? [Y/n]"
read ANSWER

case $ANSWER in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) run;;
    * ) echo "Operation stopped";;
esac
