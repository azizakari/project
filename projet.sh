#!/bin/bash
listap()
{
int=$( zenity --entry --title "ARGUMENT" --text "donner le nom de votre interface reseau:") 
sudo iwlist $int scan
}
-lsort()
{
int=$( zenity --entry --title "ARGUMENT" --text "donner le nom de votre interface reseau:") 

sudo iwlist $int scan | grep Frequency | sort | uniq -c |sort -n

}
-de()
{
sudo stop NetworkManager
}


-help(){
zenity --text-info --width="1000" --height="400" --text=cat < aziz.txt
}

menu(){
choix=0
if [[ $# -eq 0 ]] ; then
while (( $choix !='6' ))
do
	clear
	echo  "1 -Lister les differents d'acces wifi "
	echo  "2 -lister les points d'acces wifi par ordre decroissant d'intensité de signal "
	echo  "3 -desactiver le service NetworkManager"
	echo  "4 -configurer manuellement l'acces a un point d'acces qui doit figurer dans la liste precedante "
	echo  "5 -afficher le help"
	echo "votre choix"
	read choix
	case $choix in

		1) listap
			read
			;;
		2) -lsort
			read
			;;
		3) -de
			read
			;;

		5) -help 
			break
			;;
		bye)
		echo "Quitter"
		break
		;;
	esac
done
fi
if [[ $1 = listap ]]; then
	listap
fi
if [[ $1 = -lsort ]]; then
	-lsort
fi
if [[ $1 = -de ]]; then
	-de
fi

if [[ $1 = -help ]]; then
	-help
fi
}

menu$1
