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

  $errors = {
    "400" => "The request had bad syntax or was inherently impossible to be satisfied.",
    "401" => "Authentication failed, probably because of a bad API key.",
    "402" => "A limit was reached, either you exceeded per hour requests limits or your balance is insufficient.",
    "403" => "You are not authorized to perform this operation or the api version you're trying to use has been shut down.",
    "404" => "Requested resource was not found.",
    "405" => "Requested method was not found."
  }

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
    @errors = $errors
    erb :'main/search_results'
  end

  get '/search_lyrics/*' do
    @search = params
    @errors = $errors
    erb :'main/search_lyrics'
  end
end
