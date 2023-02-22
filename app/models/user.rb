# frozen_string_literal: true

class User < ApplicationRecord

   
  has_many :user_infs

  has_many :job_navigations, dependent: :destroy

  has_many :apply_jobs, dependent: :destroy

  has_many :chats, dependent: :destroy

  has_many :participants, dependent: :destroy

  has_many :user_accounts
  has_many :likes

  has_many :applies

  has_secure_password

   



  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

  validates :username, presence: true,
                       length: { minimum: 3, maximum: 50 }

  scope :all_except, ->(user) { where.not(id: user) }

  devise :omniauthable,
         omniauth_providers: %i[linkedin]

  def self.new_with_session(params, session)
    super.tap do |user|
      if ((data = session['devise.linkedin_data'] && session['devise.linkedin_data']['extra']['raw_info'])) && user.email.blank?
        user.email = data['email']
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture_url = auth.info.picture_url
      user.password = Devise.friendly_token[0, 20]
    end
  end

  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
