HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000

setopt nobeep
setopt autocd
setopt histignorealldups
setopt histverify
setopt histfindnodups
setopt histsavenodups
setopt sharehistory


#vi or emac-style? v = vim, e = emac
bindkey -v

#case-ins, partial word, then substring
zstyle ':completion:*' matcher-list 'm:{a-z-}={A-Z_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#match approximate
zstyle ':completion:*' completer _complete _match _approximate

zstyle :compinstall filename '/home/cz/.zshrc'

autoload -Uz compinit zcalc
compinit

setopt completealiases

#!! = !, ! = current history event number
setopt promptbang

#prompt substitution
setopt promptsubst

#only show matching history entries
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload -U promptinit
promptinit

autoload -U colors && colors

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
science=/extra/Collected\ Media\ on\ Subjects\ of\ Interest/Science
: ~writing ~books ~music ~downloads ~torrents ~science

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi

#update display to wherever terminal is
gpg-connect-agent updatestartuptty /bye &> /dev/null
