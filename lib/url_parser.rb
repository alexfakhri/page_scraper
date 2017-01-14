require 'nokogiri'
require 'open-uri'

class UrlParser

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def url_opener(url)
    Nokogiri::HTML(open(url))
  end

  def link_finder(html)
    html.css('a').map{|link| link.attribute('href').to_s}.delete_if {|href| href.empty?}
  end

  def twitter(links)
    links.select{|s| s =~ /twitter.com/}
  end

  def github(links)
    links.select{|s| s =~ /github.com/}
  end

end
