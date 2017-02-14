#
# Cookbook Name:: webapp-java
# Recipe:: default
#
# Copyright 2017, Space Rubens
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java'

include_recipe 'webapp-java::tomcat'

#execute "apt-get update" do
#  command "sudo apt-get update"
#end
