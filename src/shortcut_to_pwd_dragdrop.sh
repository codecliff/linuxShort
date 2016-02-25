# !/bin/bash

# Windows Like Direcory Shortcuts for Linux Desktop, with Drag and Drop copying
# This is enhanced version of mkShortcut function (in this project)
# Allows copying of files (and directories) to target directory by drag-dropping on shortcut icon
# If no file is dropped, simply opens the target directory as before

# Requires : Zenity (Gnome) 
# Requires : shortParser.sh (in this project) same directory as this file 

# Limitations: no overwriting 


# (C) Rahul Singh https://github.com/codecliff/linuxShort 2016
# License: Released under The MIT License (MIT)



mkShortcutDD(){


    if [[ $#>0 ]] && [ $1 != "D" ];then 
        echo  "usage:(1) mkShortcutDD "
	echo  "usage:(2) mkShortcutDD D "
        echo  "cd into a directory xyzDir"
	echo  "* call this function : mkShortcut  "
        echo  "This will create a new launcer file for your pwd xyzDir"
	echo  "Copy this launcher to wherever"
	echo  "* mkShortcut D places shortcut directly on the Desktop"

        return 1
    fi

    # Parent Directory

    curDir="$(pwd)"
    dirName="$(basename $(pwd))"
    userHome=~
    
    # http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in 
    # Dave Dopson 	
    sourceDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


    # echo "userhome" $userHome
    # echo $dirName

    #String values for Launcher
    fname=$dirName"_shortcut"
    outFile=$fname

    if [[ $#>0 ]] && [ $1 = "D" ]; then       
	outFile=$userHome"/Desktop/"$fname
    fi 
    
    targetfolder=$curDir
    GenericName="shortcut to " $curDir


    
    # Create a  Launcher File with these contents
    # xdg-open opens a file or URL in the user's preferred application

    # Important- Keep this left justified 	
cat > $outFile".desktop" <<myEOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=$sourceDir/shortParser.sh $targetfolder %f
Name=$fname
GenericName=$GenericName
Comment="Created With LinuxShort"
Icon=inode-directory-symbolic, inode-x-generic-symbolic, inode-directory, inode-x-generic
myEOF

    # Make launcher executable
    if [ -f $outFile".desktop" ]
    then
    	chmod a+rwx $outFile".desktop"
    else
    	echo "Error creating file!" 1>&2
    	return 1
    fi 		
    

    echo "Created shortcut  " $outFile".desktop"
    echo "pointing to " $curDir

} # end function



