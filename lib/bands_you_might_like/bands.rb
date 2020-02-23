class  OriginalBand
#have a name, change name to url param, store list of similar bands
attr_accessors :name, :url, :similar_bands

end

class SimilarBands

  attr_accessors :name, :genres, :url, :bio

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
