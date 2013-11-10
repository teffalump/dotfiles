HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
DIRSTACKSIZE=20

setopt nobeep
setopt autocd
setopt histignorealldups
setopt histverify
setopt histfindnodups
setopt histsavenodups
setopt sharehistory
setopt autopushd
setopt pushdsilent
setopt pushdtohome
setopt pushdignoredups
setopt pushdminus
setopt completealiases
setopt promptbang
setopt promptsubst

#vi or emac-style? v = vim, e = emac
bindkey -v

#menu completion
zstyle ':completion:*' menu select

#case-ins, partial word, then substring
zstyle ':completion:*' matcher-list 'm:{a-z-}={A-Z_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#cache, to speed up
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#match approximate and mistyped
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#ignore completion functions for uninstalled commands
zstyle ':completion:*:functions' ignored-patterns '_*'

#completed process ids with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

#remove trailing slash
zstyle ':completion:*' squeeze-slashes true

zstyle :compinstall filename '/home/cz/.zshrc'

autoload -Uz compinit zcalc
compinit

#only show matching history entries
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#glob history searching
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

autoload -U promptinit
promptinit

autoload -U colors
colors

# Alias definitions
if [[ -r ~/.zsh_aliases ]]; then
    . ~/.zsh_aliases
fi

# Function definitions
if [[ -r ~/.zsh_functions ]]; then
    . ~/.zsh_functions
fi

#prompt
#left prompt
PROMPT=$'\n%{$fg[red]%}%(0?..!!)%{$fg[yellow]%}[!] %{$fg[green]%}%n@%m %{$fg[white]%}%j %{$fg[blue]%}$(current_branch) %{$fg[cyan]%}%~\n%{$fg[green]%}%(!.#.$) '

#right prompt
#RPROMPT=' '

#zsh named dirs
music=/extra/Music
writing=~/Writing
books=~/Books
torrents=~/Downloads/torrents
downloads=~/Downloads/
media=/extra/Collected\ Media\ on\ Subjects\ of\ Interest
: ~writing ~books ~music ~downloads ~torrents ~media

# GPG stuff
if [[ -r ~/.gpg-agent-info ]]; then
  . ~/.gpg-agent-info
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi

#update display to wherever terminal is and suppress output
gpg-connect-agent updatestartuptty /bye &> /dev/null
