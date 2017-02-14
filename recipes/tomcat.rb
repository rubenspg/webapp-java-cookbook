#
# Recipe:: tomcat
#
# Installs and configure the Tomcat downloading the tarball directly from the apache server.
# Implementation based on the example available at https://github.com/chef-cookbooks/tomcat
#
# Copyright 2017, Space Rubens
#
user 'vagrant'

# put vagrant in the group so we can make sure we don't remove it by managing cool_group
group 'app_group' do
  members 'vagrant'
  action :create
end

# Install Tomcat 8.0.36 to the default location
tomcat_install 'webapp-java' do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
  tomcat_user 'vagrant'
  tomcat_group 'app_group'
end

# Drop off our own server.xml that uses a non-default port setup
cookbook_file '/opt/tomcat_webapp-java/conf/server.xml' do
  source 'webapp-java_server.xml'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'tomcat_service[webapp-java]'
end

remote_file '/opt/tomcat_webapp-java/webapps/sample.war' do
  owner 'vagrant'
  mode '0644'
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
end

# start the webapp-java tomcat service using a non-standard pic location
tomcat_service 'webapp-java' do
  action [:start, :enable]
  env_vars [{ 'CATALINA_PID' => '/opt/tomcat_webapp-java/bin/non_standard_location.pid' }, { 'SOMETHING' => 'some_value' }]
  sensitive true
  tomcat_user 'vagrant'
  tomcat_group 'app_group'
end
