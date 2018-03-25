require "json"
require "httparty"

class ApiParser
  attr_reader :json_file
  include HTTParty

  base_uri "https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track="

  def initialize(json_file)
    @json_file = JSON.parse(self.class.get("#{json_file}&apikey=dc29c2ed3e5a6d07775fcb6338c355f5"))
  end

end

p ApiParser.new("7th%20element").json_file
