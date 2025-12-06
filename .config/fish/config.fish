# syntax highlighting colors
set -g fish_color_normal cdd6f4
set -g fish_color_command 89b4fa
set -g fish_color_param f2cdcd
set -g fish_color_keyword cba6f7
set -g fish_color_quote a6e3a1
set -g fish_color_redirection f5c2e7
set -g fish_color_end fab387
set -g fish_color_comment 7f849c
set -g fish_color_error f38ba8
set -g fish_color_gray 6c7086
set -g fish_color_selection --background=313244
set -g fish_color_search_match --background=313244
set -g fish_color_option a6e3a1
set -g fish_color_operator f5c2e7
set -g fish_color_escape eba0ac
set -g fish_color_autosuggestion 6c7086
set -g fish_color_cancel f38ba8


# completion pager colors
set -g fish_pager_color_progress 6c7086
set -g fish_pager_color_prefix 89b4fa
set -g fish_pager_color_completion cdd6f4
set -g fish_pager_color_description 6c7086


# history
set -g fish_history "main"


# shell integrations
starship init fish | source
zoxide init fish | source
fzf --fish | source


# aliases
alias d "doas"
alias Ss "pacman -Ss"
alias S "doas pacman -S"
alias Syu "doas pacman -Syu"
alias R "doas pacman -R"
alias cd "z"
alias ci "zi"
alias ls "eza --tree --level=2 --color=always --icons=always"
alias ll "eza -la --group-directories-first --color=always --icons=always --git --no-filesize --time-style=\"+%d %b %Y\""
alias cat "bat --theme=catppuccin --color=always --style=full --line-range=:50"
alias hs "history | rg"
alias ff "fastfetch"
alias n "nvim"
alias c "clear"


# environment variables
set -gx TERM "xterm-256color"
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"
set -gx PATH "$PATH:$HOME/bin:$HOME/bin/visual"
set -gx FZF_DEFAULT_OPTS "--style=full --smart-case --preview \"bat --wrap=never --theme=catppuccin --color=always --number {}\" --reverse --no-info --prompt= --ghost=\"type something\" -1 -0 --color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --color=border:#6c7086,label:#cdd6f4"
set -gx _ZO_FZF_OPTS "--style=full --smart-case --no-separator --height 50% --reverse --no-info --prompt= --ghost=\"type something\" -1 -0 --color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --color=border:#6c7086,label:#cdd6f4"


# greeting
function fish_greeting
  set fish "$(set_color 89dceb)>$(set_color 74c7ec)<$(set_color 89b4fa)>"
  set text "$(set_color cdd6f4)Welcome to fish, the friendly interactive shell"
  echo "$fish $text"
end


# autostart window manager
if test -z "$DISPLAY" ; and test (tty) = "/dev/tty1"
  exec Hyprland > ~/.hyprland.log 2>&1
end
