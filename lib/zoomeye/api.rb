# frozen_string_literal: true

module ZoomEye
  class API
    attr_reader :host
    attr_reader :web
    attr_reader :resource_info

    def initialize(username: ENV["ZOOMEYE_USERNAME"], password: ENV["ZOOMEYE_PASSWORD"])
      @username = username
      raise ArgumentError, "No usernamme has been found or provided!" unless @username

      @password = password
      raise ArgumentError, "No password has been found or provided!" unless @password

      @web = Clients::Web.new(username: username, password: password)
      @host = Clients::Host.new(username: username, password: password)
      @resource_info = Clients::ResourceInfo.new(username: username, password: password)
    end
  end
end
