class BYML
  def call
    puts "Want to discover some bands you may like? Enter a band you like:"
    original_band = gets.strip.downcase
  end

  def self.band_list
    puts <<~HEREDOC
      1. Band No 1 - Rock, Indie - 2008-Present
      2. Band No 2 - Rock, Indie - 2008-Present
      3. Band No 3 - Rock, Indie - 2008-Present
      4. Band No 4 - Rock, Indie - 2008-Present
      5. Band No 5 - Rock, Indie - 2008-Present

      Enter the number of a band you would like to find out more about and listen to:

    HEREDOC
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
