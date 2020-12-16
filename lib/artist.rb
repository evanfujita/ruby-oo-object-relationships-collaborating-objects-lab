#either creating the artist (if the artist doesn't exist in our program yet) or 
#finding the instance of that artist (if the artist does exist).

require 'pry'
require_relative 'song.rb'


class Artist

    @@all = [ ]

    attr_accessor :name, :song, :artist
    attr_reader 

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

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.find {|artist| artist.name == name } || Artist.new(name)
    end

    def print_songs
        self.songs.each do |song| 
          puts song.name
        end
    end
end

artist = Artist.new('Michael Jackson')
dirty_diana = Song.new("Dirty Diana")
billie_jean = Song.new("Billie Jean")
piano_man = Song.new("Piano Man")
artist.add_song(dirty_diana)
artist.add_song(billie_jean)
#binding.pry



#binding.pry