class User < ApplicationRecord
  has_many :user_infs

  has_many :job_navigations

  has_many :comment_posts
  has_many :apply_jobs

  has_many :followers

  has_many :connections

  has_many :friends

  has_many :messages

  has_many :chats

  has_many :participants, dependent: :destroy

  has_one :profile

  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

  validates :username, presence: true,
                       length: { minimum: 3, maximum: 50 }

  scope :all_except, ->(user) { where.not(id: user) }

  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
