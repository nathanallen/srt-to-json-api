require 'sinatra'
require 'sinatra/json'
require_relative 'srt_parser'

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end

get '/' do
 url = params['url']
 if url
  url.gsub!(" ", "%20")
 	srt_file = %x( curl '#{url}' )
 	SRT_Parser.parse(srt_file)
 else
 	"no url provided"
 end
end
