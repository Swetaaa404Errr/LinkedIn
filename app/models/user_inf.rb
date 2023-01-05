# frozen_string_literal: true

class UserInf < ApplicationRecord
  belongs_to :user

  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

  validates :qualification, presence: true
  validates :experience, presence: true

  validates :skills, presence: true

  validates :job_role, presence: true

  has_one_attached :image

  has_one_attached :cv

  has_many_attached :certificates
end
