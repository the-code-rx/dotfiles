export ZSH="$HOME/.oh-my-zsh"
# Path to your oh-my-zsh installation.
# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="powerlevel10k/powerlevel10k"

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------- conda initialize -------------------
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
#  --------------- conda initialize ----------------

# ------------ CUDA ----------------------
export PATH="/usr/local/cuda-11.8/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH"

# --------------- Rust -------------------
export PATH="/home/joeyv/.cargo/bin:$PATH"
export PATH="/home/joeyv/.rustup/toolchains:$PATH"
export PATH="/home/joeyv/.cargo:$PATH"
export PATH="/home/joeyv/.rustup:$PATH"
export PATH="/home/joeyv/.cargo/env:$PATH"

# Startup  
autoload -U compinit && compinit
plugins=(zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)


# Lunar vim default editor
export EDITOR="lvim"


source /home/joeyv/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -z "${MANPATH}" ]; then
    MANPATH=$(manpath)
fi
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:${MANPATH}"

INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info/{INFOPATH}"

# # LaTex
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"


# TLDR
export TLDR_CACHE_DIR="$HOME/.tldr"

# Navi
export NAVI_CONFIG=~/.config/navi/config.yaml

# ~/Opt executables
export PATH=~/opt:$PATH

# # fzf Key Bindings
if [[ ! -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -o /usr/share/doc/fzf/examples/completion.zsh
sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -o /usr/share/doc/fzf/examples/key-bindings.zsh
fi

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS="--multi --preview 'batcat --color=always --style=header,grid --line-range :500 {}'"

#Latest Vim
export PATH=$HOME/opt/nvim/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GCM_CREDENTIAL_STORE=gpg
export GCM_CREDENTIAL_STORE=cache

export PATH="/var/lib/flatpak/app/io.dbeaver.DBeaverCommunity/current/active/files/dbeaver:$PATH"
export TEXINPUTS=$TEXINPUTS:/usr/share/texmf/tex/latex/beamer/base/themes
fpath+=${ZDOTDIR:-~}/.zsh_functions

export NVM_DIR="$HOME/.nvm" # Node version manager nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH=/var/lib/flatpak/app/io.dbeaver.DBeaverCommunity/current/active/files/dbeaver:/home/joeyv/opt/nvim/bin:/home/joeyv/bin:/usr/local/texlive/2023/bin/x86_64-linux:/home/joeyv/.cargo/env:/home/joeyv/.rustup:/home/joeyv/.cargo:/home/joeyv/.rustup/toolchains:/home/joeyv/.cargo/bin:/usr/local/cuda-11.8/bin:/home/joeyv/.nvm/versions/node/v22.2.0/bin:/var/lib/flatpak/app/io.dbeaver.DBeaverCommunity/current/active/files/dbeaver:/home/joeyv/opt/nvim/bin:/home/joeyv/bin:/usr/local/texlive/2023/bin/x86_64-linux:/home/joeyv/.cargo/env:/home/joeyv/.rustup:/home/joeyv/.cargo:/home/joeyv/.rustup/toolchains:/home/joeyv/.cargo/bin:/usr/local/cuda-11.8/bin:/home/joeyv/miniconda3/bin:/home/joeyv/miniconda3/condabin:/home/joeyv/.local/bin:/home/joeyv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/joeyv/.local/share/nvim/site/pack/packer/start/fzf/bin:~/.config/rofi/scripts

# REAPER
export PATH=~/opt/REAPER:$PATH

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
alias mendeley='~/opt/mendeley-reference-manager-2.107.0-x86_64.AppImage'
alias code-update='sudo chown -R joeyv:joevy /usr/share/code/resources/app/out'
alias highlighter='~/opt/highlight-pointer -c orange -r 30 --auto-hide-highlight'
alias fzf-vim='lvim $(fzf)'

bindkey -v
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
fastfetch
