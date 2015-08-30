require "typeform/version"
require "faraday"
require "faraday_middleware"
require "json"

module Typeform
  class Client
    @@base_uri = "https://api.typeform.io"

    def initialize(api_key)
      @api_key = api_key
      @conn = Faraday.new(url: @@base_uri) do |faraday|
        faraday.request :json
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
        faraday.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
      end
    end

    def get(path)
      response = @conn.get do |request|
        request.url "/v0.3#{path}"
        request.headers["X-API-TOKEN"] = @api_key
        request.headers["Content-Type"] = "application/json; charset=utf-8"
        request.headers["Accept-Encoding"] = "gzip, deflate"
      end
    end

    def information
      response = get "/"
      response.body
    end
  end
end
