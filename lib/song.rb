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
    new_song = Song.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    songs_name = name
    new_song = Song.new
    new_song.name = songs_name
    return new_song
 end

  def self.create_by_name(name)
    songs_name = name
    new_song = Song.new
    new_song.name = songs_name
    new_song.save
    return new_song
  end

  def self.find_by_name(name)
    all.find {|song| return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
       find_by_name(name)
    else
     create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(string)
    artist = string.split(' - ')
    name = artist[1].split('.')
    artist = artist[0]
    name = name[0]
    new_song = Song.new
    new_song.artist_name = artist
    new_song.name = name
    return new_song
  end

  def self.create_from_filename(string)
    artist = string.split(' - ')
    name = artist[1].split('.')
    artist = artist[0]
    name = name[0]
    new_song = Song.new
    new_song.artist_name = artist
    new_song.name = name
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

end


