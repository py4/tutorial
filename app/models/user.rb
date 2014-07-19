class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :surname, presence: true

  has_many :enrollments
  has_many :subjects, through: :enrollments 

  def admin?
  	admins = ["ibtkm2009@gmail.com"]
  	admins.include? email
  end
end
