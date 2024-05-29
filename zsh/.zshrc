# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ----------- Conda Initialize -------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/joeyv/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

# ------------ CUDA ----------------------
export PATH="/usr/local/cuda-11.8/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH"

# --------------- Rust -------------------
export PATH="/home/joeyv/.cargo/bin:$PATH"
export PATH="/home/joeyv/.rustup/toolchains:$PATH"
export PATH="/home/joeyv/.cargo:$PATH"
export PATH="/home/joeyv/.rustup:$PATH"
export PATH="/home/joeyv/.cargo/env:$PATH"

# -------------- Golang ------------------
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Startup  
autoload -U compinit && compinit
plugins=(zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)

# Setting Lunar vim as the default editor
export EDITOR="lvim"

# zsh-syntax-highlighting
source /home/joeyv/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setting the PATH for the manual
if [ -z "${MANPATH}" ]; then
    MANPATH=$(manpath)
fi

# LaTex TexLive
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info/{INFOPATH}"
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:${MANPATH}"
export TEXINPUTS=$TEXINPUTS:/usr/share/texmf/tex/latex/beamer/base/themes

# TLDR manual PATH
export TLDR_CACHE_DIR="$HOME/.tldr"

# Navi
export NAVI_CONFIG=~/.config/navi/config.yaml

# # fzf Key Bindings
if [[ ! -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -o /usr/share/doc/fzf/examples/completion.zsh
sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -o /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# fzf configuration
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS="--multi --preview 'batcat --color=always --style=header,grid --line-range :500 {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Add all ~/opt sub-directories to the PATH
for dir in "$HOME"/opt/*; do
    if [ -d "$dir" ] && [ -x "$dir" ]; then
        export PATH="$dir:$PATH"
    fi
done

# GCM Credentials
export GCM_CREDENTIAL_STORE=gpg
export GCM_CREDENTIAL_STORE=cache

# DBeaaver PATH variable
export PATH="/var/lib/flatpak/app/io.dbeaver.DBeaverCommunity/current/active/files/dbeaver:$PATH"

# zsh Functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Node version manager nvm
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------- History Configuration ----------------
# Number of commands to remember in the command history for the current session
HISTSIZE=10000

# Number of commands to save in the history file
SAVEHIST=20000

# fzf History search with execution
fzf_history() {
    local selected_command
    selected_command=$(history | fzf +s --tac | awk '{$1=""; print substr($0,2)}')
    if [ -n "$selected_command" ]; then
        eval "$selected_command"
    fi
}

# Loading oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -------- Shell alias --------------
alias gcolor3='flatpak run nl.hjdskes.gcolor3'
alias ls='exa --icons -F -H --group-directories-first'
alias tree='exa -T --icons'
alias cat='batcat'
alias trash='trash-put'
alias opentrash='nautilus trash://'
alias mc='LD_PRELOAD=/usr/local/lib/libtrash.so.3.7.0 mc'
alias hist='fzf_history'
alias vim='lvim'
alias code-update='sudo chown -R joeyv:root /usr/share/code/resources/app/out'
alias highlight-pointer='~/opt/bin/highlight-pointer -c orange -r 10 --auto-hide-highlight'
alias fzf-vim='lvim $(fzf)'

# Vim mode
bindkey -v

# Zoxide init and maping to cd
eval "$(zoxide init --cmd cd zsh)"

# Startship command promt
eval "$(starship init zsh)"

# Display fastfetch on shell launch
fastfetch
