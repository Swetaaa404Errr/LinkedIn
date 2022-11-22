class JobNavsController < ApplicationController

    before_action :set_current_user

    before_action :require_user_logged_in!
    def index
    end

    def new
     
        @job_nav = JobNav.new

    end

    def create
        @job_nav = @current_user.job_navs.new(job_nav_params)
       


        if @job_nav.save
            session[:job_nav_id] = @job_nav.id
            redirect_to job_part_path, notice: "Successfully Posted For Job Vacancy"
        else
            render :new, notice: "Please Provide valid data"
        end

        
    end


def show
    
    @job_nav = JobNav.all
end



    private

    def job_nav_params
        params.require(:job_nav).permit(:jobtitle, :jobdescription, :novac, :skill, :jobrole, :jobsector )
    end

    
end