#! /bin/bash
dep="$1"
if [ "$dep" == 'uninstall' ]; then
echo -ne "Are you sure you want to install \033[94muninstall.sh\033[00m? [y/n]:"
read yn
if [ "$yn" == 'y' ]; then
echo "OK, installing uninstall.sh."
else
echo -ne "Then, would you like to uninstall $2? [y/n]:"
read yn
if [ "$yn" == 'y' ]; then
"$dep"="$2" 
"$2"=uninstall
fi
fi
elif [ "$1" == '' ]; then
echo "You didn't specify a shell script."
if [ "$(ls *.sh)" ]; then
echo "These shell scripts are available:"
ls *.sh
exit
else
echo -e "There are no shell scripts in your current directory, you need to make one.\a"
exit
fi
fi

if [ -f $dep.sh ]; then
echo -ne ''
else
    echo -e "The shell script you selected does not exist.\a"
    exit
fi
if [ "$2" == 'uninstall' ]; then
    if [ -d .$dep ]; then
        echo "Removing $dep..."
        rm -r ~/.$dep
    else
    echo -e "$dep is not installed, so not removed.\a"
    fi
    exit
else
    if [ -d .$dep ]; then
        fcon="$(cat ~/.$dep/$dep.sh)"
        tfcon="$(cat $dep.sh)"
        if [ "$tfcon" == "$fcon" ]; then
            echo -e "$dep is already the newest version.\a"
            exit
        else
            echo "$dep is installed, but not the most recent version."
            sleep 1s
            echo -n "Would you like to update $dep? [y/n]:"
            read udep
            if [ "$udep" == 'n' ]; then
                echo "Okay, $dep not updated."
                exit
            else
                echo "Reinstalling $dep..."
                rm -r ~/.$dep
                mkdir ~/.$dep
                cp $dep.sh ~/.$dep
                case $(ls) in
                    *$dep.d*)
                    cd $dep.d
                    cp * ~/.$dep
                    cd ..
                    ;;
                    *)
                    ;;
                esac
                fi
        fi
        else
        mkdir ~/.$dep
        cp $dep.sh ~/.dep
        if [ -d $dep.d ]; then
            cd $dep.d
            cp * ~/.$dep
            cd ..
            fi

        case $(ls ~/.$dep/) in
            *.tmp)
            echo "Temporary files $(ls ~/.$dep/*.tmp) deleted."
            rm ~/.$dep/*.tmp
            ;;
            *)
            echo "No temporary files in folder, so none removed."
            ;;
        esac
    cp $dep.sh ~/.$dep
    echo "$dep successfully installed.\a"
    fi
    sleep 1s
    if grep -q ". ~/.$dep/$dep.sh" ~/.bashrc; then
        echo "$dep is already installed in bashrc"
    else
        echo -e "if [ -d ~/.$dep ]; then\n. ~/.$dep/$dep.sh\nfi" >> ~/.bashrc
    fi
    echo "Running $dep through .bashrc..."
    bash
    . $dep.sh
    fi
fi
