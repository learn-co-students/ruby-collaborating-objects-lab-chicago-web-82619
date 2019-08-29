require 'pry'
class Artist
    attr_accessor :name, :artist
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

    # def print_songs(name)
    #     # self.all.collect {|| }
    # end
    
    def print_songs
        songs.each { |song| puts song.name}
    end
    # binding.pry
end
    