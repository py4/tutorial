class TutorialsController < ApplicationController
	def index
		@tutorials = Subject.all
	end

	def show
		@tutorial = Subject.find(params[:id])
		@last_i = session[:tutorials][@tutorial.id.to_s]
	end
end
