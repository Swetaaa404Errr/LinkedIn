# frozen_string_literal: true

class ApplyJobsController < ApplicationController
  before_action :set_current_user

  def new
    @apply_job = ApplyJob.new
  end

  def create
    @apply_job = ApplyJob.new(apply_job_params)

    if @apply_job.save
      redirect_to job_show_path, notice: 'Cv uploaded'
    else

      redirect_to job_show_path, notice: 'cv not uploaded'
    end
  end

  def apply_job_params
    params.require(:apply_job).permit(:cvv)
  end
end
