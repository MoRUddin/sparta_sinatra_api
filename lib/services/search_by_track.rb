require "json"
require "httparty"

class SearchByTrack
  attr_reader :response
  include HTTParty

  base_uri "https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=json&q_track="

  def query(input_string)
    @response = JSON.parse(self.class.get("#{input_string}&apikey=dc29c2ed3e5a6d07775fcb6338c355f5").body)
  end

  def message
    response["message"]
  end

  def header
    message["header"]
  end

  def search_header(key_word)
    header["#{key_word}"]
  end

  def body
    message["body"]
  end

  def lyrics_hash
    body["lyrics"]
  end

  def search_lyrics_hash(key_word)
    lyrics_hash["#{key_word}"]
  end

end
