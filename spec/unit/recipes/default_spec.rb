require_relative '../../spec_helper'

describe 'default recipe on ubuntu 14.04' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge('webapp-java::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end

  it 'creates a user with the default action' do
    expect(chef_run).to create_user('vagrant')
    expect(chef_run).to_not create_user('satest')
  end

  it 'creates a group with for the app' do
    expect(chef_run).to create_group('satest_group')
  end

  it 'creates the application zip file' do
    expect(chef_run).to create_remote_file_if_missing('/usr/share/satest/satest.zip')
  end

  it 'installs unzip' do
    expect(chef_run).to install_apt_package('unzip')
  end

  it 'runs a execute unzip' do
    expect(chef_run).to run_execute('unzip')
  end

  it 'creates a directory with attributes' do
    expect(chef_run).to create_directory('/usr/share/satest').with(
      user:   'vagrant',
      group:  'satest_group'
    )

    expect(chef_run).to_not create_directory('/tmp/with_attributes').with(
      user:   'bacon',
      group:  'fat'
    )
  end

  it 'creates a yml config file' do
    expect(chef_run).to create_template('/usr/share/satest/satest.yml')
  end

  it 'creates a init script for the service' do
    expect(chef_run).to create_template('/etc/init.d/satest')
  end

  it 'enables the satest service' do
    expect(chef_run).to enable_service('satest')
  end
end
