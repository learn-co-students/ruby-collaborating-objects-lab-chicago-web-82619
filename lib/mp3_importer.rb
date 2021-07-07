class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(self.path).select {|f| !File.directory?(f)}
    files.map {|file| file.split(self.path)}.flatten
  end

  def import
    files.each {|file| Song.new_by_filename(file)}
  end
end
