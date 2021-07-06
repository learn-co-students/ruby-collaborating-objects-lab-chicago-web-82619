require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end

    def self.new_by_filename(filename)
        artist = filename.split(" - ")[0]
        song = Song.new(filename.split(" - ")[1])
        song.artist_name = artist
        song
    end

end

