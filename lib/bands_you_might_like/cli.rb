class BYML
  
  def initialize 
    
  end
  
  def self.call
    self.greeting
    self.get_input_band
    BandScraper.get_page
    BandScraper.make_bands
    self.list_similar_bands
    self.select_similar_band
    self.goodbye
  end
  
  def self.greeting
    puts "Enter your favorite band or artist to find similar bands/artists you might like:"
  end
  
  def self.get_input_band
    @@input_band = gets.strip.downcase
  end
  
  def self.convert_input_to_param
    "#{@@input_band.gsub(" ","+")}/+similar"
  end
    
  def self.list_similar_bands
    puts "Similar Bands:"
    SimilarBands.all.each.with_index(1) do |band, index|
      puts "#{index}. #{band.name.upcase} - #{band.genres.join(", ")} - Popularity: #{band.popularity}".colorize(:color => :yellow)
    end
  end
  
  def self.select_similar_band
    puts "Enter the number of a band you would like to learn more about and listen to. You can also type 'back' to search for another band or 'exit' to leave."
    @@band_number = gets.strip
    
    if @@band_number.to_i > 0 && @@band_number.to_i < 7
      BandScraper.scrape_songs(SimilarBands.all[@@band_number.to_i - 1])
      SimilarBands.all[@@band_number.to_i - 1].detailed_view
    elsif @@band_number.downcase == "back"
      again = self.new
      again.call
    elsif @@band_number.downcase == "exit"
      self.goodbye
    else
      puts "Sorry, I don't understand." 
      self.select_similar_band
    end
  end
  
  def self.goodbye
    puts "See you next time. We hope you discovered some new bands to listen to."
  end

end
