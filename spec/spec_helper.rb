$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'typeform'

require "rspec/json_matcher"
RSpec.configuration.include RSpec::JsonMatcher
