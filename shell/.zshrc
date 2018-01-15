# ------------------------------------------------------------------------------
# dotfiles/shell/.zshrc
# ------------------------------------------------------------------------------

source $ZDOTDIR/shellrc

autoload -U colors
colors
if ! declare -f compinit > /dev/null 2>&1; then
  autoload -U compinit
  compinit -u
fi

export HISTFILE=~/.zsh_history
export DIRESTACKSIZE=100

local user="%F{173}%n@%m%f"
local cdir="%F{242}%~%f"
local multi_line="%F{226}%_%f"
local mark="%#"

export PROMPT="
$user $cdir
$mark "
export PROMPT2="$multi_line $mark "


zstyle ':completion:*' list-colors $LS_COLORS

setopt share_history        
setopt hist_ignore_dups
setopt nolistbeep
setopt list_packed
setopt auto_pushd
setopt pushdignoredups

bindkey -v
bindkey -M viins '' backward-char
bindkey -M viins '' forward-char
bindkey -M vicmd ' h' beginning-of-line
bindkey -M vicmd ' l' end-of-line

# Historical backward/forward search with linehead string binded to Ctrl-P/N.
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end
bindkey "" history-beginning-search-backward-end
bindkey "" history-beginning-search-forward-end

[ -f ~/.shellrc_local ] && source ~/.shellrc_local