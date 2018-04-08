require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './app/controllers/main_controller.rb'
require_relative './lib/api_parsing'

use Rack::Reloader

use Rack::MethodOverride

run Rack::Cascade.new([
  MainController
])
