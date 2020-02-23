class BYML
  def call
    puts "Want to discover some bands you may like? Enter a band you like:"
    original_band = gets.strip.downcase
  end

  def self.get_input_band
    puts "Enter your favorite band or artist to find similar bands/artists you might like:"
    @@input_band = gets.strip.downcase
  end
  
  def self.convert_input_to_param
    "#{@@input_band.gsub(" ","+")}/+similar"
  end
    
  def self.list_similar_bands
    SimilarBands.all.each.with_index(1) do |band, index|
      puts "#{index}. #{band.name.upcase} - #{band.genres.join(", ")} - Popularity: #{band.popularity}"
    end
    puts "Enter the number of a band you would like to learn more about and listen to. You can also type 'back' to search for another band or 'exit' to leave the program."
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
