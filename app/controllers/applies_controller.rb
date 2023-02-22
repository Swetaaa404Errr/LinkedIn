# frozen_string_literal: true

class AppliesController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!
  before_action :find_post

  def create
    if already_applied?
      flash[:notice] = 'You cant apply more than once'
    else
      @apply = @job_navigation.applies.create(user_id: @current_user.id)
      return unless @apply.save

      author = @apply.job_navigation.user.email

      file = @apply.cv
      ApplyjobMailer.new_applyjob(author, file).deliver_now
    end
    redirect_to job_navigation_path(@job_navigation)
  end

  private

  def find_post
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
  end

  def already_applied?
    Apply.where(user_id: @current_user.id, job_navigation_id: params[:job_navigation_id]).exists?
  end

  def find_apply
    @apply = @job_navigation.applies.find(params[:id])
  end
end
