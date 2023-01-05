# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save

      author =

        JobMailer.cv_uploaded.deliver_later
      flash[:alert] = 'Successfully Applied'
      redirect_to job_show_path

    else
      redirect_to job_show_path, notice: 'Not Applied'
    end
  end

  def job_application_params
    params.permit(:cv)
  end
end
