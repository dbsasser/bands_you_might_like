class BYML
  def call
    puts "Want to discover some bands you may like? Enter a band you like:"
    original_band = gets.strip.downcase
  end

  def self.list_similar_bands
    SimilarBands.all.each.with_index(1) do |band, index|
      puts "#{index}. #{band.name} - #{band.genres} - Popularirty: #{band.popularity}"
    end
    
    
  end

  def self.band_details
    puts <<~HEREDOC
    Made Up Band
    Indie, Rock, Jazz
    2001 - 2009

    This will be a short little bio of the band.

    Top Songs
    1. Their Best Song
       Listen to it here: http://thisisaurl.com/
    2. Not quite as Good Song
       Listen to it here: http://thisisaurl.com
    3. Their Best Songs
       Listen to it here: http://thisisaurl.com/
       HEREDOC
  end

end
