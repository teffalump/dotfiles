#background color
xsetroot -solid black

#dvorak keymap
setxkbmap -layout dvorak

#reassign caps lock to control
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "clear Lock"
xmodmap -e "add Control = Control_L"

#source x config
xrdb -merge /home/cz/.Xresources

#use gpg-agent
eval $(gpg-agent --enable-ssh-support --daemon) &

#start i3
exec i3 
