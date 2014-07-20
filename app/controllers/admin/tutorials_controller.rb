class Admin::TutorialsController < ApplicationController

	def show
		@tutorial = Subject.find(params[:id])
		@pages = @tutorial.pages
	end

	def index
		@tutorials = Subject.all
	end

	def new
		@tutorial = Subject.new
	end

	def create
		@tutorial = Subject.new tutorial_params
		if @tutorial.save
			render 'show', flash: { success: 'با موفقیت ایجاد شد' }
		else
			render 'new'
		end
	end

	private
		def tutorial_params
			puts params
			params.require(:subject).permit(:title, :description, :writer)
		end
end
