class Apply < ApplicationRecord
  belongs_to :job_navigation
  has_one_attached :cv
end
