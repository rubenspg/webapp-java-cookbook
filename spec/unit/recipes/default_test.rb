require 'spec_helper'

describe 'webapp-java::default' do
  it 'installs java' do
    package('java').must_be_installed
  end
end
