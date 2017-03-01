default['application']['url']         = 'https://sa-tech-test.s3.amazonaws.com/satest.zip'
default['application']['user_name']   = 'vagrant'
default['application']['user_group']  = 'satest_group'
default['application']['name']        = 'satest'
default['application']['home_dir']    = "/usr/share/#{node['application']['name']}"
default['application']['zip_file']    = "#{node['application']['home_dir']}/#{node['application']['name']}.zip"
default['application']['jar_file']    = "#{node['application']['home_dir']}/#{node['application']['name']}.jar"
default['application']['config_file'] = "#{node['application']['home_dir']}/#{node['application']['name']}.yml"
default['application']['init_script'] = '/etc/init.d/satest'
default['application']['pid_file']    = '/tmp/satest-pid'

# Attributes for service configuration file (.yml)
default['application']['adminPort'] = 8889
default['application']['http-port'] = 8888
default['application']['logging']['level'] = 'INFO'
default['application']['logging']['loggers']['com.spaceape'] = 'DEBUG'
default['application']['logging']['console']['enabled'] = true
default['application']['logging']['file']['enabled'] = true
default['application']['logging']['file']['currentLogFilename'] = "#{node['application']['home_dir']}/satest.log"
default['application']['logging']['file']['archivedLogFilenamePattern'] = "#{node['application']['home_dir']}/satest-%d.log.gz"
default['application']['logging']['file']['archivedFileCount'] = 14
default['application']['logging']['file']['timeZone'] = 'UTC'
