require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

use Rack::Reloader

use Rack::MethodOverride

run Rack::Cascade.new([
])
