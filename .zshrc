HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000

#vi or emac-style? v = vim, e = emac
bindkey -v

zstyle :compinstall filename '/home/cz/.zshrc'

autoload -Uz compinit
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
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Function definitions
if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

#prompt
#left prompt
PROMPT=$'\n%{$fg[red]%}%(0?..!!)%{$fg[yellow]%}[!] %{$fg[green]%}%n@%m %{$fg[white]%}%j %{$fg[blue]%}$(current_branch) %{$fg[cyan]%}%~\n%{$fg[green]%}%(!.#.$) '

#right prompt
#RPROMPT='%{\n%}%{$fg[green]%}%# '
