class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cookie

  def set_cookie
  	puts "session: #{session[:tutorials]}"
  	session[:tutorials] ||= {}
  	Subject.all.each do |subject|
  		session[:tutorials]["#{subject.id}"] ||= -1
  	end
  end
end
