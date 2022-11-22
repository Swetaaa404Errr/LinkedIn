class JobNav < ApplicationRecord

    belongs_to :user
     has_many :comments

     has_many :job_applies

    validates :jobtitle, presence: true
    validates :jobdescription, presence: true
    validates :novac, presence: true
    validates :skill, presence: true
    
    validates :jobrole, presence: true
  
    validates :jobsector, presence: true
  
end
