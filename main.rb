require 'sinatra'
require 'sinatra/json'
require 'twitter'
require 'yaml'

env_config = YAML.load_file('./env.yaml')

env_config.each do |key, value|
  ENV[key] = value
end

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.oauth_token = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
end

MY_DATA = {
	contact: {
		first_name: "Nathan",
		last_name: "Allen",
		title: "Junior Web Developer",
		github: "https://github.com/nathanallen",
		blog: "http://codeislike.com/",
		linkedin: "http://www.linkedin.com/in/thisisnathan",
		twitter: "https://twitter.com/punriddled",
		email: "first_name + lawrence + last_name@gmail.com",
	},
	status: {
		awake: (Time.now.hour > 8 && Time.now.hour < 23),
		last_tweet: Twitter.user_timeline("punriddled", count: 1).first[:text]
	},
}

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end

get '/' do
	json MY_DATA
end

get '/:cat/?*' do
	cat = params[:captures][0].to_sym
	splat = params[:captures][1].to_sym unless params[:captures][1] == ""
	splat ? json(MY_DATA[cat][splat]) : json(MY_DATA[cat])
end