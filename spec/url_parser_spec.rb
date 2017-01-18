require 'url_parser'

describe UrlParser do
  subject(:url) { UrlParser.new('http://aakashjapi.com/') }

  describe '#url' do
    it 'returns the url' do
      expect(url.url).to eq 'http://aakashjapi.com/'
    end

    it 'returns a variable containing the page scraping' do
      website = 'http://aakashjapi.com/'
      html = url.url_opener(website)
      expect(html).not_to be_nil
    end

    it 'returns an array containg the links on the page' do
      website = 'http://aakashjapi.com/'
      html = url.url_opener(website)
      expect(url.link_finder(html)).to include "https://twitter.com/logicx24"
    end

    it 'returns the twitter url on page' do
      website = 'http://aakashjapi.com/'
      html = url.url_opener(website)
      twitter_url = url.link_finder(html)
      expect(url.twitter(twitter_url)).to eq "https://twitter.com/logicx24"
    end

    it 'returns the github url on page' do
      website = 'http://aakashjapi.com/'
      html = url.url_opener(website)
      github_url = url.link_finder(html)
      expect(url.github(github_url)).to eq "https://github.com/logicx24"
    end


  end

end
