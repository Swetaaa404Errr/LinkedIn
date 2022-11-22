class JobNavigation < ApplicationRecord
  belongs_to :user

  has_many :apply_jobs
   
  has_many :comment_posts

    validates :jobtitle, presence: true
    validates :jobdescription, presence: true
    validates :novac, presence: true
    validates :skill, presence: true
    
    validates :jobrole, presence: true
  
    validates :jobsector, presence: true
end
