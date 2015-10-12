require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'

get '/' do
	@title = "Pokedex!"
end

get '/json' do
	@title = "Pokedex! JSON"
end