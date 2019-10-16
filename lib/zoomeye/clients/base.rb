# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module ZoomEye
  module Clients
    class Base
      HOST = "api.zoomeye.org"
      BASE_URL = "https://#{HOST}"

      def initialize(username:, password:)
        @username = username
        @password = password
      end

      private

      def access_token
        @access_token ||= _post("/user/login", username: @username, password: @password) { |json| json.dig("access_token") }
      end

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def make_request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          response = http.request(req)

          code = response.code.to_i
          body = response.body
          json = JSON.parse(body)

          case code
          when 200
            yield json
          else
            error = json.dig("message") || body
            raise Error, "Unsupported response code returned: #{code} - #{error}"
          end
        end
      end

      def token_headers
        {
          Authorization: "JWT #{access_token}"
        }
      end

      def build_request(type: "GET", path:, params: {})
        uri = url_for(path)
        uri.query = URI.encode_www_form(params) if type == "GET"

        headers = path == "/user/login" ? {} : token_headers

        request = case type
                  when "GET"
                    Net::HTTP::Get.new(uri, headers)
                  when "POST"
                    Net::HTTP::Post.new(uri, headers)
                  else
                    raise ArgumentError, "#{type} HTTP method is not supported"
                  end

        request.body = JSON.generate(params) unless type == "GET"

        request
      end

      def _get(path, params = {}, &block)
        request = build_request(type: "GET", path: path, params: params)
        make_request(request, &block)
      end

      def _post(path, params = {}, &block)
        request = build_request(type: "POST", path: path, params: params)
        make_request(request, &block)
      end
    end
  end
end
