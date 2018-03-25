require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './app/controllers/main_controller.rb'
require_relative './app/controllers/static_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run Rack::Cascade.new([
  MainController,
  StaticController
])
