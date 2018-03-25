class Song
  attr_accessor :id, :song_name, :artist, :lyrics, :rating

  def save
    conn = Song.open_connection
    if(!self.id)
      sql = "INSERT INTO Song (song_name,artist,lyrics,rating) VALUES ( '#{self.song_name}','#{self.artist}','#{self.lyrics}','#{self.rating}')"
    else
      sql = "UPDATE Song SET song_name='#{self.song_name}',artist='#{self.artist}',lyrics='#{self.lyrics}',rating='#{self.rating}', WHERE id = #{self.id}"
    end
    conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect( dbname: "sparta-sinatra-api" )
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM Song ORDER BY id"
    results = conn.exec(sql)
    songs = results.map do |tuple|
      self.hydrate tuple
    end
    songs
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM Song WHERE id = #{id} LIMIT 1"
    songs = conn.exec(sql)
    song = self.hydrate songs[0]
    song
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM Song where id = #{id}"
    conn.exec(sql)
  end

  def self.hydrate song_data
    song = Song.new
    song.id = song_data['id']
    song.song_name = song_data['song_name']
    song.artist = song_data['artist']
    song.lyrics = song_data['lyrics']
    song.rating = song_data['rating']
    song
  end

end
