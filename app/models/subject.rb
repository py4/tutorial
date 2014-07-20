class Subject < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :enrollments, dependent: :destroy
	has_many :users, through: :enrollments

	validates :title, presence: true
	validates :description, presence: true
	validates :writer, presence: true
end
