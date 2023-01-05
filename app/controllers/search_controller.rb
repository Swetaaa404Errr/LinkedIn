# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :set_current_user

  def index
    @q = User.ransack(params[:q])
    @userj = @q.result(distinct: true)
  end
end
