# frozen_string_literal: true

RSpec.describe ZoomEye::Clients::Web, :vcr do
  let(:api) { ZoomEye::API.new }

  describe "#search" do
    let(:query) { "wordpress" }

    it do
      res = api.web.search(query)
      expect(res).to be_a(Hash)
    end

    context "when given options" do
      let(:page) { 1 }
      let(:facets) { "app,os" }

      it do
        res = api.host.search(query, page: page, facets: facets)
        expect(res).to be_a(Hash)
      end
    end
  end
end
