# frozen_string_literal: true

module ZoomEye
  module Clients
    class ResourceInfo < Base
      #
      # Resources info for account
      #
      # @return [Hash]
      #
      def get
        _get("/resources-info") { |json| json }
      end
    end
  end
end
