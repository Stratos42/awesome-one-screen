Awesome configuration
===============

- - -

Ce repos contient tous les elements necessaire pour awesome (un seul ecran).

Version Dark style par Aurélien Frances (Stratos)

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
	ou
	git clone https://github.com/Stratos42/awesome-one-screen.git awesome

      en replacant login par votre identifiant si necessaire.
      (Anonyme autorise pour le clone)

    - renommer le depot deja clone en ~/.config/awesome

Lancez ou relancez awesome (par defaut 'Ctrl-Shift R')

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

### Mail widget

Le widget mail fonctionne avec le script imap.py qui se trouve dans le repertoire clone
- Copiez le script dans le repertoire ~/scripts/ (creez le si besoin)
- Ouvrez le script avec votre editeur et indiquez vos identifiants de connexion.
- Si vous possedez plusieurs compte IMAP (Gmail + Mail personnel) decommentez les lignes
- Dans rc.lua, a la ligne 243, modifiez le format selon le nombre de compte imap que vous possedez

- - -

Pour tout bugs, remarques, etc. Vous pouvez me contacter a
stratos@aufrinfo.net
