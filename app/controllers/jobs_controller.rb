class JobssController < ApplicationController
  def new; end

  def create
    job_nav = JobNav.find_by(jobtitle: params[:jobtitle])
    if job_nav.present?
      session[:job_nav_id] = job_nav.id

    else
      flash[:alert] = 'Invalid email or password'

    end
  end
end
