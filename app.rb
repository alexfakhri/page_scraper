require 'sinatra/base'

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
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
