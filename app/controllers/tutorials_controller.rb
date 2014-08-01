class TutorialsController < ApplicationController
	def index
		@tutorials = Subject.all
	end

	def show
		@tutorial = Subject.find(params[:id])
	end
end
