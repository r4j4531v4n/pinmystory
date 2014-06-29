class StoriesController < ApplicationController
	def create
		@story = Story.new(params[:story])
		@story.user_id = current_user.id
		if @story.save
			redirect_to current_user
		else
			flash[:error] = 'Contains 0 or more than 55 words!'
			redirect_to current_user
		end
	end

	def index
		@stories = Story.all include: :user
		@story = Story.new
	end
end
