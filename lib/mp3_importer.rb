class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end
    
     def files
        files = []
        file_folder = Dir["#{@path}/*.mp3"]
        file_folder.each do |file|
            files.push(file.delete_prefix("#{@path}/"))
        end
        files
    end   


    def import
        files.each { |file| Song.new_by_filename(file) }
    end
end    
