export PATH=$PATH:$HOME/bin
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL="$LANG"
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi
export GPG_TTY=$(tty)
