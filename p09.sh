#!/bin/bash

check_root ()
{
	if  [ "$(id -u)" != "0" ]; then
	echo "Executa aquest script com a root."
	exit 2
	fi
}

check_dir ()
{
	clear
	zenity --title="dir" --entry --text "Escull el fitxer que vulguis de /etc" --entry-text="Escriu aqui... "
	cp /etc/$dir /etc/$dir.orig
	tar -czvf $dir.tar.gz /etc/$dir
	ls /etc | grep $dir
	torna_intentar
}

torna_intentar ()
{
	zenity --warning --text "Vols tornar a intentar?"

	case $? in

	0)
	check_dir
	;;

	!0)
	echo "Fins aviat"
	;;
	esac
}

check_root
check_dir

exit 0
