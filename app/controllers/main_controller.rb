require_relative "../../lib/api_parsing"

class MainController < Sinatra::Base
  #sets root of the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  #sets the view directory correctly
  set :view, Proc.new { File.join(root,"views")}

  #Enable reloader
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = "Landing"
    erb :'main/landing'
  end

  get '/search' do
    erb :'main/index'
  end

  get '/search/*' do
    @search_by = params["search_by"]
    @search = params["search"]
    @title = "Landing"
    #@response = SearchByLyrics.new.query(params)
    erb :'main/search_results'
  end

  get '/search_lyrics/*' do
    @args = params
    erb :'main/search_lyrics'
  end
end
