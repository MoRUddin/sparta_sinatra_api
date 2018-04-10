require "spec_helper"

describe "test environment" do

  context "Querying the API with a track name" do
    before(:all) do
      @api_parsing = ApiParser.new
      @response = @api_parsing.search_by_track
      @response.query("Chandelier")
    end

    it "should return a hash 'header', containing an 'execute_time' float" do
      expect(@response.header).to be_a(Hash)
      expect(@response.search_header("execute_time")).to be_a(Float)
    end

    it "should return a lyrics hash" do
      expect(@response.lyrics_hash).to be_a(Hash)
    end

    it "should return expected lyrics" do
      expect(@response.search_lyrics_hash("lyrics_body")).to include("I'm gonna swing from the chandelier")
    end

  end

  context "Querying the API with the lyrics" do
    before(:all) do
      @api_parsing = ApiParser.new
      @response = @api_parsing.search_by_lyrics
      @response.query("pop some tags only got")
    end

    it "should return a hash 'header', containing a 'status_code' integer" do
      expect(@response.header).to be_a(Hash)
      expect(@response.search_header("status_code")).to be_an(Integer)
    end

    it "should return no more than 10 tracks" do
      expect(@response.track_list.length).to be <= 10
    end

    it "should return expected track name" do
      expect(@response.search_track_list(0)["track"]["track_name"]).to eq("Thrift Shop")
    end

    it "should return expected artist" do
      expect(@response.search_track_list(0)["track"]["artist_name"]).to include("Macklemore")
    end
    it "should return a rating between 0 and 100" do
      expect(@response.search_track_list(0)["track"]["track_rating"]).to be_between(0,100).inclusive
    end

  end
end
