#!/bin/zsh

function run () {

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
if [ ! -e ~/.tmux ]; then
    mkdir -p ~/.tmux
fi
ln -sf ~/dotfiles/tmux/.tmux.conf ~/
ln -sfn ~/dotfiles/tmux/plugins ~/.tmux/plugins

# setup neovim
if [ ! -e ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim/
fi
if [ ! -e ~/.cache ]; then
    mkdir -p ~/.cache
fi
for file in ./nvim/*
do
    ln -sf $(pwd)/${file} ~/.config/
done

}


# output onfirmation message
echo "I will overwrite the existing dotfiles, but is it okay? [Y/n]"
read ANSWER

case $ANSWER in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) run;;
    * ) echo "Operation stopped";;
esac


