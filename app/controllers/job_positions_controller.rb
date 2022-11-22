class JobPositionsController < ApplicationController


before_action :require_admin


def index
 
end

def new
    @job_position = JobPosition.new
end

def create
    
    @job_position = JobPosition.new(job_position_params)


    if @job_position.save
        redirect_to jobrole_show_path, notice: "Successfully added a jobrole"
    else
        render :new, notice: "Please Provide valid data"
end
end


def show
    @job_position = find_job_position
end

def destroy
    session[:job_position_id] = nil
    redirect_to jobadd_path, notice:"Deleted Job Role"
end


private

def job_position_params
    params.require(:job_position).permit(:jobdesignation)
end

def find_job_position
    JobPosition.find_by(jobdesignation: params[:jobdesignation])
end


end