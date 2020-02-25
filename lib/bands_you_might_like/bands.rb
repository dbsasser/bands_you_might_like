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
  
  def detailed_view
    
    puts <<~HEREDOC
    #{@name.upcase}
    #{@genres.join(", ")}
    Popularity: #{@popularity}
    
    #{@bio}
    
    Top songs:
    
    HEREDOC
    
    @top_songs.each.with_index(1) do |(name, link), index|
      puts "#{index}. #{name}"
      puts "   Listen: #{link}"
    end
  end
end
