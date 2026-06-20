# # syntax highlighting colors
# set -g fish_color_normal cdd6f4
# set -g fish_color_command 89b4fa
# set -g fish_color_param f2cdcd
# set -g fish_color_keyword cba6f7
# set -g fish_color_quote a6e3a1
# set -g fish_color_redirection f5c2e7
# set -g fish_color_end fab387
# set -g fish_color_comment 7f849c
# set -g fish_color_error f38ba8
# set -g fish_color_gray 6c7086
# set -g fish_color_selection --background=313244
# set -g fish_color_search_match --background=313244
# set -g fish_color_option a6e3a1
# set -g fish_color_operator f5c2e7
# set -g fish_color_escape eba0ac
# set -g fish_color_autosuggestion 6c7086
# set -g fish_color_cancel f38ba8
#
#
# # completion pager colors
# set -g fish_pager_color_progress 6c7086
# set -g fish_pager_color_prefix 89b4fa
# set -g fish_pager_color_completion cdd6f4
# set -g fish_pager_color_description 6c7086


# history
set -g fish_history "main"


# shell integrations
starship init fish | source
zoxide init fish | source
fzf --fish | source


# aliases
alias d "doas"
alias dn "doas nvim"
alias pmi "doas pacman -S"
alias pmu "doas pacman -Syu"
alias pmr "doas pacman -R"

alias cd "z"
alias ci "zi"
alias ls "eza --color --icons --group-directories-first --no-quotes"
alias ll "eza -la --group-directories-first --color --icons --git --no-filesize --time-style \"+%d %b %Y\" --no-quotes"
alias cat "bat --theme gruvbox-dark --color always --style full"
alias hs "history | rg"
# alias n "nvim"
alias n "NVIM_APPNAME=nvim-pack nvim"
alias c "clear"

# RUST
alias cr "cargo run --release"
alias cb "cargo build --release"
alias ct "cargo test --release"


# environment variables
# set -gx TERM "xterm-256color"
set -gx LC_ALL "en_US.UTF-8"
# set -gx LC_TIME "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"
# set -gx FZF_DEFAULT_OPTS "--style full --smart-case --preview \"bat --wrap never --theme catppuccin --color always --number {}\" --reverse --no-info --prompt= --ghost= -1 -0 --color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --color=border:#6c7086,label:#cdd6f4"
# set -gx FZF_DEFAULT_OPTS "--color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#89b4fa,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --color=border:#6c7086,label:#89b4fa"
set -gx FZF_DEFAULT_OPTS ""
set -gx _ZO_FZF_OPTS "--style full --smart-case --no-separator --height 50% --reverse --no-info --prompt= --ghost= -1 -0 --color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --color=border:#6c7086,label:#cdd6f4"


# fetches
source ~/.config/fastfetch/fetches.fish


# greeting
set -gx fish_greeting


# autostart window manager
if test -z "$DISPLAY" ; and test (tty) = "/dev/tty1"
  exec start-hyprland > ~/.hyprland.log 2>&1
end
