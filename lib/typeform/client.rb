require "typeform/version"
require "typeform/entity/form"
require "typeform/entity/field"
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

    def set_base_headers(request)
      request.headers["X-API-TOKEN"] = @api_key
      request.headers["Content-Type"] = "application/json; charset=utf-8"
      request.headers["Accept-Encoding"] = "gzip, deflate"
    end

    def get(path)
      @conn.get do |request|
        set_base_headers(request)
        request.url "/v0.3#{path}"
      end
    end

    def post(path, body)
      @conn.post do |request|
        set_base_headers
        request.url "/v0.3#{path}"
      end
    end

    def information
      response = get "/"
      response
    end

    def create_form_from_json(json)
      response = post "/forms", json
      response
    end

    def create_form_from_file(file)
      response = create_form_from_json(JSON.parse(file.read))
      response
    end
  end
end
