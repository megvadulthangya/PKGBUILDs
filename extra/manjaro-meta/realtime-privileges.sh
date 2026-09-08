#!/bin/bash

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

add_users() {
    _l="/etc/login.defs"
    _p="/etc/passwd"
 
    ## get mini UID limit ##
    l=$(grep "^UID_MIN" $_l)
 
    ## get max UID limit ##
    l1=$(grep "^UID_MAX" $_l)
 
    ## use awk to print if UID >= $MIN and UID <= $MAX and shell is not /sbin/nologin   ##
    users=$(awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( $3 >= min && $3 <= max  && $7 != "/sbin/nologin" ) print $0 }' "$_p" | cut -d: -f1)
    for i in $users; do
        echo "Adding user '$i' to user-group 'realtime'"
        usermod -a -G realtime $i
    done
}

add_group() {
    getent group "realtime" &>/dev/null || groupadd -r realtime
    add_users
}

post_install() {
post_upgrade
}

post_upgrade() {
  add_group
  echo ""
  echo "Please add new users to 'realtime' group."
  echo "Reboot your system, so changes will take effect.."
  echo ""
}
