class Song
attr_accessor :name, :artist
@@all = []

def initialize(name)
  self.name = name
  @@all << self
end

def self.all
  @@all
end

def artist_name=(name)
  artist = Artist.find_or_create_by_name(name)
  artist.add_song(self)
  return artist
end

def self.new_by_filename(file_name)
  artist_name_f, name, ext = file_name.split(/[.-]/)
  name.delete_prefix!(" ").delete_suffix!(" ")
  artist_name_f.delete_suffix!(" ")
  song = self.new(name)
  song.artist_name = artist_name_f
  return song
end


end
