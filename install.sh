#!/bin/zsh


# auto setup prezto
if [[ ! -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    chsh -s /bin/zsh
fi

# setup zsh
cd ~/.zprezto/runcoms
ln -sf ./zsh/* ./

# setup tmux
if [ ! -e ~/.tmux ]; then
    mkdir -p ~/.tmux/plugins
    ln -sf ./tmux/.tmux.conf ~/.tmux.conf
    ln -sf ./tmux/plugins ~/.tmux/plugins
fi

# setup neovim
if [ ! -e ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim/
fi
if [ ! -e ~/.cache ]; then
    mkdir -p ~/.cache
fi
cd ~/.config/nvim
ln -sf ./nvim/* ./
