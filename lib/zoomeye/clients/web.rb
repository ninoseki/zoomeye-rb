# frozen_string_literal: true

module ZoomEye
  module Clients
    class Web < Base
      #
      # Search the Web technologies
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

        _get("/web/search", params) { |json| json }
      end
    end
  end
end
