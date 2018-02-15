cookbook_file '/tmp/auto-apt-upgrade-nolog.sh' do
  source 'auto-apt-upgrade-nolog.sh'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Exexute auto apt upgrade' do
  command '/tmp/auto-apt-upgrade-nolog.sh'
end
