require 'pry'
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

    def add_song(song)
        song.artist = self
    end
    
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
       if self.all.find {|artist_name| artist_name.name == name}
        self.all.find {|artist_name| artist_name.name == name}
       else
        self.new(name)
       end
    end

    def print_songs
        art_songs = Song.all.select { |s| s.artist == self }
        list_songs = art_songs.map {|title| title.name}
        list_songs.each do |song|
            puts song
        end
    end
end
    