# require 'sinatra'
# require 'sinatra/reloader'

require 'bundler'
require './idea'
Bundler.require

class IdeaBoxApp < Sinatra::Base
  set :method_override, true

	get '/' do
		erb :index, locals: {ideas: Idea.all }
		# "<blockquote>I guess I always felt even if the world came to an end, McDonald's would still be open. <cite>Susan Beth Pfeffer</cite></blockquote>
		# <h1>Bella li'</h1>"
	end

	post '/' do
    # 1. create an Idea based on the form parameters
		idea = Idea.new(params['idea_title'],params['idea_description'])

    # 2. store it
		idea.save

    # 3. send the user back to the index
		# "Creating an IDEA!"
    redirect '/'
	end

  get '/:id/edit' do |id|
    "edit an idea"
  end

  delete '/:id' do |id|
    Idea.delete(id)
    redirect '/'
  end

	not_found do
		erb :error
	end
end
