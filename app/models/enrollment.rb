class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  validate :uniq_pair

  def uniq_pair
  	if where("enrollments.user_id = ? AND enrollments.subject_id = ?", user_id, subject_id).any?
  		errors.add :not_uniq_pairs, 'قبلا عضو شده‌اید.'
  	end
  end
end
