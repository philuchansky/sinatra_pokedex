require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'

get '/' do
	@title = "Pokedex!"

	api_result = RestClient.get "http://pokeapi.co/api/v1/pokedex"
	@pokemon = JSON.parse(api_result)["objects"][0]["pokemon"]
	erb :home
end

get '/json' do
	@title = "Pokedex! JSON"

	api_result = RestClient.get "http://pokeapi.co/api/v1/pokedex"
	@pokemon = JSON.parse(api_result)["objects"][0]["pokemon"]
	@pokemon.to_json

end