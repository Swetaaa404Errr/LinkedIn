class JobAppliesController < ApplicationController

     before_action :set_current_user

  before_action :set_current_job
  

 def create

    @job_nav = JobNav.find_by(params[:jobtitle])
    @job_applies = @job_nav.job_applies.new(job_applies_params)

    if @job_applies.save

      job_nav = JobNav.find_by(params[:jobtitle])
      

      @author = @job_applies.job_nav.user

      JobMailer.cv_uploaded(@author , @job_applies).deliver_later

        flash[:alert] = "Successfully Applied"
         redirect_to job_show_path 

    else
         redirect_to job_show_path , notice: "Not Applied"
    end
 end

 private

 def job_applies_params
    params.permit(:cv)
    
 end


end