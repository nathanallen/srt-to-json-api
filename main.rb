require 'sinatra'
require 'sinatra/json'

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end

get '/' do
 `curl http://new.outloudradio.org/sites/default/files/transcripts/Asexuality_FAQ.en_.srt`
end