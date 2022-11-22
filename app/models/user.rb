class User < ApplicationRecord

    has_one :user_inf

    has_many :job_navigations

     has_many :comment_posts

     has_many :apply_jobs

     has_many :followers

     has_many :connections

     has_many :friends

   
    
    has_secure_password

    has_many :followed_users, foreign_key: :sender_id, class_name: 'Friend'

    has_many :sendings, through: :followed_users

    has_many :following_users, foreign_key: :sending_id, class_name: 'Friend'

    has_many :senders, through: :following_users

    

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

    
   
end
