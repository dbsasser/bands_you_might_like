drequire "nokogiri"
require "open-uri"
require "pry"

class BandScraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.last.fm/music/Brand+New/+similar"))
  end
end

doc = Nokogiri::HTML(open("https://www.last.fm/music/Brand+New/+similar"))
binding.pry


#container: doc.css("div.similar-artists-item")
#Name: doc.css("h3.similar-artists-item-name").text.strip
#listeners doc.css("p.similar-artists-item-listeners").text.strip.gsub(" listeners", "")
#genres: doc.css("li.tag").text.strip
#bio: doc.css("div.similar-artists-item-wiki-inner-2.wiki-truncate-3-lines").first.text.strip.gsub("read more", "")
