class AppliesController < ApplicationController

  before_action :set_current_user
  
  def create
   
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @apply = @job_navigation.applies.create(apply_params)
    redirect_to job_navigation_path(@job_navigation)
  end

  
 
  private

  def apply_params
    params.require(:apply).permit(:cv) 
  end
end
