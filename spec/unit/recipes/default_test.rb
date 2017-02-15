require_relative '../../spec_helper'

describe 'default recipe on ubuntu 14.04' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge('webapp-java::default') }

  it 'creates a user with the default action' do
    expect(chef_run).to create_user('vagrant')
    expect(chef_run).to_not create_user('satest')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end

  # it 'creates a remote_file with the zip content' do
  #   expect(chef_run).to create_remote_file('/usr/share/satest/satest.zip')
  # end

  it 'creates a group with for the app' do
    expect(chef_run).to create_group('satest_group')
  end

  it 'runs a execute unzip' do
    expect(chef_run).to run_execute('unzip')
  end

  it 'installs unzip' do
    expect(chef_run).to install_apt_package('unzip')
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
end
