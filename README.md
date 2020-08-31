# linux-sh-installer
An installer for shell scripts into linux.

For an example of usage:
Check out my q repository!

This is based on the install.sh file in the q repository.

Usage:

Type ``./installer.sh [SCRIPT]`` to install it.

Make sure that SCRIPT is not SCRIPT.sh, but just the prefix. 

It will make a .[SCRIPT] directory in your home folder and add the .sh file. It will also add any files in any [SCRIPT].d directory, excluding files that contain '.tmp'.

It will also add a few lines of code in the bashrc to make the script in .SCRIPT to run every time bash starts.