# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Start uwsm session manager if appropriate
if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_SPACE         # Don't record commands starting with space
setopt SHARE_HISTORY             # Share history between sessions
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Better directory navigation
setopt AUTO_CD                   # cd by typing directory name
setopt AUTO_PUSHD                # Push directories onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jscyril/.zshrc'

autoload -Uz compinit
# Run compinit with security checks once a day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# ${ZDOTDIR:-~}/.zshrc

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/usr/share/zsh-antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh


# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias extDrive="cd /mnt/data"
alias clg="cd /mnt/data/college/"
alias win="cd /mnt/windows/"

# Enhanced ls with eza
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias la="eza -A --icons --group-directories-first"
alias l="eza --icons --group-directories-first"
alias lt="eza --tree --icons --level=2"

# Better cat with bat
alias cat="bat --style=auto"

# Lazygit
alias lg="lazygit"

# Shell management
alias zshrc="\$EDITOR ~/.zshrc"
alias szsh="source ~/.zshrc"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# Tool initialization
[[ -x $(command -v fzf) ]] && source <(fzf --zsh)
[[ -x $(command -v zoxide) ]] && eval "$(zoxide init zsh)"
[[ -x $(command -v thefuck) ]] && eval $(thefuck --alias)
[[ -x $(command -v atuin) ]] && eval "$(atuin init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm (lazy)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --line-range :50 $realpath 2>/dev/null || ls --color $realpath 2>/dev/null'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
alias fetch="fastfetch"
