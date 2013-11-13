require 'sinatra'
require 'sinatra/json'
require_relative 'twitter_config'
require_relative 'user_data'

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end

get '/' do
	json USER_DATA
end

get '/:category/?*' do
	category = params[:captures][0].to_sym
	item = params[:captures][1].to_sym unless params[:captures][1] == ""
	item ? json(USER_DATA[category][item]) : json(USER_DATA[category])
end