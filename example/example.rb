$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "typeform"
require "pry"

typeform_api_key = ENV['TYPEFORM_API_KEY']
client = Typeform::Client.new(typeform_api_key)

pp client.information
