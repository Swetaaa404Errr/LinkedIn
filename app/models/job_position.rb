class JobPosition < ApplicationRecord
  validates :jobdesignation, presence: true
end
