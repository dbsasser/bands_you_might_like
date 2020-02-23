class Bands

#have a name, change name to url param, store list of similar bands
attr_accessor :name, :url, :similar_bands

end

class SimilarBands

  attr_accessor :name, :genres, :url, :bio, :popularity, :top_songs

  @@all = []
  

  def initialize
    @@all << self
    @genres = []
    @top_songs = {}
  end

  def self.all
    @@all
  end

end
