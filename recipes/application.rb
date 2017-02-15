#
# Recipe:: tomcat
#
# Installs and configure the Tomcat downloading the tarball directly from the apache server.
# Implementation based on the example available at https://github.com/chef-cookbooks/tomcat
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

remote_file node['application']['zip_file'] do
  owner node['application']['user_name']
  group node['application']['user_group']
  mode '0755'
  source node['application']['url']
  action :create_if_missing
end

apt_package 'unzip'

execute 'unzip' do
  user node['application']['user_name']
  group node['application']['user_group']
  action :run
  command "unzip -j #{node['application']['zip_file']}"
  cwd node['application']['home_dir']
  not_if { ::File.exist?(node['application']['jar_file']) }
end

execute 'execute app' do
  command "/usr/bin/java -jar #{node['application']['jar_file']} server #{node['application']['config_file']}"
  cwd node['application']['home_dir']
  action :run
end
