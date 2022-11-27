class User < ApplicationRecord

    has_one :user_inf

    has_many :job_navigations

     has_many :comment_posts

     has_many :apply_jobs

     has_many :followers

     has_many :connections

     has_many :friends

   
    
    has_secure_password

    

    

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

    followability

    def unfollow(user)
      followerable_relationships.where(followable_id: user.id).destroy_all
    end

    
   
end
