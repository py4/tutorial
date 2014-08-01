class Admin::AdminController < ApplicationController
	before_action :authenticate

	private
	def authenticate
		authenticate_or_request_with_http_basic do |user,password|
			user == 'admin' and password == 'admin'
		end
	end
end
