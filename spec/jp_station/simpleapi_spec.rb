require 'spec_helper'
require 'pp'

describe JpStation::Simpleapi do
  context "with params" do
    context "when response with full data" do
      before do
        @response = JpStation::Simpleapi.stations
      end
      it 'returns a hash' do
        expect(@response.class).to eq Hash
      end
      it "returns a correct count" do
        expect(@response[:stations].length).to eq @response[:count]
      end
      it 'returns a correct hash' do
        expect(@response[:count]).to eq 8
        expect(@response[:stations].first[:name]).to eq "西新宿駅"
      end
    end

    context "when some response has nil data" do
      before do
        lat, lng = ["35.47700594420719", "139.63423721855474"]
        @response = JpStation::Simpleapi.stations(lat, lng)
      end
      it 'returns a hash' do
        expect(@response.class).to eq Hash
      end
      it "returns a correct count" do
        expect(@response[:stations].length).to eq @response[:count]
      end
    end
  end

  context "without params" do
    before do
      lat, lng = ["34.673150", "135.501005"]
      @response = JpStation::Simpleapi.stations(lat, lng)
    end
    it 'returns a hash' do
      expect(@response.class).to eq Hash
    end
    it "returns a correct count" do
      expect(@response[:stations].length).to eq @response[:count]
    end
    it 'returns a correct hash' do
      expect(@response[:count]).to eq 8
      expect(@response[:stations].first[:name]).to eq "心斎橋駅"
    end
  end
end
