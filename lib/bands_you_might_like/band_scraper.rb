require "nokogiri"
require "open-uri"


class BandScraper

  def self.get_page
    @@doc = Nokogiri::HTML(open("https://www.last.fm/music/#{BYML.convert_input_to_param}"))
  end
  
  def self.make_bands 
  
      @@doc.css("div.similar-artists-item").first(6).each do |wrapper|
        band = SimilarBands.new 
        band.name = wrapper.css("h3.similar-artists-item-name").text.strip
        band.popularity = wrapper.css("p.similar-artists-item-listeners").text.strip.gsub(" listeners", "").delete(",")
        band.genres << wrapper.css("li.tag")[0].text.strip.downcase
        band.genres << wrapper.css("li.tag")[1].text.strip.downcase
        band.genres << wrapper.css("li.tag")[2].text.strip.downcase
        band.bio = wrapper.css("div.similar-artists-item-wiki-inner-2.wiki-truncate-3-lines").first.text.strip.gsub("read more", "")
        band.url = "https://last.fm" + wrapper.css("h3.similar-artists-item-name a").attr("href").text.strip
      end
    
    
    self.convert_listeners_to_stars
  end
  
  def self.convert_listeners_to_stars
    SimilarBands.all.each do |band|
      if band.popularity.to_i > 1500000
        band.popularity = "*****"
      elsif band.popularity.to_i > 1000000
        band.popularity = "****"
      elsif band.popularity.to_i > 500000
        band.popularity = "***"
      elsif band.popularity.to_i > 200000
        band.popularity = "**"
      else
        band.popularity = "*"
      end
    end
  end
  
  def self.scrape_songs(band)
    band_page = Nokogiri::HTML(open(band.url))
    band_page.css("tr.chartlist-row").first(3).each do |song|
      song_key = song.css("td.chartlist-name").text.strip
      song_value = song.css("a.chartlist-play-button").attr("href").text.strip
      band.top_songs[song_key] = song_value
    end
  end
  
end






#container: doc.css("div.similar-artists-item")
#Name: doc.css("h3.similar-artists-item-name").text.strip
#listeners doc.css("p.similar-artists-item-listeners").text.strip.gsub(" listeners", "")
#genres: doc.css("li.tag").text.strip
#bio: doc.css("div.similar-artists-item-wiki-inner-2.wiki-truncate-3-lines").first.text.strip.gsub("read more", "")
#bandurl: doc.css("h3.similar-artists-item-name a").attr("href").text.strip
