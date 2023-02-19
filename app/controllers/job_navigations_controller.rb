# frozen_string_literal: true

class JobNavigationsController < ApplicationController
  before_action :set_current_user

  before_action :require_admin, only: %i[destroy toggle_is_approved]

  respond_to :js, only: :vote

  def job; end

  

  def index
    @job_navigation = JobNavigation.all
  end

  def new
    @job_navigation = JobNavigation.new
  end

  def create
    @job_navigation = @current_user.job_navigations.new(job_navigation_params)

    if @job_navigation.save

      redirect_to job_part_path, notice: 'Successfully created For Job Vacancy and waiting for approval of admin'
    else
      render :new, notice: 'Please Provide valid data'
    end
  end

  def destroy
    @job_navigation = JobNavigation.find(params[:id])
    @job_navigation.destroy
    redirect_to job_navigations_path, notice: 'Review has been deleted successfully'
  end

  def toggle_is_approved
    @job_navigation = JobNavigation.find(params[:id])
    @job_navigation.update(is_approved: true)
    redirect_to job_navigations_path, notice: 'The review is successfully approved'
  end

  def show
    @job_navigation = JobNavigation.find(params[:id])
  end

  def all
    @job_navigation = JobNavigation.all
  end

 
  def vote
    @job_navigation = JobNavigation.find(params[:id])

  
      if !@current_user.liked? @job_navigation
        @job_navigation.liked_by @current_user
      elsif @current_user.liked? @job_navigation
      @job_navigation.unliked_by @current_user
      end
     
     
   
  end

  

  private

  def job_navigation_params
    params.require(:job_navigation).permit(:jobtitle, :jobdescription, :novac, :skill, :jobrole, :jobsector,
                                           user_id: [])
  end
end
