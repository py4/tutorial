class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validate :uniq_enrollment, before: 

  has_many :enrollments
  has_many :subjects, through: :enrollments 

  def uniq_enrollment
  end
end
