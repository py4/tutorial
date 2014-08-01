class Admin::TutorialsController < Admin::AdminController

	def show
		@tutorial = Subject.find(params[:id])
		@pages = @tutorial.pages
	end

	def index
		puts "holly fuck!"
		@tutorials = Subject.all
	end

	def new
		@tutorial = Subject.new
	end

	def edit
		@tutorial = Subject.find(params[:id])
	end

	def update
		@tutorial = Subject.find(params[:id])
		if @tutorial.update tutorial_params
			redirect_to [:admin, @tutorial], flash: { success: 'با موفقیت به روز شد' }
		else
			render 'edit'
		end
	end

	def destroy
		@tutorial = Subject.find(params[:id])
		if @tutorial.destroy
			redirect_to [:admin], flash: { success: 'با موفقیت حذف شد' }
		end
	end

	def create
		@tutorial = Subject.new tutorial_params
		if @tutorial.save
			redirect_to [:admin,@tutorial], flash: { success: 'با موفقیت ایجاد شد' }
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
