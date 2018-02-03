# require 'sinatra'
# require 'sinatra/reloader'

require 'bundler'
Bundler.require

class IdeaBoxApp < Sinatra::Base
	get '/' do
		erb :index
		# "<blockquote>I guess I always felt even if the world came to an end, McDonald's would still be open. <cite>Susan Beth Pfeffer</cite></blockquote>
		# <h1>Bella li'</h1>"
	end
end