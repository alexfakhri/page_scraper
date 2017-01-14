require 'sinatra/base'

class PageScraper < Sinatra::Base
  get '/' do
    'Hello PageScraper!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
