require 'yaml/store'

class Idea
	def initialize(title,description)
		@title 				= title
		@description 	= description
	end

	def save
		database.transaction do |db|
			db['ideas'] ||= []
			db['ideas'] << {title: @title, description: @description}
		end
	end

	def database
		@database ||= YAML::Store.new "ideabox"
	end
end