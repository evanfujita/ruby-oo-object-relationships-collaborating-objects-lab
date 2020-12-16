#The `MP3Importer` class will parse all the filenames and 
#send the filenames to the Song class

require 'pry'
require_relative 'song.rb'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children(path).map{|path| path }
    end
        
    def import
        self.files.each do |file_name|
        Song.new_by_filename(file_name)
        end
    end
end


