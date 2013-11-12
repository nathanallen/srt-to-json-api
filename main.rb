require 'sinatra'
require "sinatra/json"
require 'twitter'

YOUR_CONSUMER_KEY = "ZK8Yb7AHWn5bY3SW2o8Yg"
YOUR_CONSUMER_SECRET = "16arWqAg5FToVLcuv1sIwmENzrrwcp1hEaDYe2AUKo"
YOUR_OAUTH_TOKEN = "1482402961-BqN6UbMfy7sUdGHEvEqUzkwvaMS1tfLSRFto0Tl"
YOUR_OAUTH_TOKEN_SECRET = "bDux66E77MUVgzx0iWDWUzwCYdX2dm4ugYzGn9JVOtW0E"

Twitter.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
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


get '/' do
	json MY_DATA
end

get '/:detail' do
	detail = params[:detail].to_sym
	json MY_DATA[detail]
end