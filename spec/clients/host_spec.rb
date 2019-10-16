# frozen_string_literal: true

RSpec.describe ZoomEye::Clients::Host, :vcr do
  let(:api) { ZoomEye::API.new }

  describe "#search" do
    let(:query) { "port:80 nginx" }

    it do
      res = api.host.search(query)
      expect(res).to be_a(Hash)
    end

    context "when given options" do
      let(:page) { 7 }
      let(:facets) { "app,device" }

      it do
        res = api.host.search(query, page: page, facets: facets)
        expect(res).to be_a(Hash)
      end
    end
  end
end
