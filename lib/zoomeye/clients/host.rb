# frozen_string_literal: true

module ZoomEye
  module Clients
    class Host < Base
      #
      # Search the Host devices
      #
      # @param [String] query Query string
      # @param [Integer, nil] page The page number to paging(default:1)
      # @param [String, nil] facets A comma-separated list of properties to get summary information on query
      #
      # @return [Hash]
      #
      def search(query, page: nil, facets: nil)
        params = {
          query: query,
          page: page,
          facets: facets
        }.compact

        _get("/host/search", params) { |json| json }
      end
    end
  end
end
