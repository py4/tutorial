class Admin::PagesController < ApplicationController
	before_action :set_tutorial

	def new
		@page = @tutorial.pages.new
	end

	def create
		@page = @tutorial.pages.new page_params
		if @page.save
			redirect_to ['admin',@tutorial], flash: { success: 'صفحه با موفقیت ایجاد شد.' }
		else
			render 'new'
		end
	end

	private
		def set_tutorial
			@tutorial = Subject.find(params[:subject_id])
		end

		def page_params
			params.require(:page).permit(:content)
		end
end
