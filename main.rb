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

get '/:cat/?*' do
	cat = params[:captures][0].to_sym
	splat = params[:captures][1].to_sym unless params[:captures][1] == ""
	splat ? json(USER_DATA[cat][splat]) : json(USER_DATA[cat])
end