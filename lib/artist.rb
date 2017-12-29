require "pry"

class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    found_song = @songs.any? { |t| t.name == song.name }
    if found_song == false && song.artist == nil
      song.artist = self
      @songs << song
    end
  end

  def genres
    binding.pry
    songs.collect { |song| song.genre }.uniq
  end
end