# oh-my-zsh settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(
  git
  tldr
  thefuck
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


# history
HISTFILE=$HOME/.zhistory
HISTSIZE=5000
SAVEHIST=5000
HISTFILESIZE=5000
setopt appendhistory
setopt share_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt histexpiredupsfirst
setopt histsavenodups


# shell integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


# aliases
alias d="doas"
alias Ss="pacman -Ss"
alias S="doas pacman -S"
alias Syu="doas pacman -Syu"
alias R="doas pacman -R"

alias cd="z"
alias ci="zi"
alias ls="eza --tree --level=2 --git --color=always --icons=always"
alias ll="eza -lha --group-directories-first --color=always --icons=always --git --no-filesize --time-style='+%I:%M %p %d-%m-%y' --no-symlinks"
alias cat="bat --theme=catppuccin --color=always --style='full' --line-range=:50"

alias hs="history | rg"
alias top="btop"
alias ff="fastfetch"
alias n="nvim" 
alias c="clear"


# environment variables
export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="$PATH:$HOME/bin:$HOME/bin/visual"
export FZF_DEFAULT_OPTS="--style=full --smart-case --preview 'bat --wrap=never --theme=catppuccin --color=always --number {}' --reverse --no-info --prompt=' ' --ghost='type and search..' -1 -0 --color=spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#6C7086,label:#CDD6F4"
export _ZO_FZF_OPTS="--style=full --smart-case --no-separator --height 50% --reverse --no-info --prompt=' ' --ghost='type and search..' -1 -0 --color=spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#6C7086,label:#CDD6F4"
