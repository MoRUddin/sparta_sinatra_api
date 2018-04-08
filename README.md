# sparta_sinatra_api

## Task
Create a Sinatra app to query and display the response of an API. Write a test suite for the API.

## Delivered
A multi-optioned search bar that allows users to search for their favourite lyrics, or directly for the track names.

## Requirements
* Ruby (built in 5.1.5)
* The rspec gem
* The JSON gem
* The HTTParty gem
* The Sinatra gem
* The Rack gem

## Running Tests
* `git clone` the HTML link from [here](https://github.com/MoRUddin/sparta_sinatra_api) to download the project to your local environment
* run `bundle` to install all the gems
* run `rspec` on the project folder to run the tests
* run `rackup` on the project folder to host the webapp
* go to the specified port in you browser [(probably here)](localhost:9292) to use the webapp

## Main challenges
* understanding how the API works (using the [documentation](https://developer.musixmatch.com/documentation))
* building a working searchbar to query the API
* future implementations: adding methods to insert user's own API Key
