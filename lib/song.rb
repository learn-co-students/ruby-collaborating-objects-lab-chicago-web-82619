class Song
    attr_accessor :name, :artist
    @@all = []
  
    def initialize(name)
      @name = name
      save
    end
  
    def save
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.new_by_filename(filename)
      filename = filename.split(" - ")
      artist = filename[0]
      title = filename[1]
      new_song = Song.new(title)
      new_song.artist_name = artist
      new_song
    end
  
    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end
  end
  