require "typeform/version"
require "typeform/connection"
require "typeform/form"
require "typeform/field"
require "faraday"
require "faraday_middleware"
require "json"

module Typeform
  class Client
    def initialize(api_key)
      @conn = Connection.new(api_key)
    end

    def information
      @conn.get "/"
    end

    def show_form(id)
      @conn.get "/forms/#{id}"
    end

    def create_form_from_json(json)
      @conn.post "/forms", json
    end

    def create_form_from_file(file)
      create_form_from_json(JSON.parse(file.read))
    end
  end
end
