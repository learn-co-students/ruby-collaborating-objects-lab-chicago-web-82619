class MP3Importer
    attr_accessor :file, :path, :size

    def initialize(path)
        @path = path
        # binding.pry
    end

    def files
        Dir.entries(path).select {|f| !File.directory? f}
                # binding.pry
    end

    def import
        self.files.map {|song| Song.new_by_filename(song)}
    end
    
end