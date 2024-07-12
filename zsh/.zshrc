# Priortize System Defaults ---  
export PATH=/usr/bin:/bin:/usr/local/bin:$HOME/bin:$PATH


# Environment Variables for zsh 
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zsh_history" 

source $HOME/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
#
# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/.zsh_functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/joeyv/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/joeyv/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/joeyv/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/joeyv/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set environment variables for locating headers, libraries, and pkg-config files
# in the Miniconda installation. This includes directories for various development
# dependencies such as OpenSSL, zlib, and other libraries installed through Miniconda.
export CFLAGS="-I/home/joeyv/miniconda3/include"
export LDFLAGS="-L/home/joeyv/miniconda3/lib"
export PKG_CONFIG_PATH="/home/joeyv/miniconda3/lib/pkgconfig"

# ------------ CUDA ----------------------
export PATH="/usr/local/cuda-11.8/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.8/lib64"

# -------Library Paths for C -------------
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib:/usr/lib64:/usr/local/lib:/lib"

# --------------- Rust -------------------
export PATH="$HOME/.cargo/bin:$HOME/.rustup/toolchains:$HOME/.cargo:$HOME/.rustup:$HOME/.cargo/env:$PATH"

# -------------- Golang ------------------
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Startup
# autoload -U compinit && compinit

# Setting NeoVim as the default editor
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'

# zsh-syntax-highlighting
# source /home/joeyv/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugins for oh-my-zsh
# plugins=(zsh-nvm zsh-autosuggestions colored-man-pages)


# Setting the PATH for the manual
if [ -z "${MANPATH}" ]; then
    MANPATH=$(manpath)
fi

# LaTex TexLive
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export TEXINPUTS=$TEXINPUTS:/usr/share/texmf/tex/latex/beamer/base/themes

# -- TLDR manual PATH --
export TLDR_CACHE_DIR="$HOME/.tldr"

# -- Navi --
export NAVI_CONFIG=~/.config/navi/config.yaml

# -- fzf configuration --
export FZF_DEFAULT_OPTS="--multi --preview 'batcat --color=always --style=header,grid --line-range :500 {}'"

# Add all ~/opt sub-directories to the PATH
for dir in "$HOME"/opt/*; do
    if [ -d "$dir" ] && [ -x "$dir" ]; then
        export PATH="$dir:$PATH"
    fi
done

# -- Add ~/opt to PATH -- 
export PATH="$HOME/opt:$PATH"

# -- GCM Credentials --
export GCM_CREDENTIAL_STORE=gpg
export GCM_CREDENTIAL_STORE=cache

# -- DBeaaver PATH variable --
export PATH="/var/lib/flatpak/app/io.dbeaver.DBeaverCommunity/current/active/files/dbeaver:$PATH"

# -- zsh Functions --
fpath+=${ZDOTDIR:-~}/.zsh_functions

# -- Node version manager nvm --
# export NVM_DIR="$HOME/.nvm" 
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# -- NPM - Node Package Manager golbal install PATH and node version PATH -- 
# export PATH=~/.npm-global/bin:$PATH
# export PATH="$NVM_DIR/versions/node/$(nvm current)/bin:$PATH"

# ---------- History Configuration ----------------
# -- Number of commands to remember in the command history for the current session --
export HISTSIZE=100000

# -- Number of commands to save in the history file --
export SAVEHIST=100000

# -- fzf --
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -- Loading oh-my-zsh --
# source $ZSH/oh-my-zsh.sh

# -- zsh-syntax-highlighting --
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------- Shell alias --------------
alias gcolor3='flatpak run nl.hjdskes.gcolor3'
alias ls='eza --icons -F -H --group-directories-first --git'
alias tree='eza -T --icons'
alias cat='batcat'
alias glow='glow -p -w 80'
alias trash='trash-put'
alias opentrash='nautilus trash://'
alias mc='LD_PRELOAD=/usr/local/lib/libtrash.so.3.7.0 mc'
alias code-update='sudo chown -R joeyv:root /usr/share/code/resources/app/out'
alias highlight-pointer='~/opt/bin/highlight-pointer -c orange -r 10 --auto-hide-highlight'
alias fzf-vim='vim $(fzf)'
alias firefox-dev='~/.local/share/umake/web/firefox-dev/firefox'
alias grep='grep -i -n -C 3 --color=auto'
alias zshrc='nvim ~/.dotfiles/zsh/.zshrc'
alias yz='yazi'
alias rust-link='export PATH=$(echo $PATH | tr ':' '\n' | grep -v 'miniconda' | tr '\n' ':')'


# Go up directories
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias '......'='cd ../../../../..'

# Go to root and home
alias /='cd /'
alias ~='cd ~'

# Better mkdir & cd 
mkcd() { 
  mkdir -p "$1"&& cd "$1"
}

# Quick access to specific directories
alias home='cd ~'
alias docs='cd ~/Documents'
alias dwn='cd ~/Downloads'
alias ds='cd ~/data_science/'
alias dev='cd ~/web_dev/' # Assuming you have a dev directory
alias .nvim='cd ~/.dotfiles/nvim/.config/nvim/lua/plugins/'
alias .dot='cd ~/.dotfiles'

# Enhanced directory listing
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# -- Zoxide init for zsh --
eval "$(zoxide init zsh)"

# -- Startship command promt --
eval "$(starship init zsh)"

# -- Display fastfetch on shell launch --
fastfetch
