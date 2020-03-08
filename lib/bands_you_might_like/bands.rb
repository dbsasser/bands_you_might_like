class SimilarBands

  attr_accessor :name, :genres, :url, :bio, :popularity, :top_songs, :all

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
    puts "\n#{@name.upcase}".yellow
    puts "#{@genres.join(", ")}".white
    puts "Popularity: #{@popularity}\n".magenta
    puts "#{@bio}\n".white
    puts "Top songs:\n".magenta
    @top_songs.each.with_index(1) do |(name, link), index|
      puts "#{index}. #{name}".white
      puts "   Listen: #{link}".yellow
    end
  end
end
