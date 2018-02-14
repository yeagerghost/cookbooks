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
echo "" >> $temp_logfile; echo $update_cmd >> $temp_logfile; echo $separator >> $temp_logfile; eval $update_cmd >> $temp_logfile
echo "" >> $temp_logfile; echo $list_updates_cmd >> $temp_logfile; echo $separator >> $temp_logfile; eval $list_updates_cmd >> $temp_logfile
echo "" >> $temp_logfile; echo $install_cmd >> $temp_logfile; echo $separator >> $temp_logfile; eval $install_cmd >> $temp_logfile
kept_back_packages=`apt-get --assume-no upgrade | sed -n -e '/The following packages have been kept back:/,/^[a-zA-Z0-9]/p' | grep '^ ' | xargs`
install_kept_back_cmd="apt-get -y install $kept_back_packages"
echo "" >> $temp_logfile; echo $install_kept_back_cmd >> $temp_logfile; echo $separator >> $temp_logfile; eval $install_kept_back_cmd >> $temp_logfile
echo "" >> $temp_logfile; echo $auto_remove_cmd >> $temp_logfile; echo $separator >> $temp_logfile; eval $auto_remove_cmd >> $temp_logfile
sed 's///g' $temp_logfile > $logfile
