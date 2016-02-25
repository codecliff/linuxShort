#!/bin/bash

# This file is required for mkShortcutDD function to work
# Must be in the same directory as the script with mkShortcutDD function 


# Requires : Zenity (Gnome) 

# Functionality: Copying files and directories, with a basic progress indicator
# Limitations: no overwriting 


# (C) Rahul Singh https://github.com/codecliff/linuxShort 2016
# License: Released under The MIT License (MIT)




# at least target directory must be given
if [[ "$#" -eq 0 ]] ;then
		exit 1;
fi
# if a file is given, copy it to target directory
if [[ "$#" -eq 2 ]] && [[ -d "$1" ]] && [[ -f "$2" ]];then
fname=$(basename "$2") ; 
(
echo "# Copying File..." ; sleep 1
	
	if [[ -f "$1/$fname" ]]; then
		 zenity --error --title="No Overwriting" --text="File already exists!" ;
	 else cp -n "$2" "$1" ;
	fi 

echo "# Done! " ; sleep 1

	) | zenity --progress --title="Copying File.." --pulsate --auto-close  ;
	 
# if a directory is given, copy it to target directory
elif [[ "$#" -eq 2 ]] && [[ -d "$1" ]] && [[ -d "$2" ]];then
fname=$(basename "$2") ; 
	
# Directory copy with progress Dialog 
      	(
echo "# Copying Directory.." ; sleep 1
if [[ -d "$1/$fname" ]]; then
		 zenity --error --title="No Overwriting" --text="Direcory already exists!" ;
	 else  cp -arn "$2" "$1" ;
	fi; 
echo "# Done! " ; sleep 1

	) | zenity --progress --title="Copying Files.."   --pulsate --auto-close  ;

# if only target directory given, open it in file browser
elif  [[ "$#" -eq 1 ]] &&  [[ -d "$1" ]];then
	# zenity --error --title=" Just opening browser " --text="$1";
	xdg-open  "$1" ;

fi


