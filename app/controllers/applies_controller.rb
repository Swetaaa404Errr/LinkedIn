# frozen_string_literal: true

class AppliesController < ApplicationController
  before_action :set_current_user

  def create
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @apply = @job_navigation.applies.create(apply_params)

    return unless @apply.save

    author = @apply.job_navigation.user.email

    file = @apply.cv
    ApplyjobMailer.new_applyjob(author, file).deliver_now

    redirect_to job_navigation_path(@job_navigation)
  end

  def edit
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @apply = @job_navigation.applies.find(params[:job_navigation_id])
  end

  private

  def apply_params
    params.require(:apply).permit(:cv)
  end
end
