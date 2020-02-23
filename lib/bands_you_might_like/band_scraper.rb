require "pry"
require "nokogiri"
require "open-uri"

class BandScraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.last.fm/music/Brand+New/+similar"))
  end
end

doc = Nokogiri::HTML(open("https://www.last.fm/music/Brand+New/+similar"))
binding.pry
