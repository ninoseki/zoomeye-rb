# frozen_string_literal: true

require "zoomeye/version"

require "zoomeye/clients/base"

require "zoomeye/clients/host"
require "zoomeye/clients/resource_info"
require "zoomeye/clients/web"

require "zoomeye/api"

module ZoomEye
  class Error < StandardError; end
end
