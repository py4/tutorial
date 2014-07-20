class TutorialsController < ApplicationController
	def index
		@tutorials = Subject.all
	end
end
