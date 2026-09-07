#!/bin/bash

#Test if pacnew/pacsave are created and create the spy file
/usr/bin/test "$(/usr/bin/pacdiff -o)"

if [[ "$?" -eq "0" ]]; then
    last_user=$(last -w | head -1 | cut -d' ' -f1) 
    sudo -u $last_user /usr/bin/touch /tmp/pacnew-check.file
fi