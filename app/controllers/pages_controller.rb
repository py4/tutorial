class PagesController < ApplicationController

	def landing
	end

	def show
		@page = Page.find(params[:id])
		@tutorial = @page.subject

		last_index = session[:tutorials][@tutorial.id.to_s]
		sorted = @tutorial.pages.order(:created_at)
		index = sorted.index(@page)

		puts "last index: #{last_index}"
		puts "index: #{index}"
		if(index > last_index+1 and index != 0)
			flash[:alert] = 'عجله نکنید! ابتدا این صفحه را فرا بگیرید!'
			return redirect_to subject_page_path(@tutorial,sorted[last_index-1])
		end
	end

	def learn
		@page = Page.find(params[:page_id])
		tutorial = @page.subject
		sorted = tutorial.pages.order(:created_at)
		current_index = sorted.index(@page)

		if(session[:tutorials][tutorial.id.to_s]+1 == current_index)
			puts "#{Time.now}  |  successfully added!"
			session[:tutorials][tutorial.id.to_s] += 1

			if sorted.size == current_index + 1
				flash[:success] = 'تبریک می‌گیم! با موفقیت خودآموز را تمام کردید!'
				return redirect_to subject_path(tutorial)
			end

			flash[:success] = 'آفرین.'
			return redirect_to subject_page_path(tutorial, sorted[current_index+1])
		else
			puts "#{Time.now}  |  access denied!"
			flash[:alert] = 'نمی‌توانید!'
			redirect_to subject_path(tutorial)
		end

	end

end
