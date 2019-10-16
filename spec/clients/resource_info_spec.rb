# frozen_string_literal: true

RSpec.describe ZoomEye::Clients::ResourceInfo, :vcr do
  let(:api) { ZoomEye::API.new }

  describe "#search" do
    it do
      res = api.resource_info.get
      expect(res).to be_a(Hash)
    end
  end
end
