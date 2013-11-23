require 'sinatra'
require 'sinatra/json'

before do
	response.header['Access-Control-Allow-Origin'] = '*'
end

get '/' do
 url = params['url']
 if url
 	%x( curl '#{url}' )
 else
 	"no url provided"
 end
end
