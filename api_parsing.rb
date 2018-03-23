require "json"
require "httparty"

class ApiParser
  attr_reader :json_file
  include HTTParty

  base_uri ""

  def initialize(json_file)
    @json_file = JSON.parse(self.class.get(json_file))
  end

end
