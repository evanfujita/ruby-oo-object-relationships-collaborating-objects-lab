#creating songs given each filename and 
#sending the artist's name (a string) to the Artist class

require 'pry'
require_relative 'artist.rb'

class Song

    @@all = []

    attr_accessor :name, :artist
    attr_reader :song

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.new_by_filename(file_name)
        file_name.split(" - ")
        name = file_name.split(" - ")[0]
        song_name = file_name.split(" - ")[1]
        song = Song.new(song_name)
        song.artist_name = name
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name) 
        artist.add_song(self)
    end
end