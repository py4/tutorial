class PagesController < ApplicationController

	def landing
	end

	def show
		@page = Page.find(params[:id])
		@tutorial = @page.subject
	end

end
