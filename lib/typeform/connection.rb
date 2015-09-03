module Typeform
  class Connection
    BASE_URI = "https://api.typeform.io"
    TYPEFORM_API_VERSION = "v0.4"

    def initialize(api_key)
      @api_key = api_key
      @conn = Faraday.new(url: BASE_URI) do |faraday|
        faraday.request :json
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
        faraday.use FaradayMiddleware::ParseJson, content_type: /\bjson$/
      end
    end

    def set_base_headers(request)
      request.headers["X-API-TOKEN"] = @api_key
      request.headers["Accept-Encoding"] = "gzip, deflate"
    end

    def get(path)
      @conn.get do |request|
        set_base_headers(request)
        request.url "/#{TYPEFORM_API_VERSION}#{path}"
      end
    end

    def post(path, body)
      @conn.post do |request|
        set_base_headers(request)
        request.url "/#{TYPEFORM_API_VERSION}#{path}"
        request.body = body
      end
    end
  end
end
