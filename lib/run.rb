require './artist.rb'
require './song.rb'
require 'pry'

mj = Artist.new("mj")
clash = Artist.new("clash")

lc = Song.new("london calling")
clash.add_song(lc)

thriller = Song.new("thriller")
mj.add_song(thriller)

binding.pry

true