require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_name)
    song = self.new
    no_mp3 = song_name.split("\.")[0]
    song.name = no_mp3.split("\ - ")[1]
    song.artist_name = no_mp3.split("\ - ")[0]
    song
  end

  def self.create_from_filename(song_name)
    song = self.create
    no_mp3 = song_name.split("\.")[0]
    song.name = no_mp3.split("\ - ")[1]
    song.artist_name = no_mp3.split("\ - ")[0]
    song
  end

  def self.destroy_all
    Song.all.clear
  end

end
