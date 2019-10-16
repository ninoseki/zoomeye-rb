# frozen_string_literal: true

module ZoomEye
  class API
    def initialize(username: ENV["ZOOMEYE_USERNAME"], password: ENV["ZOOMEYE_PASSWORD"])
      raise ArgumentError, "No usernamme has been found or provided!" unless username
      raise ArgumentError, "No password has been found or provided!" unless password

      user = Clients::User.new(username: username, password: password)
      @access_token = user.access_token
    end

    def web
      @web ||= Clients::Web.new(access_token: @access_token)
    end

    def host
      @host ||= Clients::Host.new(access_token: @access_token)
    end

    def resource_info
      @resource_info ||= Clients::ResourceInfo.new(access_token: @access_token)
    end
  end
end
