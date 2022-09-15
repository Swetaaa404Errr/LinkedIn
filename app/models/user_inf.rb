class UserInf < ApplicationRecord
  belongs_to :user

  validates :username, presence: true
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :prof_link, presence: true,url:{allow_blank: true}
  validates :qualification, presence: true
  validates :experience, presence: true
  
  validates :skills, presence: true
  validates :job_role, presence: true
  validates :notification, presence: true
 
  has_one_attached :image


 

end
