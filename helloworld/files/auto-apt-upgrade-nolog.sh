#!/bin/bash

temp_logfile="apt-get-updates.temp.log"
logfile="apt-get-updates.log"

update_cmd="apt-get update"
list_updates_cmd="apt list --upgradeable"
install_cmd="apt-get -y upgrade"
auto_remove_cmd="apt -y autoremove"
separator="############################################"

cd ~
> $temp_logfile
echo "" ; echo $update_cmd ; echo $separator ; eval $update_cmd 
echo "" ; echo $list_updates_cmd ; echo $separator ; eval $list_updates_cmd 
echo "" ; echo $install_cmd ; echo $separator ; eval $install_cmd 
kept_back_packages=`apt-get --assume-no upgrade | sed -n -e '/The following packages have been kept back:/,/^[a-zA-Z0-9]/p' | grep '^ ' | xargs`
install_kept_back_cmd="apt-get -y install $kept_back_packages"
echo "" ; echo $install_kept_back_cmd ; echo $separator ; eval $install_kept_back_cmd 
echo "" ; echo $auto_remove_cmd ; echo $separator ; eval $auto_remove_cmd 
