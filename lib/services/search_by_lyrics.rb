require "json"
require "httparty"

class SearchByLyrics
  attr_reader :response
  include HTTParty

  base_uri "http://api.musixmatch.com/ws/1.1/track.search?q_lyrics="

  def query(input_string)
    @response = JSON.parse(self.class.get("#{input_string.gsub(" ","%20")}&page_size=3&page=1&s_track_rating=desc&apikey=dc29c2ed3e5a6d07775fcb6338c355f5").body) #limits to 3 results, sorting by rating
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

    def track_list
      body["track_list"]
    end

    def search_track_list(index)
      track_list[index]
    end

    def main_data
      arr = []
      i = 0
      track_list.each do |track|
        arr[] << track["track"]
        i+=1
      end
      p arr
      arr
    end

end
