# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_current_job

  def create
    @job_nav = JobNav.find(params[:job_nav_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to job_show_path
    else

      redirect_to root_path, notice: 'User Info Saved'
    end
  end

  def comment_params
    params.permit(:name, :body)
  end
end
