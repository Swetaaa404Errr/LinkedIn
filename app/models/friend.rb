# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :sending, class_name: 'User'
  validates :sender_id, uniqueness: { scope: :sending_id }
  validates :sending_id, uniqueness: { scope: :sender_id }
end
