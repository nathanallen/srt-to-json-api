require 'sinatra'
require "sinatra/json"


MY_DATA = {
	first_name: "Nathan",
	last_name: "Allen",
	title: "Junior Web Developer",
	github: "https://github.com/nathanallen",
	blog: "http://codeislike.com/",
	linkedin: "http://www.linkedin.com/in/thisisnathan",
	twitter: "https://twitter.com/punriddled",
	email: "first_name + lawrence + last_name@gmail.com",
}

get '/' do
	json MY_DATA
end

get '/:detail' do
	detail = params[:detail].to_sym
	MY_DATA[detail]
end