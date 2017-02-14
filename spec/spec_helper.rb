require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.log_level = :fatal
  config.before do
    allow(File).to receive(:exist?).and_call_original
  end
end

at_exit { ChefSpec::Coverage.report! }
