#!/bin/zsh


run() {

    # setup zsh -----------------------------------------------------------------

    # auto install prezto
    if [[ ! -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
        setopt EXTENDED_GLOB
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
            ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done
    fi

    # zshrc
    for file in ~/dotfiles/zsh/common/*
    do
        ln -sf ${file} ~/.zprezto/runcoms/
    done

    case ${OSTYPE} in
        darwin*)
            for file in ~/dotfiles/zsh/mac/*
            do
                ln -sf ${file} ~/.zprezto/runcoms/
            done
            ;;
        linux*)
            for file in ~/dotfiles/zsh/linux/*
            do
                ln -sf ${file} ~/.zprezto/runcoms/
            done
            ;;
    esac
    # end -----------------------------------------------------------------------



    # setup tmux ----------------------------------------------------------------
    if [ ! -e ~/.tmux/ ]; then
        mkdir -p ~/.tmux
    fi
    ln -sf ~/dotfiles/tmux/.tmux.conf ~/
    ln -sfn ~/dotfiles/tmux/plugins ~/.tmux/plugins

    # case ${OSTYPE} in
    #     darwin*)
    #         ln -sf ~/dotfiles/tmux/.tmux.conf.macos ~/.tmux.conf
    #         ;;
    #     linux*)
    #         ln -sf ~/dotfiles/tmux/.tmux.conf.linux ~/.tmux.conf
    #         ;;
    # esac

    # end -----------------------------------------------------------------------



    # setup neovim --------------------------------------------------------------
    if [ ! -e ~/.config/nvim/ ]; then
        mkdir -p ~/.config/nvim/
    fi
    if [ ! -e ~/.cache/ ]; then
        mkdir -p ~/.cache
    fi
    for file in ~/dotfiles/nvim/*.toml
    do
        ln -sf ${file} ~/.config/nvim/
    done
    case ${OSTYPE} in
        darwin*)
            ln -sf ~/dotfiles/nvim/init.vim.macos ~/.config/nvim/init.vim
            ;;
        linux*)
            ln -sf ~/dotfiles/nvim/init.vim.linux ~/.config/nvim/init.vim
            ;;
    esac
    # end ---------------------------------------------------------------------

    # setup tern --------------------------------------------------------------
    ln -sf ~/dotfiles/.tern-config ~/
    # end ---------------------------------------------------------------------

}


# output confirmation message
echo "I will overwrite the existing dotfiles, but is it okay? [Y/n]"
read ANSWER

case $ANSWER in
    "Y" | "y" | "yes" | "Yes" | "YES" ) run;;
    * ) echo "Operation stopped";;
esac
