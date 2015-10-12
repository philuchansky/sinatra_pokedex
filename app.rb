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
	@pokemon.each do |p|
		p['id'] = p['resource_uri'][15..-1].chop
		p['img_url'] = "http://pokeapi.co/media/img/#{p['id']}.png"
	end

	erb :home
end

get '/json' do
	@title = "Pokedex! JSON"

	api_result = RestClient.get "http://pokeapi.co/api/v1/pokedex"
	@pokemon = JSON.parse(api_result)["objects"][0]["pokemon"]
	@pokemon.each do |p|
		p['id'] = p['resource_uri'][15..-1].chop
		p['img_url'] = "http://pokeapi.co/media/img/#{p['id']}.png"
	end
	@pokemon.to_json

end