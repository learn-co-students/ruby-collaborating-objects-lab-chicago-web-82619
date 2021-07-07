class Artist
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
    save
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

  def add_song(song)
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    existing_artist = @@all.find {|artist| artist.name == name}
    #existing_artist ? existing_artist : Artist.new(name) 
    if existing_artist
      existing_artist
    else
      self.new(name)
    end
  end

  def self.all
    @@all
  end
end
