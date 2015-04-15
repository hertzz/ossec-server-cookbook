require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |config|
  config.log_level = :debug
  
  config.platform = 'centos'
  config.version = '6.6'
end
