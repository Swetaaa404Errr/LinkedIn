# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :connector_id, scope: :connecting_id
end
