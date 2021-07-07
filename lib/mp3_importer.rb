class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end
    def files
        files = []
        Dir.glob("#{@path}/*.mp3").each do|item|
            files << File.basename(item)
        end
        files
    end
    def import
        file = []
        files.each do |item|
            Song.new_by_filename(item)
        end
    end
end