require 'sinatra'
require "sinatra/json"

get '/' do
	json :msg => "hello world!"
end