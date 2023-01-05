# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :job_nav
  belongs_to :user
end
