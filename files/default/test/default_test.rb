require 'minitest/spec'

describe_recipe 'webapp-java::default' do
  it 'installs java' do
    package('java').must_be_installed
  end
end
