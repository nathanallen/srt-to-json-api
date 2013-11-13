require 'twitter'

if ENV['RACK_ENV'] == 'development'
	require 'yaml'
	env_config = YAML.load_file('secret.yaml')
	env_config.each do |key, value|
	  ENV[key] = value
	end
end

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.oauth_token = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
end