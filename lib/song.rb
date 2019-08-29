class Song
  @@all = []
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
    save
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end
  
  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    artist, name = filename.split('.mp3')[0].split(' - ')
    new_song = Song.new(name)
    new_song.artist_name = artist
    new_song
  end

  def self.all
    @@all
  end
end
