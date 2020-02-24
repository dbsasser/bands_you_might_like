class BYML
  def call
    puts "Want to discover some bands you may like? Enter a band you like:"
    original_band = gets.strip.downcase
  end
  
  def self.welcome_message
    puts "Enter your favorite band or artist to find similar bands/artists you might like:"
  end
  
  def self.get_input_band
    @@input_band = gets.strip.downcase
  end
  
  def self.convert_input_to_param
    "#{@@input_band.gsub(" ","+")}/+similar"
  end
    
  def self.list_similar_bands
    SimilarBands.all.each.with_index(1) do |band, index|
      puts "#{index}. #{band.name.upcase} - #{band.genres.join(", ")} - Popularity: #{band.popularity}"
    end
  end
  
  def self.select_similar_band
    puts "Enter the number of a band you would like to learn more about and listen to. You can also type 'back' to search for another band or 'exit' to leave."
    @@band_number = gets.strip.to_i
    
    if @@band_number > 0 && @@band_number < 7
      BandScraper.scrape_songs(SimilarBands.all[@@band_number - 1])
      SimilarBands.all[@@band_number - 1].detailed_view
    else
      puts "Sorry, I don't understand." 
      self.select_similar_band
    end
      
  end

    

  def self.band_details
   puts "The Bands Details"
  end

end
