# frozen_string_literal: true

module ZoomEye
  class API
    def initialize(api_key: ENV["ZOOMEYE_API_KEY"])
      @api_key = api_key
      raise ArgumentError, "No API key has been found or provided!" unless @api_key
    end

    def web
      @web ||= Clients::Web.new(@api_key)
    end

    def host
      @host ||= Clients::Host.new(@api_key)
    end

    def resource_info
      @resource_info ||= Clients::ResourceInfo.new(@api_key)
    end
  end
end
