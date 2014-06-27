HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
DIRSTACKSIZE=20
DIRSTACKFILE=~/.zsh/zdirs

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

zstyle :compinstall filename '~/.zshrc'

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

#persistent DIRSTACK across sessions
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
#hook function
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

#prompt
#left prompt
PROMPT=$'\n%{$fg[red]%}%(0?..!!)%{$fg[yellow]%}[!] %{$fg[green]%}%n@%m %{$fg[blue]%}$(current_branch) %{$fg[cyan]%}%~\n%{$fg[green]%}%(!.#.$) '

#right prompt
#RPROMPT=' '

#zsh named dirs
writing=~/Writing
books=~/Books
torrents=~/Downloads/torrents
downloads=~/Downloads/
: ~writing ~books ~downloads ~torrents

# GPG/SSH stuff
if [[ -r ~/.keychain/$HOST-sh-gpg ]]; then
  . ~/.keychain/$HOST-sh-gpg
fi

# Editing files with sudo (use restricted vim)
export SUDO_EDITOR=rvim
