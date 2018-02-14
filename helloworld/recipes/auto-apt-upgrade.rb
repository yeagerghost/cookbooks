cookbook_file '/tmp/auto-apt-upgrade.sh' do
  source 'auto-apt-upgrade.sh'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Exexute auto apt upgrade' do
  command '/tmp/auto-apt-upgrade.sh'
end
