# frozen_string_literal: true

module ZoomEye
  module Clients
    class User < Base
      def access_token
        _post("/user/login", username: @username, password: @password) { |json| json.dig("access_token") }
      end
    end
  end
end
