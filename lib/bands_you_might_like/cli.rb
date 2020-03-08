class BYML

  def initialize

  end

  def self.call
    self.get_input_band
    BandScraper.get_page
    BandScraper.make_bands
    self.list_similar_bands
    self.select_similar_band
  end

  def self.splash
    puts <<~HEREDOC.yellow

    BBBBB   YY   YY MM    MM LL
    BB   B  YY   YY MMM  MMM LL
    BBBBBB   YYYYY  MM MM MM LL
    BB   BB   YYY   MM    MM LL
    BBBBBB    YYY   MM    MM LLLLLLL

    Welcome to Bands You Might Like.
    HEREDOC
  end

  def self.get_input_band
    puts "Enter your favorite band or artist to find similar bands/artists you might like:".light_blue
    @@input_band = gets.strip.downcase
  end

  def self.convert_input_to_param
    "#{@@input_band.gsub(" ","+")}/+similar"
  end

  def self.list_similar_bands
    puts "\nSimilar Bands:\n\n"
    SimilarBands.all.each.with_index(1) do |band, index|
      print "#{index}. ".white
      print "#{band.name}".yellow.bold
      print " - ".white
      print "#{band.genres.join(", ")}"
      print " - "
      print "Popularity: #{band.popularity}".magenta
      puts "\n"
    end
  end

  def self.select_similar_band
    puts "\nEnter the number of a band you would like to learn more about and listen to. You can also type 'back' to search for another band or 'exit' to leave.".light_blue
    input = gets.strip.downcase


    if input.to_i > 0 && input.to_i < 7
      BandScraper.scrape_songs(SimilarBands.all[input.to_i - 1])
      SimilarBands.all[input.to_i - 1].detailed_view
    elsif input == "back"
      SimilarBands.all.clear
      self.call
    elsif input == "exit"
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
