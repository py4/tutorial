module ApplicationHelper
	def get_name user
		user.firstname + " " + user.surname
	end
end
