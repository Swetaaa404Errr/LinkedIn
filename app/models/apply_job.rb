class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job_navigation

   has_one_attached :cvv


end
