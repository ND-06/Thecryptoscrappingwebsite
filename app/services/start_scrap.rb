require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap
  
  def initialize
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    @price = page.css("a.price")
    @crypto = page.css("a.currency-name-container.link-secondary")
    @coin_list = []
    @value_list = []
  end

  def perform
    @crypto.each do |link|
    @totalname = link.text 
    @coin_list << @totalname
  end
    @price.each do |value|
    @totalvalue = value.text  
    @value_list << @totalvalue
  end
  save
end

  def save
    @hash = Hash[@coin_list.zip(@value_list)]
    return @hash    
  end 
end
