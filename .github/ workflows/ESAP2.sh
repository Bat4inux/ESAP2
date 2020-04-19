#!/bin/bash

if [ "$UID" -ne "0" ];then
	echo -e "\033[0;31m"
	echo -e "    Accès refusé !"
	echo -e "    Vous devez être connecté en tant que super Utilisateur (root) !"
	sleep 3
	clear
	echo -e "\033[0m"
	a=0
else
	a=1
fi

clear

while [ $a = 1 ]
do

	echo -e "\033[1;35m"
	echo -e "              ___________ ___    ____ ___  "
	echo -e "             / ____/ ___//   |  / __ \__ \ "
	echo -e "            / __/  \__ \/ /| | / /_/ /_/ / "
	echo -e "           / /___ ___/ / ___ |/ ____/ __/  "
	echo -e "          /_____//____/_/  |_/_/   /____/  "
	echo -e "\033[0m"



	echo -e "\033[0;32m"
	echo -e "     ________________________________________________________________ "
	echo -e "    |                                                                |"
	echo -e "    |      ESAP2 est un programme pour gérer le service Apache2      |"
	echo -e "    |                                                                |"
	echo -e "    |      Choissisez se que vous voulez faire avec Apache2          |"
	echo -e "    |                                                                |"
	echo -e "    |      1) Activer Apache2                                        |"
	echo -e "    |      2) Desactiver Apache2                                     |"
	echo -e "    |      3) Redémarer Apache2                                      |"
	echo -e "    |      4) Stopper Apache2                                        |"
	echo -e "    |      5) Réecriture d'URL                                       |"
	echo -e "    |      6) Gestion en-têtes des requêtes/réponses HTTP            |"
	echo -e "    |      7) Autoriser Apache2 à utiliser un site                   |"
	echo -e "    |      0) Sortir de ESAP2                                        |"
	echo -e "    |                                                                |"
	echo -e "    |                                               Bat4inux         |"
	echo -e "    |                                                                |"
	echo -e "    |________________________________________________________________|"


	echo ""
	read -p "    Vôtre choix => " choix
	echo ""

	case "$choix" in
		1 ) `systemctl start apache2`
			echo -e "    [ok]"
			sleep 4
		    a=1	
		;;
		2 ) `systemctl disable apache2`
			echo -e "    [ok]"
			sleep 4
			a=1	
		;;
		3 ) `systemctl restart apache2`
			echo -e "    [ok]"
			sleep 4
			a=1
		;;
		4 ) `systemctl stop apache2`
		    echo -e "    [ok]"
		    sleep 4
			a=1
		;;
		5) `a2enmod rewrite`
		   echo -e "    [ok]"
		   sleep 4
		   a=1
		;;
		6) `a2enmod headers`
		   echo -e "    [ok]"
		   sleep 4
		   a=1
		;;
		7) read -p "Nom du fichier.conf => " nomFichier
		   `a2ensite $nomFichier`
		   echo -e "    [ok]"
		   sleep 4
		   a=1
		;;
		0 ) a=0
			echo "    Au revoir"
			sleep 2
			clear
		;;
		* ) echo "    Mauvais choix"
			sleep 1.5
			clear
		;;
	esac
done
echo -e "\033[0m"
clear
exit
