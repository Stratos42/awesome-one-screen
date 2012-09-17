Awesome configuration
===============

- - -

Ce repos contient tous les elements necessaire pour awesome (un seul ecran).

Version 4.2 Dark style par Aurélien Frances (Stratos - aufrinfo.net)

- - -

Installation
------------

Pour utiliser cette configuration d'awesome, vous devez installer le paquet
Awesome-wm.

Ensuite, creez le dossier ~/.config/ s'il n'existe pas.

Une fois cree, vous avez le choix entre :

    - cloner directement le depot git dans le dossier
      ~/.config avec la commande suivante :

      # cd ~/.config &&
        git clone http://[<login>@]git.aufrinfo.net/git/awesome-one-screen.git awesome

      en replacant login par votre identifiant si necessaire.
      (Anonyme autorise pour le clone)

    - renommer le depot deja clone en ~/.config/awesome

Une fois installe, vous devez modifier le fichier rc.lua present dans le
dossier awesome.

Modifiez la ligne 24 :

	 USER            =       "login"

en remplacant 'login' par votre nom d'utilisateur (le meme que votre
repertoire home)


Relancez awesome (par defaut 'Ctrl-Shift R')

Configuration
-------------

### Theme

Par defaut, la configuration est delivre avec le theme dark. Le fichier theme.lua situe
dans ~/.config/awesome/themes/dark/ definit les couleur de l'environnement de travail.

Les variables couleurs sont definies dans le fichier color.lua en hexadecimal.

Les themes par defaut d'awesome restent a disposition dans /usr/share/awesome/themes/
pour changer de theme, modifier la ligne 27 du fichier rc.lua tel que:

     beautiful.init("/home/" .. USER .. "/.config/awesome/themes/dark/theme.lua")

devienne:

     beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")

en remplacant zenburn par le theme choisi.

- - -

### Widgets

Les widgets active par defaut proviennent de la lib vicious (fourni dans le depot)
http://git.sysphere.org/vicious/

Pour le widget Gmail (mailwidget) vous devez creer/modifier le fichier ~/.netrc
en y ajoutant la ligne :

     machine mail.google.com login <login gmail sans @gmail.com> password <pass gmail>

D'autres widgets sont disponibles dans le repertoire ~/.config/awesome/vicious/

- - -

Pour tout bugs, remarques, etc. Vous pouvez me contacter a
mailto:dev@aufrinfo.net
