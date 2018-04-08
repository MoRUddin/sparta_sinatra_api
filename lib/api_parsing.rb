require_relative "./services/search_by_track"
require_relative "./services/search_by_lyrics"

class ApiParser

  def search_by_track
    SearchByTrack.new
  end

  def search_by_lyrics
    SearchByLyrics.new
  end

end
