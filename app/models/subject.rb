class Subject < ActiveRecord::Base
	has_many :pages
	has_many :enrollments
	has_many :users, through: :enrollments
end
