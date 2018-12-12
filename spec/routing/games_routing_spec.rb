require "rails_helper"

RSpec.describe Api::V1::GamesController, type: :routing do
  describe "routing" do
    it "routes to #post" do
      expect(:post => "/api/v1/games").to route_to("api/v1/games#create")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/games/1").to route_to("api/v1/games#show", :id => "1")
    end
  end
end
