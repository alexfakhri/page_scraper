require 'sinatra/base'
require 'nokogiri'
require 'open-uri'

class PageScraper < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/url' do
    session[:url] = params[:url]
    redirect :result
  end

  get '/result' do
    @url = session[:url]
    @html = Nokogiri::HTML(open(@url))
    @links = @html.css('a')
    @sorted_links =  @links.map{|link| link.attribute('href').to_s}.delete_if {|href| href.empty?}
    @twitter = @sorted_links.select{|s| s =~ /twitter.com/}
    @github = @sorted_links.select{|s| s =~ /github.com/}
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
