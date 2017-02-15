default['application']['url']         = 'https://sa-tech-test.s3.amazonaws.com/satest.zip'
default['application']['user_name']   = 'vagrant'
default['application']['user_group']  = 'satest_group'
default['application']['name']        = 'satest'
default['application']['home_dir']    = "/usr/share/#{node['application']['name']}"
default['application']['zip_file']    = "#{node['application']['home_dir']}/#{node['application']['name']}.zip"
default['application']['jar_file']    = "#{node['application']['home_dir']}/#{node['application']['name']}.jar"
default['application']['config_file'] = "#{node['application']['home_dir']}/#{node['application']['name']}.yml"
