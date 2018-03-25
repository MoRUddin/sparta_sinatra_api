require "spec_helper"

describe "test environment" do

  context "" do
    before(:all) do
      @api_parsing = ApiParser.new
      @response = @api_parsing.()
    end
  end
end
