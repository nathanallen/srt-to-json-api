require 'sinatra'
require 'sinatra/json'

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end
