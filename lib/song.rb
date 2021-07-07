require "pry"
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
    def self.new_by_filename(song)
        arr = song.split(/[-.]/)
        s = Song.new(arr[1].strip)
        s.artist_name=(arr[0].strip)
        s
    end
    def artist_name=(name)
        a = Artist.find_or_create_by_name(name)
        a.add_song(self)
    end

end