require 'simplecov'
SimpleCov.start

$TESTING=true

$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'gog'

require 'factory_girl'
FactoryGirl.find_definitions

require 'rspec'

RSpec.configure do |config|
end
