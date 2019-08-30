require 'pry'
class Song
    attr_accessor :artist, :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        # binding.pry
        parsed_file = file.split(" - ")
        new_song = Song.new(parsed_file[1])
        new_song.artist =  Artist.find_or_create_by_name(parsed_file[0])
        # binding.pry
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end


end