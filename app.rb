# require 'sinatra'
# require 'sinatra/reloader'

require 'bundler'
require './idea'
Bundler.require

class IdeaBoxApp < Sinatra::Base
	get '/' do
		@ideas = Idea.all
		erb :index
		# "<blockquote>I guess I always felt even if the world came to an end, McDonald's would still be open. <cite>Susan Beth Pfeffer</cite></blockquote>
		# <h1>Bella li'</h1>"
	end

	post '/' do
		idea = Idea.new(params['idea_title'],params['idea_description'])
		idea.save
		"Creating an IDEA!"
	end

	not_found do
		erb :error
	end
end