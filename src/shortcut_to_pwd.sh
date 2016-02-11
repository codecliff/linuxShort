# !/bin/bash

# Windows Like Direcory Shortcuts for Linux Desktop
# Basically, a useful launcher creator
# With this , if we navigate one level up,
# Pros- We go up from the original (Physiscal) directory, not the current location(Logical)
# Deleteing the shortcut does not delete the orignal file 
# Cons- you can't drag-drop a file on the lanuncher itself

# Generates dektop launcher instead of symlink 
# To be used with Desktop Envireonmnet and file Manamger like Nautilus or Thunar

# Use gvfs-info shortcut_name for more info regarding generated launcer

# (C) Rahul Singh https://github.com/codecliff/linuxShort 2016
# License: Released under The MIT License (MIT)



mkShortcut(){


    if [[ $#>0 ]] && [ $1 != "D" ];then 
        echo  "usage:(1) mkShortcut "
	echo  "usage:(2) mkShortcut D "
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



    # echo "userhome" $userHome
    # echo $dirName

    #String values for Launcher
    fname=$dirName"_shortcut"
    outFile=$fname

    if [[ $#>0 ]] && [ $1 = "D" ]; then       
	outFile=$userHome"/Desktop/"$fname
    fi 
    
    targetfolder=$curDir
    comment="shortcut to " $curDir


    
    # Create a  Launcher File with these contents
    # xdg-open opens a file or URL in the user's preferred application

    # Important- Keep this left justified 	
cat > $outFile".desktop" <<myEOF
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
    if [ -f $outFile".desktop" ]
    then
    	chmod a+rwx $outFile".desktop"
    else
    	echo "Error creating file!" 1>&2
    	return 1
    

    echo "Created shortcut  " $outFile".desktop"
    echo "pointing to " $curDir

} # end function
