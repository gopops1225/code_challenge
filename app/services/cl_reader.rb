require 'nokogiri'
require 'open-uri'
require 'pry-rails'

class ClReader

  def initialize

  end

  def get_jeep_listing
    url = 'https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2510209.m570.l1313&_nkw=jeep&_sacat=0'
    page = URI.open(url)
    doc = Nokogiri::HTML(URI.open(url))
    doc.css('div.s-item__info.clearfix').first.remove #remove unwanted node
    jeep_listing = doc.css('div.s-item__info.clearfix')
    create_jeep_list(jeep_listing)
  end

  def create_jeep_list(jeep_listing)
    jeeps = Array.new
    jeep_listing.each do |jeep|
      jeep = {
        name: jeep.css('a.s-item__link').text.gsub(/\d+/,"").strip,
        price: jeep.css('span.s-item__price').text.split('$').last.gsub(',','').to_f,
        year: jeep.css('span.s-item__dynamic.s-item__dynamicAttributes1').text&.split(" ")&.last.to_i,
        miles: jeep.css('span.s-item__dynamic.s-item__dynamicAttributes2').text&.split(" ")&.last.to_i,
        bids: jeep.css('span.s-item__bids').text&.gsub(/\D+/,"").to_i ,
        time_remaining: jeep.css('span.s-item__time-left').text
      }

      jeeps << jeep
    end
    jeeps
  end
end
