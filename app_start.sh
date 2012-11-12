# Ajouter ici les applications a lancer au demarrage
# (Equivalent .Xsession)
# pgrep permet de verifier si l'application est deja en cours

pgrep -u $USER -x conky || ($HOME/.conky/start-conky-proc.sh &)
pgrep -u $USER -x urxvtd || (urxvtd -q -o -f &)
pgrep -u $USER -f compton || (compton -cC -fF -G -m 0.9  &) # composition
pgrep -u $USER -f "urxvt_session" || urxvt -pe default -title urxvt_session &
pgrep -u $USER -f "urxvt_weechat-curses" || urxvt -pe default -title urxvt_weechat-curses -e weechat-curses &
pgrep -u $USER -f "chromium-browser" || (chromium-browser &)
#emacs --daemon
