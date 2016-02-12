# LinuxShort

## Synopsis
A simpler way to create desktop launchers for Directories. Desktop launchers are closest to windows Shortcut and do have some benefits over creating soft links in some cases. 

## Usage (Concise)

Terminal 

* `mkShortcut`  : Creates a shortcut to the present directory inside itself. Copy it to wherever needed. 
* `mkShortcut D` : Places a shortcut to present directory on the Desktop 

Source this script on startup so these commands are always available.
     
## Motivation

Soft links to directories create a secondary issue which is often a problem. The path for navigating these soft links is very different from the path for the original file. For instance, if you browse one level up from a soft link on Desktop, you will enter Desktop and not the hierarchy of directory your link is pointing to.
Desktop launchers solve this problem. 
And this script tries to make it as simple it can be to create a launcher pointing to a dictionary.   

## Installation And Usage

1. Download and save the file shortcut_to_pwd.sh, say, to directory ~/shorts/
2. Make the file executable 
       - `cd ~/shorts/`
       - `chmod +x shortcut_to_pwd.sh`
3. change to directory you want to create Shortcut for
      - `cd ~/dirA/dirB`
4. Source the script file        
      - `source  ~/shorts/shortcut_to_pwd.sh`
5. Create Shortcuts
     - `mkShortcut`  : Creates a shortcut to the present directory inside itself( ~/dirA/dirB ). Copy it to wherever needed. 
     - `mkShortcut D` : Places a shortcut to present directory (~/dirA/dirB) on the Desktop 
6. (Optional but Recommended) Source this script on startup so these commands are always available. Add this line to `.bashrc` :
    - `source  ~/shorts/shortcut_to_pwd.sh`


## Contributions

Feel free to fork and improve. 

Issue Tracker is here:  [Issues](/issues)


## License

This Software is released under the [MIT License](https://opensource.org/licenses/MIT) :

The MIT License (MIT)

Copyright (c) 2016 Rahul Singh

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
