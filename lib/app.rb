require 'sinatra/base'
require 'rack-flash'
require_relative 'url_parser'

class PageScraper < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions

  use Rack::Flash

  set :show_exceptions, :after_handler

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

  error 400..510 do
      flash[:error] = "The website you requested returned with an error, please try another site."
  		redirect back
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
