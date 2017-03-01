#
# Recipe:: webapp
#
# Installs and configure the web application downloading a zip file from an external server,
# deploying and starting the jar file.
#
# Copyright 2017, Space Rubens
#
user 'vagrant'

# put vagrant in the group so we can make sure we don't remove it by managing app_group
group node['application']['name'] do
  members node['application']['name']
  action :create
end

directory node['application']['home_dir'] do
  owner node['application']['name']
  group node['application']['name']
  mode '0755'
  action :create
end

remote_file node['application']['zip_file'] do
  owner node['application']['name']
  mode '0644'
  source node['application']['url']
end

apt_package 'unzip'

execute 'unzip' do
  user node['application']['name']
  group node['application']['name']
  action :run
  command "unzip #{node['application']['zip_file']} -d #{node['application']['home_dir']}"
  not_if { ::File.exist?(node['application']['jar_file']) }
end

execute "execute #{node['application']['zip_file']}" do
  command "/usr/bin/java -jar #{node['application']['jar_file']} server #{node['application']['config_file']}"
  cwd 'directory containing jar file'
  action :run
end
