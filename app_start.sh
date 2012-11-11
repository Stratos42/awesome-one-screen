# Ajouter ici les applications a lancer au demarrage
# (Equivalent .Xsession)
# pgrep permet de verifier si l'application est deja en cours

pgrep -u $USER -x conky || ($HOME/.conky/start-conky-proc.sh &)
pgrep -u $USER -x urxvtd || (urxvtd -q -o -f &)
pgrep -u $USER -x xcompmgr || (xcompmgr -f -F -D 6 &) # composition
#emacs --daemon
