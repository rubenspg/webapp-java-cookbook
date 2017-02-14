require_relative '../../spec_helper'

describe 'default recipe on ubuntu 14.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') }
  let(:chef_run) { runner.converge('webapp-java::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
