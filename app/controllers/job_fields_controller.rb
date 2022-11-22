class JobFieldsController < ApplicationController

      
  before_action :set_current_admin
    
    def new
        @job_field = JobField.new
    end
    
    def create
        
        @job_field = JobField.new(job_field_params)
    
    
        if @job_field.save
            redirect_to jobsector_show_path, notice: "Successfully added a jobsector"
        else
            render :new, notice: "Please Provide valid data"
    end
    end
    
    
    def show
        @job_field = find_job_field
    end
    
    def destroy
        session[:job_field_id] = nil
        redirect_to jobadd_path, notice:"Deleted Job Sector"
    end
    
    
    private
    
    def job_field_params
        params.require(:job_field).permit(:jobsection)
    end
    
    def find_job_field
        JobField.find_by(jobsection: params[:jobsection])
    end
    
    
    end