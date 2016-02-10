# !/bin/bash

# Windows Like Direcory Shortcuts for Linux Desktop
# With this , if we navigate one level up,
# we go up from the original (Physiscal) directory, not the current location(Logical)

# Generates dektop launcher instead of symlink 
# To be used with Desktop Envireonmnet and file Manamger like Nautilus or Thunar

# Use gvfs-info shortcut_name for more info regarding generated launcer

# (C) Rahul Singh https://github.com/codecliff/linuxShort 2016
# License: Released under The MIT License (MIT)



mkShortcut(){

    if (( $# >0 )); then
        echo  "usage: mkShortcut"
        echo  "cd into a directory xyzDir and call this function : mkShortcut  "
        echo  "This will create a new launcer file for your pwd xyzDir"
	echo  "Copy this launcher to wherever"
        return 1
    fi

    # Parent Directory

    curDir="$(pwd)"
    dirName="$(basename $(pwd))"

    echo $curDir
    echo $dirName

    #String values for Launcher
    fname=$dirName"_shortcut"
    targetfolder=$curDir
    comment="shortcut to " $curDir

    
    # Create a  Launcher File with these contents
    # xdg-open opens a file or URL in the user's preferred application

    # Important- Keep this left justified 	
cat > $fname".desktop" << myEOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=xdg-open  $targetfolder
Name=$fname
Comment=$comment
Icon=inode-directory-symbolic, inode-x-generic-symbolic, inode-directory, inode-x-generic
myEOF

    # Make launcher executable
    if [ -f $fname".desktop" ]
    then
    	chmod a+rwx $fname".desktop"
    else
    	echo "Error creating file!"
    	exit 1
    fi

    echo "Created shortcut  " $fname".desktop"
    echo "pointing to " $curDir

} # end function
