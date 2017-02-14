name             'webapp-java'
maintainer       'space-rubens'
maintainer_email 'rubenspg@gmail.com'
license          'All rights reserved'
description      'Installs/Configures webapp-java'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url 'https://github.com/rubenspg/webapp-java-cookbook/issues'
source_url 'https://github.com/rubenspg/webapp-java-cookbook'

# Opscode Community Cookbooks
depends 'tomcat', '~> 2.3.4'
depends 'java'
