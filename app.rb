require 'sinatra/base'
require './lib/url_parser'

class PageScraper < Sinatra::Base

  enable :sessions

  url_parser = UrlParser.new(@url)

  get '/' do
    erb :index
  end

  post '/url' do
    session[:url] = params[:url]
    redirect :result
  end

  get '/result' do
    @url = session[:url]
    @html = url_parser.url_opener(@url)
    @links = url_parser.link_finder(@html)
    @twitter = url_parser.twitter(@links)
    @github = url_parser.github(@links)
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
