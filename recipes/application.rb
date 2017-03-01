#
# Recipe:: webapp
#
# Installs and configure the web application downloading a zip file from an external server,
# deploying and starting the jar file.
#
# Copyright 2017, Space Rubens
#
user node['application']['user_name']

# put vagrant in the group so we can make sure we don't remove it by managing app_group
group node['application']['user_group'] do
  members node['application']['user_name']
  action :create
end

directory node['application']['home_dir'] do
  owner node['application']['user_name']
  group node['application']['user_group']
  mode '0755'
  action :create
end

# Download the application zip file
remote_file node['application']['zip_file'] do
  owner node['application']['user_name']
  group node['application']['user_group']
  mode '0755'
  source node['application']['url']
  action :create_if_missing
end

apt_package 'unzip'

# Unzip the content (jar + yml)
execute 'unzip' do
  user node['application']['user_name']
  action :run
  command "unzip -ju #{node['application']['zip_file']}"
  cwd node['application']['home_dir']
  not_if { ::File.exist?(node['application']['jar_file']) }
end

# Creates the service init script
template node['application']['init_script'] do
  source 'satest_init.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Enables the service
service node['application']['name'] do
  supports restart: true, start: true, stop: true
  action [:enable]
  init_command node['application']['init_script']
end

# Creates the config file (yml) and start the service
template node['application']['config_file'] do
  source 'satest.erb'
  mode '0440'
  owner node['application']['user_name']
  group node['application']['user_group']
  action :create
  notifies :restart, 'service[satest]'
end
