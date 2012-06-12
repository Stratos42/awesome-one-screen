pgrep -u $USER -x conky || (/home/france_a/.conky/start-conky-proc.sh &)
pgrep -u $USER -x urxvtd || (urxvtd -q -o -f &)
pgrep -u $USER -x xcompmgr || (xcompmgr -f -F -D 6 &)
#emacs --daemon