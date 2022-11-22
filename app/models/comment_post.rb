class CommentPost < ApplicationRecord
  belongs_to :job_navigation
  belongs_to :user
end
