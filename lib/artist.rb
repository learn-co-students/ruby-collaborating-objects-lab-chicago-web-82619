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

    def self.find_or_create_by_name(name)
        @@all.find { |song| song.name == name} || self.new(name)
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        songs = Song.all.select { |song| song.artist == self }
        songs.map { |song| puts song.name }
    end
    
end