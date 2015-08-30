module Typeform
  class Connection
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
        set_base_headers(request)
        request.url "/v0.3#{path}"
        request.body = body
      end
    end
  end
end
