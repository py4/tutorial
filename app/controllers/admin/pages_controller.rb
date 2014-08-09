class Admin::PagesController < Admin::AdminController
	before_action :set_tutorial

	def show
		@page = @tutorial.pages.find(params[:id])
	end

	def edit
		@page = @tutorial.pages.find(params[:id])
	end

	def new
		@page = @tutorial.pages.new
	end

	def update
		@page = @tutorial.pages.find(params[:id])
		if @page.update(page_params)
			redirect_to ['admin',@tutorial], flash: { success: 'صفحه با موفقیت به روز شد.' }
		else
			render 'edit'
		end
	end

	def create
		@page = @tutorial.pages.new page_params
		if @page.save
			redirect_to ['admin',@tutorial], flash: { success: 'صفحه با موفقیت ایجاد شد.' }
		else
			render 'new'
		end
	end

	def destroy
		@page = @tutorial.pages.find(params[:id])
		if @page.destroy
			redirect_to ['admin',@tutorial], flash: { success: 'صفحه با موفقیت حذف شد شد.' }
		end
	end

	private
		def set_tutorial
			@tutorial = Subject.find(params[:subject_id])
		end

		def page_params
			params.require(:page).permit(:content, :title)
		end
end
