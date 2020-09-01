# linux-sh-installer
An installer for shell scripts into linux.

For an example of usage:
Check out my q repository!

This is based on the install.sh file in the q repository.

It is made to work with any file.

# Installation:

Make sure you are a user with sudo permissions.

type ``./installer.sh installer`` to make the installer install itself.

# Usage:

Type ``installsh [SCRIPT]`` to install that shell script.

Make sure that SCRIPT is not SCRIPT.sh, but just the prefix. 

It will make a .[SCRIPT] directory in your home folder and add the .sh file. It will also add any files in any [SCRIPT].d directory, excluding files that contain '.tmp'.

It will also add a few lines of code in the bashrc to make the script in .SCRIPT to run every time bash starts.

# Example:

``cd`` to the example directory and type ``../installer.sh example``.  It will rerun the bashrc. Once it is done, type test. It should output "This is a test."

Check the file in ~/.example/log.txt 

It should have some text in it.

Also, feel free to look at any of the code in the example folder. 
