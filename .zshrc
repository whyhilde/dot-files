# base
# install packages: zsh oh-my-zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"


# theme
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# plugins
# install packages: git tldr thefuck zsh-autosuggestions zsh-syntax-highlighting
plugins=(
  git
  tldr
  thefuck
  zsh-autosuggestions
  zsh-syntax-highlighting
)


# history
HISTFILE=$HOME/.zhistory
HISTSIZE=2500
SAVEHIST=2500
HISTFILESIZE=2500
setopt appendhistory
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history


# start up
cd ~


# evals
# install packages: zoxide fzf
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


# functions
# install packages: eza
function cd() {
  if [[ $# -eq 0 ]]; then
    builtin cd ~
  elif [[ "$1" == "-" ]]; then
    local dir=$(find . -type d -not -path '*/\.*' 2>/dev/null | fzf --no-info --no-separator --height 40% --preview 'eza -a --group-directories-first --color=always --icons=always {}')
    [[ -n "$dir" ]] && builtin cd "$dir"
  else 
    z "$@"
  fi
}
function ls() { eza --tree --level=2 --git --color=always --icons=always }


# aliases
# install packages: bat ripgrep neovim btop neofetch 
alias lla="eza -lha --group-directories-first --color=always --icons=always --git --time-style='+%H:%M %d-%m-%Y' --no-symlinks"
alias cat="bat --theme=catppuccin-mocha --color=always --number --line-range=:50"
alias fzf="fzf --style=full --smart-case --preview 'bat --wrap=never --theme=catppuccin-mocha --color=always --number {}' --reverse --no-info --prompt='➜ ' --ghost='choose' -1 -0 --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#6C7086,label:#CDD6F4"
alias grep="rg -n"
alias n="nvim" 
alias b="btop"
alias nf="neofetch"
alias c="clear"


source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
