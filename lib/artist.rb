class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def songs
        Song.all.select{|obj| obj.artist == self}
    end
    def add_song(song)
        song.artist = self
    end
    def self.find_or_create_by_name(name)
        if @@all.find{|obj| obj.name == name}
            p = @@all.find{|obj| obj.name == name}
        else
            p = Artist.new(name)
        end
        p
    end
    def print_songs
        songs.each{|obj| puts obj.name}
    end
end